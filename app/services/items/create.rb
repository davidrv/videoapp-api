module Items
  class Create < ::BaseService
    attr_reader :list, :url, :model

    def initialize(list:, url:)
      @list  = list
      @url   = url
      @model = list.items.new

      raise "Video URL required" unless url.present?
    end

    def call
      @model.attributes = get_video_info
      @model.url        = url

      if @model.save
        @result = true
      else
        @errors = model.errors
      end

      respond!
    end

    private

    def get_video_info
      video = VideoInfo.new(url)

      sanitize_video_info(video)
    end

    def sanitize_video_info(video)
      {
        available: video.available?,
        video_id: video.video_id,
        provider: video.provider,
        title: video.title,
        description: video.description,
        duration: video.duration,
        date: video.date,
        thumbnail_small: video.thumbnail_small,
        thumbnail_medium: video.thumbnail_medium,
        thumbnail_large: video.thumbnail_large,
        embed_url: video.embed_url,
        embed_code: video.embed_code,
        author: video.author,
        author_thumbnail: video.author_thumbnail,
        author_url: video.author_url,
        keywords: video.keywords
      }
    end
  end
end

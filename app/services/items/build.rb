# frozen_string_literal: true

module Items
  class Build
    attr_reader :list, :url

    def initialize(list:, url:)
      @list  = list
      @url   = url
    end

    def call
      item     = list.items.new(video_info)
      item.url = url
      item
    end

    private

    def video_info
      video = VideoInfo.new(url)
      sanitize_video_info(video)
    end

    # rubocop:disable Metrics/MethodLength
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
        # TODO: Investigate why the gem is not being able to parse some info
        # `convert_to_uri': bad argument (expected URI object or URI string) (ArgumentError)
        # author: video.author,
        # author_thumbnail: video.author_thumbnail,
        # author_url: video.author_url,
        keywords: video.keywords
      }
    end
    # rubocop:enable Metrics/MethodLength
  end
end

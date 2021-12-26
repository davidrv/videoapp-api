# frozen_string_literal: true

json.extract! item, :id, :list_id, :available, :video_id, :provider, :title, :description, :duration, :date,
              :thumbnail_small, :thumbnail_medium, :thumbnail_large, :embed_url, :embed_code, :author, :author_thumbnail, :author_url, :keywords, :created_at, :updated_at
json.url item_url(item, format: :json)

FactoryBot.define do
  factory :item do
    list
    available { false }
    video_id { SecureRandom.uuid }
    url { "http://youtube.com/#{video_id}" }
    provider { "youtube" }
    title { Faker::Movie.title }
    description { Faker::Lorem.paragraph(sentence_count: 5) }
    duration { rand(3_600) }
    date { Faker::Date.between(from: 2.years.ago, to: Date.today) }
    thumbnail_small { "https://file-examples-com.github.io/uploads/2017/10/file_example_JPG_100kB.jpg" }
    thumbnail_medium { "https://file-examples-com.github.io/uploads/2017/10/file_example_JPG_500kB.jpg" }
    thumbnail_large { "https://file-examples-com.github.io/uploads/2017/10/file_example_JPG_1MB.jpg" }
    embed_url { "http://youtu.be/#{video_id}" }
    embed_code { "<iframe src=\"//www.youtube.com/embed/#{video_id}\" ' \
                 'frameborder=\"0\" allowfullscreen=\"allowfullscreen\">' \
                 '</iframe>" }
    author { Faker::JapaneseMedia::DragonBall.character }
  end
end

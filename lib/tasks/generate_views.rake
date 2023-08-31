desc 'Generate fake views for existing Items'
task generate_views: :environment do
  raise "Not available in production!" if Rails.env == 'production'

  print "This will generate fake views for all your current lists and items.\nThis may mess up your existing data.\nAre you sure you still want to proceed? "
  answer = STDIN.gets.chomp
  raise "Will not continue based on your answer. Please, type 'Y' the next time! ;)" unless answer.downcase == 'y'

  end_date = Date.current
  start_date = end_date - 30.days
  progressbar = ProgressBar.create(total: Item.count)

  # Hoping not many records in dev or test
  Item.all.each do |item|
    (start_date..end_date).each do |date|
      rand(5..25).times do
        random_time = Time.new(date.year, date.month, date.day) + rand(24 * 60 * 60)
        item.item_views.create!(time: random_time)
      end
    end
    progressbar.increment
  end
end

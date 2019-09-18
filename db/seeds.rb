require 'faker'
require_relative("../lib/tasks/scrape")
puts "Resetting All User Gifts"
UserGift.destroy_all
puts "Deleting All Photos"
Photo.destroy_all
puts "Resetting All Bookings"
Booking.destroy_all
puts "Resetting All User Styles"
UserStyle.destroy_all
puts "Resetting All Styles"
Style.destroy_all
Booking.destroy_all
puts "Resetting All Users"
User.destroy_all
puts "Resetting All Gyms"
Gym.destroy_all
puts "Deleting All Gifts"
Gift.destroy_all

# Seed File for gyms

results_gyms = gymscraper("https://studiosuche.de/fitness/berlin?lg-ad=go2-228809787997-48242724696-b-m&gclid=CjwKCAiAwojkBRBbEiwAeRcJZJJexXjV-CBH52TYlnlyhKRlhX4cS4aYyvPvBAc8s8qhkkl1Y11htBoC78EQAvD_BwE")


results_gyms[0..14].each do |location_gym|
  gym = Gym.new(
    name: location_gym[:name],
    address: location_gym[:address],
  )
  gym.remote_photo_url = location_gym[:photo]
  gym.save!
end
puts "#{Gym.count} gyms created"
# Seed File for training styles

training_style = ["Bodybuilding", "Cardio", "Powerlifting", "Crossfit", "Boxing", "Calisthenics"]
puts "creating styles"
style_png = {
  "Bodybuilding": "https://cloud.bandolon.me/index.php/apps/files_sharing/ajax/publicpreview.php?x=1366&y=240&a=true&file=gorilla.png&t=vfgeRH4upAIpbqY&scalingup=0",
  "Cardio": "https://cloud.bandolon.me/index.php/apps/files_sharing/ajax/publicpreview.php?x=1366&y=240&a=true&file=jaguar.png&t=ECA2t8Q5U0LvyoX&scalingup=0",
  "Powerlifting": "https://cloud.bandolon.me/index.php/apps/files_sharing/ajax/publicpreview.php?x=1366&y=240&a=true&file=elephant.png&t=kcHJrIlo5mmN8ih&scalingup=0",
  "Crossfit": "https://cloud.bandolon.me/index.php/apps/files_sharing/ajax/publicpreview.php?x=1366&y=240&a=true&file=tiger.png&t=6Rv1zi18aopU1LN&scalingup=0",
  "Boxing": "https://cloud.bandolon.me/index.php/apps/files_sharing/ajax/publicpreview.php?x=1366&y=240&a=true&file=kangaroo.png&t=czAhQQVEkHT9OER&scalingup=0",
  "Calisthenics": "https://cloud.bandolon.me/index.php/apps/files_sharing/ajax/publicpreview.php?x=1366&y=240&a=true&file=fox.png&t=4UCLaFlB3tujcO5&scalingup=0"
}

training_style.each do |style_name|
  style = Style.new(name: style_name)
  style.remote_photo_url = style_png[style.name.to_sym]
  style.save
end

puts "#{Style.count} Styles created"

# Seed File for users

gender = ["male", "female"]
veteran = [true , false]
pirate = [true , false]
beach = [true , false]
summer = [true , false]
book = [true , false]
vegetable = [true , false]
bicycle = [true , false]

female_images = [
  # "https://greatist.com/sites/all/themes/greatist2x/images/mostinfluential2018/widerstrom_jen.jpg",
  "https://greatist.com/sites/all/themes/greatist2x/images/mostinfluential2018/tilghman_lee.jpg",
  "https://greatist.com/sites/all/themes/greatist2x/images/mostinfluential2018/keranen_kaisa.jpg",
  "https://images.unsplash.com/photo-1546817372-628669db4655?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=751&q=80",
  "https://images.unsplash.com/photo-1533681904393-9ab6eee7e408?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
  "https://images.unsplash.com/photo-1548723307-22cef42dc486?ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80",
  "https://images.unsplash.com/photo-1518310551420-539ccb4da386?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
  "https://images.unsplash.com/photo-1528304270437-714a2d6fbb6b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80",
  "https://images.pexels.com/photos/159745/hurdles-track-race-competition-159745.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
]


male_images = [
  "https://greatist.com/sites/all/themes/greatist2x/images/mostinfluential2018/gaskins_jr_tony.jpg",
  "https://greatist.com/sites/all/themes/greatist2x/images/mostinfluential2018/rooney_martin_2.jpg",
  "https://greatist.com/sites/all/themes/greatist2x/images/mostinfluential2018/wesleysmith_chad.jpg",
  "https://greatist.com/sites/all/themes/greatist2x/images/mostinfluential2018/harper_bob.jpg",
  "https://greatist.com/sites/default/files/horton_tony_large.jpg",
  "https://greatist.com/sites/all/themes/greatist2x/images/mostinfluential2018/schwarzenegger_arnold.jpg",
  "https://images.pexels.com/photos/1851795/pexels-photo-1851795.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
]

puts "adding additional gifts"

results = scraper("https://de.myprotein.com/nutrition/bestsellers-de-de.list?pageNumber=1&facetFilters=myprotein_EUR_price:%5B10+TO+15%5D")

times = ["1hr", "30min"]
results.each do |product|
  item = Gift.new(
    name: product[:name],
    price: product[:price][0].gsub(",", "."),
    time: times.sample
  )
  item.remote_photo_url = product[:photo][0]
  item.save!
end

puts 'Creating 60 fake users...'

30.times do
  user = User.new(
    name: Faker::Name.male_first_name,
    email: Faker::Internet.safe_email(:first_name),
    gender: gender[0],
    age: rand(18..35),
    password: Faker::Internet.password(10, 20),
    description: "Love going to the gym to clear my mind!",
    veteran: true,
    gym_id: Gym.all.sample.id,
    pirate: pirate.sample,
    beach: beach.sample,
    summer: summer.sample,
    book: book.sample,
    vegetable: vegetable.sample,
    bicycle: bicycle.sample)
  user.remote_photo_url = male_images.sample
  user.save!
end

30.times do
  user = User.new(
    name: Faker::Name.female_first_name,
    email: Faker::Internet.safe_email(:first_name),
    gender: gender[1],
    age: rand(18..35),
    password: Faker::Internet.password(10, 20),
    description: "Love going to the gym to clear my mind!",
    veteran: true,
    gym_id: Gym.all.sample.id,
    pirate: pirate.sample,
    beach: beach.sample,
    summer: summer.sample,
    book: book.sample,
    vegetable: vegetable.sample,
    bicycle: bicycle.sample)
  user.remote_photo_url = female_images.sample
  user.save!
end

puts "#{User.count} users created"


puts "randomly assigning User Styles"





User.all.each do |user|
  random_styles = Style.all.sample(2)
  random_styles.each do |style|
    user_style = UserStyle.new
    user_style.style_id = style.id
    user_style.user_id = user.id
    user_style.save!
  end
end





puts "All Veterans now have 2 styles each"

#seed file for multiple images

# puts "creating images for onse user..."

puts "adding additional images to each vetran profile"

users_images = [
  "https://img.grouponcdn.com/deal/41c6fe0b8c8d45538b78bdedd15fce5b/5b/v1/c700x420.jpg",
  "https://www.sportsdirect.com/images/marketing/run-tab-mens-nimbus-500x356.jpg",
  "https://maggiedaleypark.com/maggiedaley/wp-content/uploads/2018/05/IMG_1548-1.jpg",
  "https://www.gotahoenorth.com/wp-content/uploads/2015/03/fishing_hot_spots_content_images_305x305.jpg",
  "https://www.homeandboatitaly.com/wp-content/uploads/jogging-tour-rome.jpg",
  "https://www.gvsu.edu/cms4/asset/5544B4FE-BCBD-AD8C-D42E10F15CAA1C81/170828_climbingcenter-5207(2).jpg",
  "https://uccexpress.ie/wp-content/uploads/2018/10/jogging.jpg",
  "https://images.thrillophilia.com/image/upload/s--OuTQBkG_--/c_fill,f_auto,fl_strip_profile,h_600,q_auto,w_975/v1/images/photos/000/013/717/original/kayaking.jpg.jpg?1453307444",
  "https://cdn.hobiecat.com/digital_assets/ColorPageHeader3.jpg",
  "http://www.timetoclimb.com/wp-content/uploads/2017/09/Paul-Robinson-bouldering-AK-photo.png",
  "https://s3.amazonaws.com/images.gearjunkie.com/uploads/2017/03/bouldering-trend-on-rise-3x2.jpg",
  "http://www.pimhendriksen.com/wp-content/uploads/2015/02/website-17.jpg",
  "https://154013-475334-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2018/06/cookingmatters_1080x1200.jpg",
  "https://assets.simpleviewinc.com/simpleview/image/upload/crm/napavalley/cooking-ingredients-with-avocado-mushrooms-eggs0_83f810cf-5056-a36a-0831a4257db51c50.jpg",
  "https://images.unsplash.com/photo-1551024837-d8b07c2f9fbe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80"


]


  #new collection of images

  6.times do
    User.veteran.each do |user|
      photo = Photo.new(user_id: user.id)
      photo.remote_photo_url = users_images.sample
      photo.save!
    end
  end

puts "Creating Randomized Gifts for Vets"

gifts = Gift.all
User.all.each do |vet|
  random_gifts = gifts.sample(5)
  random_gifts.each do |gift|
    UserGift.create(user_id: vet.id, gift_id: gift.id)
  end
end





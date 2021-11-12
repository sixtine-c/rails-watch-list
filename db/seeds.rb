# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'reinitializing the data'
Movie.destroy_all


puts 'adding movies'
require 'json'
require 'open-uri'
url = 'http://tmdb.lewagon.com/movie/top_rated'
poster = 'https://image.tmdb.org/t/p/w200'
movies = JSON.parse(URI.open(url).read)
movies['results'].each do |movie|
  puts "Adding #{movie['title']}..."
  title = movie['title']
  overview = movie['overview']
  rating = movie['vote_average']
  poster_url = "#{poster}#{movie['poster_path']}"
  Movie.create(title: title, overview: overview, rating: rating, poster_url: poster_url)
end
puts 'done'

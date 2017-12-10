# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

User.find_or_create_by email: 'moviestore@moviestore.com', name: 'MovieStore', role_id: 4,
                       encrypted_password: '$2a$11$c2DgG6.Bo8b850Hj1wI/Hem236H8P5QMwIOqSf0LZBqBxIOOLt/j2'

CSV.foreach(Rails.root.join('db/seeds_data/movies.csv'), headers: false) do |row|
  Movie.find_or_create_by(title: row[1], release_year: row[2], price: row[3],
                          description: row[4], imdb_id: row[5], poster_url: row[6],
                          seller_id: row[9])
end
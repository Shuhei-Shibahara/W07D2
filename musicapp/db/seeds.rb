# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Band.destroy_all

%w(bands).each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
end

b1 = Band.create!(name: 'Zomboy')
b2 = Band.create!(name: 'Slander')
b1 = Band.create!(name: 'Ray Volpe')

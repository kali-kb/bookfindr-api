# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Book.create!(id:1, title: "Atomic Habits: Tiny Changes, Remarkable Results" , download_link: "https://download.library.lol/main/2274000/96f997237d1fffe83467f130c350f275/James%20Clear%20-%20Atomic%20Habits_%20Tiny%20Changes%2C%20Remarkable%20Results-Penguin%20Publishing%20Group%20%282018%29.epub", cover: "library.lol/covers/2274000/96f997237d1fffe83467f130c350f275-d.jpg", author: "Author(s): James Clear")
Book.create!(id:2, title: "The Lean Startup: How Today's Entrepreneurs Use Continuous Innovation to Create Radically Successful Businesses   0307887898, 9780307887894", download_link: "https://download.library.lol/main/758000/92a019dca81f725b44dfea5063f7f326/Eric%20Ries%20-%20The%20Lean%20Startup_%20How%20Today%27s%20Entrepreneurs%20Use%20Continuous%20Innovation%20to%20Create%20Radically%20Successful%20Businesses%20%20-Crown%20Business%20%282011%29.pdf", cover: "library.lol/covers/758000/92a019dca81f725b44dfea5063f7f326-d.jpg", author: "Author(s): Eric Ries")
Book.create!(id:3, title: "Zero to One: Notes on Startups, or How to Build the Future", download_link: "https://download.library.lol/main/1208000/81e169c36fc303fa1f36221d3e68a4d0/Peter%20Thiel%2C%20Blake%20Masters%20-%20Zero%20to%20One_%20Notes%20on%20Startups%2C%20or%20How%20to%20Build%20the%20Future-Crown%20Business%20%282014%29.mobi", cover: "library.lol/covers/1208000/81e169c36fc303fa1f36221d3e68a4d0-d.jpg", author: "Author(s): Peter Thiel, Blake Masters")
Book.create!(id:4, title: "The Personal MBA: Master the Art of Business 1591843529, 0670919519, 9781591843528", download_link: "https://download.library.lol/main/535000/8bc6bc5cf1263e881656e0bfbb2fc644/Josh%20Kaufman%20-%20The%20Personal%20MBA_%20Master%20the%20Art%20of%20Business-Portfolio%20Hardcover%20%282010%29.epub", cover: "library.lol/covers/535000/8bc6bc5cf1263e881656e0bfbb2fc644-d.jpg", author: "Author(s): Josh Kaufman")

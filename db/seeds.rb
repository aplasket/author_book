# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

author_1 = Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )
author_2 = Author.create!(name: "Maya Angelou", currently_alive: false, age: 86 )
author_3 = Author.create!(name: "Brene Brown", currently_alive: true, age: 57 )


book_1 = author_1.books.create!(title: "Harry Potter and the Sorcerer's Stone", price: 10, rating: 8.9, purchasable_online: true)
book_2 = author_1.books.create!(title: "Harry Potter and the Philosopher's Stone", price: 471000, rating: 3.9, purchasable_online: false)
book_3 = author_2.books.create!(title: "I Know Why the Caged Bird Sings", price: 24, rating: 9.9, purchasable_online: true)
book_4 = author_2.books.create!(title: "Complete Autobiography and Poems", price: 20, rating: 7.9, purchasable_online:false)
book_5 = author_3.books.create!(title: "Daring Greatly", price: 15, rating: 7.0, purchasable_online: true)
book_6 = author_3.books.create!(title: "Women and Shame, Original Manuscript", price: 225, rating: 9.1, purchasable_online: false)
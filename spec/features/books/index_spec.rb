require "rails_helper"

RSpec.describe "/books (Book Index Page)", type: :feature do
  #user story 3
  describe "As a visitor, when I visit /books" do
    let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}
    let!(:author_2) { Author.create!(name: "Maya Angelou", currently_alive: false, age: 86 )}

    let!(:book_1) { author_1.books.create!(title: "Harry Potter and the Sorcerer's Stone", price: 10, rating: 8.9, purchasable_online: true)}
    let!(:book_2) { author_1.books.create!(title: "Harry Potter and the Wild Child", price: 2, rating: 3.9, purchasable_online: false)}
    let!(:book_3) { author_2.books.create!(title: "I Know Why the Caged Bird Sings", price: 24, rating: 9.9, purchasable_online: true)}
    
    it "I see all books and their attributes" do
      visit "/books"

      expect(page).to have_content(book_1.title)
      expect(page).to have_content("Price: #{book_1.price}")
      expect(page).to have_content("Rating: #{book_1.rating}")
      expect(page).to have_content("Purchasable Online: #{book_1.purchasable_online}")
      expect(page).to have_content("Book_id: #{book_1.id}")
      expect(page).to have_content("Author_id: #{book_1.author_id}")
      
      expect(page).to have_content(book_2.title)
      expect(page).to have_content("Price: #{book_2.price}")
      expect(page).to have_content("Rating: #{book_2.rating}")
      expect(page).to have_content("Purchasable Online: #{book_2.purchasable_online}")
      expect(page).to have_content("Book_id: #{book_2.id}")
      expect(page).to have_content("Author_id: #{book_2.author_id}")
      
      expect(page).to have_content(book_3.title)
      expect(page).to have_content("Price: #{book_3.price}")
      expect(page).to have_content("Rating: #{book_3.rating}")
      expect(page).to have_content("Purchasable Online: #{book_3.purchasable_online}")
      expect(page).to have_content("Book ID: #{book_3.id}")
      expect(page).to have_content("Author ID: #{book_3.author_id}")
      
      # save_and_open_page
    end
  end

  describe "As a visitor, when I visit /books/:id" do
    let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}
    let!(:author_2) { Author.create!(name: "Maya Angelou", currently_alive: false, age: 86 )}

    let!(:book_1) { author_1.books.create!(title: "Harry Potter and the Sorcerer's Stone", price: 10, rating: 8.9, purchasable_online: true)}
    let!(:book_2) { author_1.books.create!(title: "Harry Potter and the Wild Child", price: 2, rating: 3.9, purchasable_online: false)}
    
    it "I see each book and all of it's attributes" do
      visit "/books/#{book_1.id}"

      expect(page).to have_content("#{book_1.title}")
      expect(page).to have_content("Price: #{book_1.price}")
      expect(page).to have_content("Rating: #{book_2.rating}")
      expect(page).to have_content("Purchasable Online: #{book_2.purchasable_online}")
    end
  end
end
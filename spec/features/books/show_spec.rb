require "rails_helper"

RSpec.describe "/books/:id", type: :feature do
   #user story #4
  describe "As a visitor, when I visit /books/:id" do
    let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}
    let!(:author_2) { Author.create!(name: "Maya Angelou", currently_alive: false, age: 86 )}

    let!(:book_1) { author_1.books.create!(title: "Harry Potter and the Sorcerer's Stone", price: 10, rating: 8.9, purchasable_online: true)}
    let!(:book_2) { author_1.books.create!(title: "Harry Potter and the Wild Child", price: 2, rating: 3.9, purchasable_online: false)}
    let!(:book_3) { author_2.books.create!(title: "I Know Why the Caged Bird Sings", price: 24, rating: 9.9, purchasable_online: true)}
    
    it "I see each book and all of it's attributes" do
      visit "/books/#{book_1.id}"

      expect(page).to have_content("#{book_1.title}")
      expect(page).to have_content("Price: $#{book_1.price}")
      expect(page).to have_content("Rating: #{book_1.rating}")
      expect(page).to have_content("Purchasable Online: #{book_1.purchasable_online}")
      expect(page).to have_content("Book ID: #{book_1.id}")
      expect(page).to have_content("Author ID: #{book_1.author_id}")
    end
    
    #user story 14
    it "I can update the book's details via a form" do
      visit "/books/#{book_1.id}"
      click_link("Update Book")
      
      expect(current_path).to eq("/books/#{book_1.id}/edit")
      
      fill_in("Rating", with: 4.1)
      fill_in("Price", with: 8)
      
      click_button("Save Changes")

      expect(current_path).to eq("/books/#{book_1.id}")
      expect(page).to have_content(4.1)
      expect(page).to have_content(8)
    end
  end
end
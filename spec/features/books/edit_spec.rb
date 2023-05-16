require "rails_helper"

RSpec.describe "/books/:id/edit", type: :feature do
  let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}

  let!(:book_1) { author_1.books.create!(title: "Harry Potter and the Sorcerer's Stone", price: 10, rating: 8.9, purchasable_online: true)}
  
  describe "As a visitor to /books/:id" do
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
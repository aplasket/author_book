require "rails_helper"

RSpec.describe "#edit" do
  let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}

  let!(:book_1) { author_1.books.create!(title: "Harry Potter and the Sorcerer's Stone", price: 10, rating: 8.9, purchasable_online: true)}

  describe "when I visit /authors/:id/books" do
    it "I see a link to edit each book" do
      visit "/authors/#{author_1.id}/books"

      click_link "Update Book"

      expect(current_path).to eq("/books/#{book_1.id}/edit")

      fill_in("Title", with: "HP's Sorcerer Stone")
      fill_in("Price", with: 8)
      fill_in("Rating", with: 4.1)
      fill_in("Purchasable online", with: true)
      
      click_button("Save Changes")

      expect(current_path).to eq("/books/#{book_1.id}")
      expect(page).to have_content("HP's Sorcerer Stone")
      expect(page).to have_content(8)
      expect(page).to have_content(4.1)
      expect(page).to have_content(true)
    end
  end
end
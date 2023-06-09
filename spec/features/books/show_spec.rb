require "rails_helper"

RSpec.describe "/books/:id", type: :feature do
  #user story #4
  describe "As a visitor, when I visit /books/:id" do
    let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}

    let!(:book_1) { author_1.books.create!(title: "Harry Potter and the Sorcerer's Stone", price: 10, rating: 8.9, purchasable_online: true)}
    
    it "I see each book and all of it's attributes" do
      visit "/books/#{book_1.id}"

      expect(page).to have_content("#{book_1.title}")
      expect(page).to have_content("Price: $#{book_1.price}")
      expect(page).to have_content("Rating: #{book_1.rating}")
      expect(page).to have_content("Purchasable Online: #{book_1.purchasable_online}")
      expect(page).to have_content("Book ID: #{book_1.id}")
      expect(page).to have_content("Author ID: #{book_1.author_id}")
    end

    #user story 20
    it "I see an option to delete the book" do
      visit "/books/#{book_1.id}"

      click_button("Delete #{book_1.title}")

      expect(current_path).to eq("/books")
      expect(page).to_not have_content("#{book_1.title}")
    end
  end
end
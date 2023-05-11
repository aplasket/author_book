require "rails_helper"

RSpec.describe "/authors/:author_id/books", type: :feature do
#user story 5:
  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes
  # (data from each column that is on the child table)

  describe "As a visitor, when I visit the author books index page" do
    let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}

    let!(:book_1) { author_1.books.create!(title: "Harry Potter and the Sorcerer's Stone", price: 10, rating: 8.9, purchasable_online: true)}
    let!(:book_2) { author_1.books.create!(title: "Harry Potter and the Wild Child", price: 200, rating: 3.9, purchasable_online: false)}
        
    it "I see each book associated with that Author and all of the books' attributes" do
      visit "/authors/#{author_1.id}/books"

      expect(page).to have_content(author_1.name)
      expect(page).to have_content("Title: #{book_1.title}")
      expect(page).to have_content("Price: $#{book_1.price}")
      expect(page).to have_content("Rating: #{book_1.rating}")
      expect(page).to have_content("Purchasable Online: #{book_1.purchasable_online}")
      expect(page).to have_content("Book ID: #{book_1.id}")
      expect(page).to have_content("Author ID: #{book_1.author_id}")
      
      expect(page).to have_content("Title: #{book_2.title}")
      expect(page).to have_content("Price: $#{book_2.price}")
      expect(page).to have_content("Rating: #{book_2.rating}")
      expect(page).to have_content("Purchasable Online: #{book_2.purchasable_online}")
      expect(page).to have_content("Book ID: #{book_2.id}")
      expect(page).to have_content("Author ID: #{book_2.author_id}")
    
      save_and_open_page
    end
  end
end
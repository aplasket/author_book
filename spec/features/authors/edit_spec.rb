#create test for edit form to complete user story 12
# and then create edit.html.erb info and fill in method to authors_controller

require "rails_helper"

RSpec.describe "#edit", type: :feature do
  describe "when I visit /authors/:id" do
    #user story 12
    let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}
    let!(:author_2) { Author.create!(name: "Maya Angelou", currently_alive: false, age: 86 )}
    let!(:author_3) { Author.create!(name: "Brene Brown", currently_alive: true, age: 57 )}

    let!(:book_1) { author_1.books.create!(title: "Harry Potter and the Sorcerer's Stone", price: 10, rating: 8.9, purchasable_online: true)}
    let!(:book_2) { author_1.books.create!(title: "Harry Potter, Original Manuscript", price: 2000, rating: 4.9, purchasable_online: false)}
    let!(:book_3) { author_2.books.create!(title: "I Know Why the Caged Bird Sings", price: 24, rating: 9.9, purchasable_online: true)}
    let!(:book_4) { author_2.books.create!(title: "Complete Autobiography and Poems", price: 20, rating: 7.9, purchasable_online:false)}
    let!(:book_5) { author_3.books.create!(title: "Daring Greatly", price: 15, rating: 7.0, purchasable_online: true)}
    let!(:book_6) { author_3.books.create!(title: "Women and Shame, Original Manuscript", price: 225, rating: 9.1, purchasable_online: false)}
    
    it "shows a button to update the author" do
      visit "/authors/#{author_1.id}"
      expect(page).to have_content("Update #{author_1.name}")

      click_link("Update #{author_1.name}")
      expect(current_path).to eq("/authors/#{author_1.id}/edit")
    end
  end

  describe "when I visit /authors/edit" do
    let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}
    let!(:author_2) { Author.create!(name: "Maya Angelou", currently_alive: false, age: 86 )}
    let!(:author_3) { Author.create!(name: "Brene Brown", currently_alive: true, age: 57 )}

    let!(:book_1) { author_1.books.create!(title: "Harry Potter and the Sorcerer's Stone", price: 10, rating: 8.9, purchasable_online: true)}
    let!(:book_2) { author_1.books.create!(title: "Harry Potter, Original Manuscript", price: 2000, rating: 4.9, purchasable_online: false)}
    let!(:book_3) { author_2.books.create!(title: "I Know Why the Caged Bird Sings", price: 24, rating: 9.9, purchasable_online: true)}
    let!(:book_4) { author_2.books.create!(title: "Complete Autobiography and Poems", price: 20, rating: 7.9, purchasable_online:false)}
    let!(:book_5) { author_3.books.create!(title: "Daring Greatly", price: 15, rating: 7.0, purchasable_online: true)}
    let!(:book_6) { author_3.books.create!(title: "Women and Shame, Original Manuscript", price: 225, rating: 9.1, purchasable_online: false)}
    
    it "can edit author's details" do
      visit "/authors/#{author_1.id}/edit"
      
      fill_in "Name", with: "Betty Friedan"
      fill_in "Currently alive", with: false 
      fill_in "Age", with: 85

      click_on("Update Author")

      expect(current_path).to eq("/authors/#{author_1.id}")
      expect(page).to have_content("Betty Friedan")
      expect(page).to have_content(false)
      expect(page).to have_content(85)
    end
  end
end
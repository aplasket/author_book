require "rails_helper"

RSpec.describe "/authors/:id (Author ID Page)", type: :feature do
#user story 2
  describe "as a visitor, when I visit author/:id page" do
    let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}
    let!(:author_2) { Author.create!(name: "Maya Angelou", currently_alive: false, age: 86 )}
    let!(:author_3) { Author.create!(name: "Brene Brown", currently_alive: true, age: 57 )}

    let!(:book_1) { author_1.books.create!(title: "Harry Potter and the Sorcerer's Stone", price: 10, rating: 8.9, purchasable_online: true)}
    let!(:book_2) { author_1.books.create!(title: "Harry Potter, Original Manuscript", price: 2000, rating: 4.9, purchasable_online: false)}
    let!(:book_3) { author_2.books.create!(title: "I Know Why the Caged Bird Sings", price: 24, rating: 9.9, purchasable_online: true)}
    let!(:book_4) { author_2.books.create!(title: "Complete Autobiography and Poems", price: 20, rating: 7.9, purchasable_online:false)}
    let!(:book_5) { author_3.books.create!(title: "Daring Greatly", price: 15, rating: 7.0, purchasable_online: true)}
    let!(:book_6) { author_3.books.create!(title: "Women and Shame, Original Manuscript", price: 225, rating: 9.1, purchasable_online: false)}
    
    it "I see the Author of that id and all its attributes" do
      visit "/authors/#{author_1.id}"
      # save_and_open_page
      expect(page).to have_content("#{author_1.name}")
      expect(page).to have_content("Currently Alive: #{author_1.currently_alive}")
      expect(page).to have_content("Age: #{author_1.age}")
      expect(page).to have_content("ID: #{author_1.id}")
    end
  
  #user story 7
  #As a visitor
  #When I visit a parent's show page
  #I see a count of the number of children associated with this parent
    it "total count of books associated with this author" do
      visit "/authors/#{author_1.id}"
      save_and_open_page
      expect(page).to have_content("Total Count of Books by this Author: 2")
    end
  end
end
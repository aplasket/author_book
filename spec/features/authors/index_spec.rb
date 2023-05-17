require "rails_helper"

RSpec.describe "/authors (Author Index Page)", type: :feature do
  #user story 1
  describe "#as a visitor, when I visit author index page" do
    let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}
    let!(:author_2) { Author.create!(name: "Maya Angelou", currently_alive: false, age: 86 )}

    it "I see the name of each author" do
      visit "/authors"
      
      expect(page).to have_content("Authors")
      expect(page).to have_content(author_1.name)
      expect(page).to have_content(author_2.name)
    end

    #user story 11    
    it "shows a link to create a new parent record which routes to a form to create a new record" do
      visit "/authors"
      
      click_link("Create New Author")
  
      expect(current_path).to eq("/authors/new")
    end

    it "I can delete a parent record" do
      visit "/authors"
      
      click_button("Delete #{author_1.name}")

      expect(current_path).to eq("/authors")
      expect(page).to_not have_content(author_1.name)
      expect(page).to have_content(author_2.name)
    end
  end

  #user story 6 add on
  describe "as a visitor, I see authors organized by creation date" do
    let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}
    let!(:author_2) { Author.create!(name: "Maya Angelou", currently_alive: false, age: 86 )}
    let!(:author_3) { Author.create!(name: "Brene Brown", currently_alive: true, age: 57 )}

    it "shows when each author was created, sorted by most recent creation date" do
      visit "/authors"

      expect(author_2.name).to appear_before(author_1.name)
      expect(page).to have_content(author_1.created_at)
      expect(page).to have_content(author_2.created_at)
      expect(page).to have_content(author_3.created_at)
    end
  end

  describe "has links to navigate to /id and /id/books" do
    let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}
    let!(:author_2) { Author.create!(name: "Maya Angelou", currently_alive: false, age: 86 )}

    let!(:book_1) { author_1.books.create!(title: "Harry Potter and the Sorcerer's Stone", price: 10, rating: 8.9, purchasable_online: true)}
    let!(:book_2) { author_1.books.create!(title: "Harry Potter and the Philosopher's Stone", price: 471000, rating: 3.9, purchasable_online: false)}
    let!(:book_5) { author_1.books.create!(title: "Harry Potter's Secret", price: 3, rating: 2.9, purchasable_online: true)}
    let!(:book_3) { author_2.books.create!(title: "I Know Why the Caged Bird Sings", price: 24, rating: 9.9, purchasable_online: true)}
    let!(:book_4) { author_2.books.create!(title: "Complete Autobiography and Poems", price: 20, rating: 7.9, purchasable_online: false)}
    
    it "I can click link to go to the authors/id/books" do
      visit "/authors"

      click_button("See All Books by #{author_1.name}")

      expect(current_path).to eq("/authors/#{author_1.id}/books")
    end

    it "I can click link to author's details /authors/id" do
      visit "/authors"

      click_button("Check Out #{author_1.name}'s Details")

      expect(current_path).to eq("/authors/#{author_1.id}")
    end
  end

end
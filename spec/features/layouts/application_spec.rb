require "rails_helper"

RSpec.describe "application layout view", type: :feature do
    #user story 8
  #As a visitor
  #When I visit any page on the site
  #Then I see a link at the top of the page that takes me to the Child Index

  describe "link to child index" do
    let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}

    let!(:book_1) { author_1.books.create!(title: "Harry Potter and the Sorcerer's Stone", price: 10, rating: 8.9, purchasable_online: true)}
    let!(:book_2) { author_1.books.create!(title: "Harry Potter, Original Manuscript", price: 2000, rating: 4.9, purchasable_online: false)}

    it "can visit any page on the site and see the book index at the top" do
      visit "/authors"
      expect(page).to have_link("See All Books")

      click_link("See All Books")
      expect(current_path).to eq("/books")


      visit "/authors/#{author_1.id}"
      expect(page).to have_content("See All Books")

      click_link("See All Books")
      expect(current_path).to eq("/books")
    end
    #user story 9
    #As a visitor
    #When I visit any page on the site
    #Then I see a link at the top of the page that takes me to the Parent Index
    it "can visit any page on the site and see the author index" do
      visit "/authors/#{author_1.id}/books"
      expect(page).to have_link("See All Authors")
      # save_and_open_page
      click_link("See All Authors")
      expect(current_path).to eq("/authors")
    end
  end
end
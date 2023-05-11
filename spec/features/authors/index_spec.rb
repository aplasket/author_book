require "rails_helper"

RSpec.describe "/authors (Author Index Page)", type: :feature do
  #user story 1
  describe "as a visitor, when I visit author index page" do
    let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}
    let!(:author_2) { Author.create!(name: "Maya Angelou", currently_alive: false, age: 86 )}

    it "I see the name of each author" do
      visit "/authors"
      # save_and_open_page
      expect(page).to have_content(author_1.name)
      expect(page).to have_content(author_2.name)
    end
  end

  describe "as a visitor, when I visit author/:id page" do
    let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}
    let!(:author_2) { Author.create!(name: "Maya Angelou", currently_alive: false, age: 86 )}
    
    it "the Author of that id and all its attributes" do
      visit "/authors/#{author_1.id}"
      # save_and_open_page
      expect(page).to have_content("#{author_1.name}")
      expect(page).to have_content("Currently Alive: #{author_1.currently_alive}")
      expect(page).to have_content("Age: #{author_1.age}")
    end
  end
end
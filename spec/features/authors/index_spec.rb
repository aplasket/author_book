require "rails_helper"

RSpec.describe "/authors (Author Index Page)", type: :feature do
  #user story 1
  describe "as a visitor, when I visit author index page" do
    let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}
    let!(:author_2) { Author.create!(name: "Maya Angelou", currently_alive: false, age: 86 )}

    it "I see the name of each author" do
      visit "/authors"
      # save_and_open_page
      expect(page).to have_content("Authors")
      expect(page).to have_content(author_1.name)
      expect(page).to have_content(author_2.name)
    end
  end

  #user story 2
  describe "as a visitor, when I visit author/:id page" do
    let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}
    let!(:author_2) { Author.create!(name: "Maya Angelou", currently_alive: false, age: 86 )}
    
    it "the Author of that id and all its attributes" do
      visit "/authors/#{author_1.id}"
      # save_and_open_page
      expect(page).to have_content("#{author_1.name}")
      expect(page).to have_content("Currently Alive: #{author_1.currently_alive}")
      expect(page).to have_content("Age: #{author_1.age}")
      expect(page).to have_content("ID: #{author_1.id}")
    end
  end

  #user story 5:
  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes
  # (data from each column that is on the child table)

  describe "As a visitor"
end
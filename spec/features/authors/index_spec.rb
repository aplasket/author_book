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

  #user story 6 add on
  describe "as a visitor, I see authors organized by creation date" do
    before(:each) do
      @author_1 = Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )
      @author_2 = Author.create!(name: "Maya Angelou", currently_alive: false, age: 86 )
      @author_3 = Author.create!(name: "Brene Brown", currently_alive: true, age: 57 )
    end

    # let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}
    # let!(:author_2) { Author.create!(name: "Maya Angelou", currently_alive: false, age: 86 )}
    # let!(:author_3) { Author.create!(name: "Brene Brown", currently_alive: true, age: 57 )}

    it "shows when each author was created, sorted by most recent creation date" do
      visit "/authors"

      save_and_open_page

      expect(@author_3.name).to appear_before(@author_2.name)
      
    end
  end
end
require "rails_helper"
#user story 11 continued

RSpec.describe "/authors/new form page" do
  describe "as a visitor, I can create a new author record through the form" do
    it "and see it displayed on authors index page" do
      visit "/authors/new"

      expect(page).to have_button("Create Author")

      fill_in("Name", with: "Jane Austen")
      fill_in("Currently alive", with: false)
      fill_in("Age", with: 41)
      click_button("Create Author")

      expect(current_path).to eq("/authors")
      expect(page).to have_content("Jane Austen")
    end
  end
end
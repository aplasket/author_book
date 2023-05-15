require "rails_helper"

RSpec.describe "/authors/:author_id/books", type: :feature do
#user story 5:
  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes
  # (data from each column that is on the child table)

  describe "As a visitor, when I visit the author books index page" do
    let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}
    let!(:author_2) { Author.create!(name: "Maya Angelou", currently_alive: false, age: 86 )}

    let!(:book_1) { author_1.books.create!(title: "Harry Potter and the Sorcerer's Stone", price: 10, rating: 8.9, purchasable_online: true)}
    let!(:book_2) { author_1.books.create!(title: "Harry Potter and the Wild Child", price: 2000, rating: 3.9, purchasable_online: false)}
    let!(:book_3) { author_2.books.create!(title: "I Know Why the Caged Bird Sings", price: 24, rating: 9.9, purchasable_online: true)}
    
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
      
      visit "/authors/#{author_2.id}/books"
      
      expect(page).to have_content(author_2.name)
      expect(page).to have_content("Title: #{book_3.title}")
      expect(page).to have_content("Price: $#{book_3.price}")
      expect(page).to have_content("Rating: #{book_3.rating}")
      expect(page).to have_content("Purchasable Online: #{book_3.purchasable_online}")
      expect(page).to have_content("Book ID: #{book_3.id}")
      expect(page).to have_content("Author ID: #{book_3.author_id}")
      # save_and_open_page
    end

    #user story 13
    # As a visitor
    # When I visit a Parent Children Index page
    # Then I see a link to add a new adoptable child for that parent "Create Child"
    # When I click the link
    # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
    # When I fill in the form with the child's attributes:
    # And I click the button "Create Child"
    # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
    # a new child object/row is created for that parent,
    # and I am redirected to the Parent Childs Index page where I can see the new child listed

    it "can create a new book belonging to this author" do
      visit "/authors/#{author_2.id}/books"

      click_button("Create New Book")

      expect(current_path).to eq "/authors/#{author_2.id}/books/new"

      fill_in "Title", with: "Letters to My Daughter"
      fill_in "Price", with: 15
      fill_in "Rating", with: 9.7
      fill_in "Purchasable online", with: true
      
      click_button "Save Book"

      expect(current_path).to eq("/authors/#{author_2.id}/books")
      expect(page).to have_content("Letters to My Daughter")
    end
  end
end
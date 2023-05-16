require "rails_helper"

RSpec.describe "/authors/:author_id/books", type: :feature do
#user story 5:
  describe "As a visitor, when I visit the author books index page" do
    let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}
    let!(:author_2) { Author.create!(name: "Maya Angelou", currently_alive: false, age: 86 )}

    let!(:book_1) { author_1.books.create!(title: "Harry Potter and the Sorcerer's Stone", price: 10, rating: 8.9, purchasable_online: true)}
    let!(:book_2) { author_1.books.create!(title: "Harry Potter and the Philosopher's Stone", price: 471000, rating: 3.9, purchasable_online: false)}
    let!(:book_5) { author_1.books.create!(title: "Harry Potter's Secret", price: 3, rating: 2.9, purchasable_online: true)}
    let!(:book_3) { author_2.books.create!(title: "I Know Why the Caged Bird Sings", price: 24, rating: 9.9, purchasable_online: true)}
    let!(:book_4) { author_2.books.create!(title: "Complete Autobiography and Poems", price: 20, rating: 7.9, purchasable_online: false)}
    
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

    #user story 16
    it "I can see a link to sort books alphabetically" do
      visit "/authors/#{author_1.id}/books"

      expect(page).to have_link("Sort Books A to Z")

      expect(book_1.title).to appear_before(book_2.title)
    end

    it "on click, it returns to the index page and can see books in alphabetical order" do
      visit "/authors/#{author_1.id}/books"

      click_link("Sort Books A to Z")

      expect(book_2.title).to appear_before(book_1.title)
    end

    #user story 21
    it "I see a form to input a value to return a certain number of records" do
      visit "/authors/#{author_1.id}/books"

      fill_in(:price, with: 60)

      click_button("Only return books with a price more than this amount")

      expect(current_path).to eq("/authors/#{author_1.id}/books")
      expect(page).to have_content(book_2.title)
      expect(page).to_not have_content(book_1.title)
      expect(page).to_not have_content(book_5.title)
    end

    #user story 23
    it "I can delete the child from the index page" do
      visit "/authors/#{author_1.id}/books"

      click_button("Delete #{book_1.title}")

      expect(current_path).to eq("/books")
      expect(page).to_not have_content("#{book_1.title}")

    end
  end
end
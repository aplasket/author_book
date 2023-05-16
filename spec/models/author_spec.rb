require "rails_helper"

RSpec.describe Author, type: :model do
  describe "relationships" do
    it { should have_many :books }
  end

  #user story 6
  describe "#sort_by_creation" do
    let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}
    let!(:author_2) { Author.create!(name: "Maya Angelou", currently_alive: false, age: 86 )}
    let!(:author_3) { Author.create!(name: "Brene Brown", currently_alive: true, age: 57 )}

    it "sorts parent index by creation date and lists when it was created" do
      expected = [author_3, author_2, author_1]
      expect(Author.sort_by_creation).to eq(expected)
    end
  end

  #user story #7
  describe "instance methods" do
    let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}
    let!(:author_2) { Author.create!(name: "Maya Angelou", currently_alive: false, age: 86 )}
    let!(:author_3) { Author.create!(name: "Brene Brown", currently_alive: true, age: 57 )}

    let!(:book_1) { author_1.books.create!(title: "Harry Potter and the Sorcerer's Stone", price: 10, rating: 8.9, purchasable_online: true)}
    let!(:book_2) { author_1.books.create!(title: "Harry Potter and the Philosopher's Stone", price: 471000, rating: 3.9, purchasable_online: false)}
    let!(:book_3) { author_2.books.create!(title: "I Know Why the Caged Bird Sings", price: 24, rating: 9.9, purchasable_online: true)}
    let!(:book_4) { author_2.books.create!(title: "Complete Autobiography and Poems", price: 20, rating: 7.9, purchasable_online:false)}
    let!(:book_5) { author_3.books.create!(title: "Daring Greatly", price: 15, rating: 7.0, purchasable_online: true)}
    let!(:book_6) { author_3.books.create!(title: "Women and Shame, Original Manuscript", price: 225, rating: 9.1, purchasable_online: false)}

    describe "#count_books" do
      it "returns the number of books associated with an author" do
        expected = 2
        expect(author_1.count_books).to eq(expected)
      end
    end

    describe "#sort_books" do
      it "sorts the books alphabetically from A to Z" do
        expect(author_1.sort_books).to eq([book_2, book_1])
      end
    end

    describe "#books_over_price" do
      it "can return a list of books over a give price amount" do
        expect(author_1.books_over_price(61)).to eq([book_2])
      end
    end
  end
end
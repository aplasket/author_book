require "rails_helper"

RSpec.describe Book, type: :model do
  let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}
  let!(:author_2) { Author.create!(name: "Maya Angelou", currently_alive: false, age: 86 )}

  let!(:book_1) { author_1.books.create!(title: "Harry Potter and the Sorcerer's Stone", price: 10, rating: 8.9, purchasable_online: true)}
  let!(:book_2) { author_1.books.create!(title: "Harry Potter and the Wild Child", price: 2, rating: 3.9, purchasable_online: false)}
  let!(:book_3) { author_2.books.create!(title: "I Know Why the Caged Bird Sings", price: 24, rating: 9.9, purchasable_online: true)}
    
  describe "relationships" do
    it { should belong_to :author }

  end

  describe "class methods" do
    it "::can_purchase_online" do
      expect(Book.can_purchase_online).to eq([book_1, book_3])
    end
  end
end
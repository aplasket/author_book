require "rails_helper"

RSpec.describe Author, type: :model do
  describe "relationships" do
    it { should have_many :books }
  end

  # As a visitor
  # When I visit the parent index,
  # I see that records are ordered by most recently created first
  # And next to each of the records I see when it was created
  
  describe "#sort_by_creation" do
    let!(:author_1) { Author.create!(name: "J.K. Rowling", currently_alive: true, age: 57 )}
    let!(:author_2) { Author.create!(name: "Maya Angelou", currently_alive: false, age: 86 )}
    let!(:author_3) { Author.create!(name: "Brene Brown", currently_alive: true, age: 57 )}

    it "sorts parent index by creation date and lists when it was created" do
      expected = [author_3, author_2, author_1]
      expect(Author.sort_by_creation).to eq(expected)
    end
  end
end
class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  def self.sort_by_creation
    order(created_at: :desc)
  end

  def count_books
    books.count
  end

  def sort_books
    books.order(:title)
  end
end
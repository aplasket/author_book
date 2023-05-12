class Author < ApplicationRecord
  has_many :books

  def self.sort_by_creation
    order(created_at: :desc)
  end
end
class Book < ApplicationRecord
  belongs_to :author

  def self.can_purchase_online
    Book.where(purchasable_online: true)
  end
end
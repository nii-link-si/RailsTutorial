class Book < ApplicationRecord
  has_and_belongs_to_many :users

  def rental(user)
    Rent.create(book: self, user: user)
  end

end

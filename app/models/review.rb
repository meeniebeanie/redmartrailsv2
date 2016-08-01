class Review < ApplicationRecord

  belongs_to :product
  validates :product_id, presence: true

  #listing 13.8
  belongs_to :user
  validates :user_id, presence: true

  default_scope -> { order(created_at: :desc)}

  validates :comment, presence: true, length: { maximum: 500 }
  validates :rating, presence: true, length: { maximum: 200 }



end

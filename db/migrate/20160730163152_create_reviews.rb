class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.string :rating
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
    add_index :reviews, [:user_id, :created_at]
  end
end

class CreateMicroposts < ActiveRecord::Migration[8.0]
  def change
    create_table :microposts do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    change_table :microposts do |t|
      t.index [:user_id, :created_at]
    end
  end
end



  # add_index :microposts, [:user_id, :created_at]  #composite index (multiple key index)
  # search for microposts of a user (WHERE user_id = ?), the search will be very fast.
  # SELECT * FROM microposts
  # WHERE USER_ID = 5
  # ORDER BY created_at DESC;  #here-sorting_posts


  # ASC (Ascending)
  # DESC "Descending Order"



# :desc means newest post first
# t.references :user => creates user_id internally
# null: false => microposts always connect to a user_id cant be empty
# FOREIGN KEY (user_id) REFERENCES users(id)



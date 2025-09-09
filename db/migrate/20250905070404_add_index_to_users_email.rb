class AddIndexToUsersEmail < ActiveRecord::Migration[8.0]
  def change
    add_index :users, :email, unique: true
    # method called add_index to add an index on the email column of the users table.
  end
end

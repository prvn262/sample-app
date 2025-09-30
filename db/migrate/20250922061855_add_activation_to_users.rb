class AddActivationToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :activation_digest, :string
    add_column :users, :activated, :boolean, default: false
    add_column :users, :activated_at, :datetime
  end
end




#  activation_digest:string - for storing an encrypted activation token
#  activated:boolean        - to track whether(status check) a user has activated their account
#  activated_at:datetime    - to record when the activation occurred

class AddStripeIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_ID, :string
  end
end

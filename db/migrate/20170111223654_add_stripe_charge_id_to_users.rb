class AddStripeChargeIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_charge_ID, :string
  end
end

class AddFieldToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :stripe_payment_token, :string
    add_column :subscriptions, :stripe_plan_id, :string
    add_reference :subscriptions, :plan, index: true

  end
end

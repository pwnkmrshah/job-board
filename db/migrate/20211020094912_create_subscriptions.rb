class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.references :user
      t.decimal :paid_amount, precision: 10, scale: 2
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end

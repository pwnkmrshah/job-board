class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string   :stripe_plan_id
      t.string   :stripe_product_id
      t.string   :stripe_price_id
      t.timestamps
    end
  end
end
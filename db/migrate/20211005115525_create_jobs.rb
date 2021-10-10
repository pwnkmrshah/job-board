class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.references :user
      t.string :company_name
      t.string :title
      t.string :skills
      t.text :description
      t.string :locality      

      t.timestamps
    end
  end
end

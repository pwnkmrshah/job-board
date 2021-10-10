class CreateFavoriteJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_jobs do |t|
      t.integer :job_id
      t.integer :user_id

      t.timestamps
    end
  end
end

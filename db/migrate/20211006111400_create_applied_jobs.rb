class CreateAppliedJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :applied_jobs do |t|
      t.integer :job_id
      t.integer :recruiter_id
      t.integer :applicant_id
      t.string :status
      t.datetime :applied_date

      # t.timestamps
    end
  end
end

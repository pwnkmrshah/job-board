class AddFieldsToJob < ActiveRecord::Migration[6.1]
  def change
    remove_column :jobs, :skills, :string
    add_column :jobs, :category, :string
    add_column :jobs, :job_type, :integer,  default: 1
    add_column :jobs, :closing_date, :datetime
    add_column :applied_jobs, :applicant_name, :string
    add_column :applied_jobs, :applicant_email, :string
    add_column :applied_jobs, :applicant_experience, :integer
    add_column :users, :address, :string
    add_column :users, :total_experience, :integer
    add_column :users, :qualification, :string
    add_attachment :users, :dp
  end
end

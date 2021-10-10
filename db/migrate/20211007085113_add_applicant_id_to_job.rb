class AddApplicantIdToJob < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs,  :applicant_id, :integer
  end
end

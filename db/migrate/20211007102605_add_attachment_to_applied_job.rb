class AddAttachmentToAppliedJob < ActiveRecord::Migration[6.1]
  def change
    add_attachment :applied_jobs, :resume
  end
end

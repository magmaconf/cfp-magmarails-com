class AddFalseDefaultToApproved < ActiveRecord::Migration
  def change
    change_column :cfp_proposals, :approved, :boolean, default: false
  end
end

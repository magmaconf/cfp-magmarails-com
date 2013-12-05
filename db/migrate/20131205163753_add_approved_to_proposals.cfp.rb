# This migration comes from cfp (originally 20131205001714)
class AddApprovedToProposals < ActiveRecord::Migration
  def change
    add_column :cfp_proposals, :approved, :boolean
  end
end

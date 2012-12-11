# This migration comes from cfp (originally 20121120192955)
class CreateCfpRanks < ActiveRecord::Migration
  def change
    create_table :cfp_ranks do |t|
      t.integer :user_id
      t.integer :proposal_id
      t.integer :value

      t.timestamps
    end
  end
end

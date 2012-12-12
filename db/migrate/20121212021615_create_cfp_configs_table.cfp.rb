# This migration comes from cfp (originally 20121211170150)
class CreateCfpConfigsTable < ActiveRecord::Migration
  def change
    create_table :cfp_configs do |t|
      t.string :var
      t.string :value
    end
  end
end

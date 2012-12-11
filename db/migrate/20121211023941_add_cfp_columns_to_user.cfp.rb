# This migration comes from cfp (originally 20121119010335)
class AddCfpColumnsToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.text :roles
    end
  end
end

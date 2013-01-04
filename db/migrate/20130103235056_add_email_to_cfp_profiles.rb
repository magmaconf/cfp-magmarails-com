class AddEmailToCfpProfiles < ActiveRecord::Migration
  def change
    add_column :cfp_profiles, :email, :string
  end
end

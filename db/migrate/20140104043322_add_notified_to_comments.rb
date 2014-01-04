class AddNotifiedToComments < ActiveRecord::Migration
  def change
    add_column :cfp_comments, :notified, :boolean, default: false
  end
end

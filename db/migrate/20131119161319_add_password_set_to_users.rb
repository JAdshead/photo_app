class AddPasswordSetToUsers < ActiveRecord::Migration
  def change
    add_column :users, :passwordSet, :boolean
  end
end

class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :description
      t.belongs_to :user
      t.belongs_to :photo

      t.timestamps
    end
  end
end

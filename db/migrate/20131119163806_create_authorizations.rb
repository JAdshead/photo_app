class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :username
      t.string :provider
      t.string :uid
      t.integer :user_id
      t.string :token
      t.string :secret

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ""
      t.string :name
      t.string :confirmation_token
      t.string :remember_token
      t.string :uid
      t.string :validic_id
      t.string :token
      t.string :provider

      t.timestamps null: false
    end
  end
end

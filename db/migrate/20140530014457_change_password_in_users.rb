class ChangePasswordInUsers < ActiveRecord::Migration
  change_table :users do |t|
    t.string :password_hash
    t.rename :password, :password_salt
  end
end

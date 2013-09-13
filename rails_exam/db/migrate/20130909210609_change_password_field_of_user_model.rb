class ChangePasswordFieldOfUserModel < ActiveRecord::Migration
  def change
    remove_column :users, :password_user, :string
    add_column :users, :password_digest, :string
  end
end

class AddUserPicToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :user_pic, :string
  end
end

class AddAuthorProfileRefToComments < ActiveRecord::Migration
  def change
    add_column :comments, :author_profile_id, :integer
    add_foreign_key :comments, :profiles, column: :author_profile_id
  end
end

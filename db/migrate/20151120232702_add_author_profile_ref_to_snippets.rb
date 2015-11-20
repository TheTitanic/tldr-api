class AddAuthorProfileRefToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :author_profile_id, :integer
    add_foreign_key :snippets, :profiles, column: :author_profile_id
  end
end

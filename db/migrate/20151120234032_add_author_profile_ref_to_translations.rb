class AddAuthorProfileRefToTranslations < ActiveRecord::Migration
  def change
    add_column :translations, :author_profile_id, :integer
    add_foreign_key :translations, :profiles, column: :author_profile_id
  end
end

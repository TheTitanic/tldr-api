class AddSnippetRefToTranslations < ActiveRecord::Migration
  def change
    add_reference :translations, :snippet, index: true, foreign_key: true
  end
end

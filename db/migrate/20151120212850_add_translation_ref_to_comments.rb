class AddTranslationRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :translation, index: true, foreign_key: true
  end
end

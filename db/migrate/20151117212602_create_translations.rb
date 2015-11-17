class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :heading, null: false
      t.text :content, null: false
    end
  end
end

class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title, null: false
      t.text :description
      t.text :content, null: false
      t.integer :length, null: false
    end
  end
end

class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.text :content, null:false
      t.integer :start_position, null:false
      t.integer :end_position, null:false

      t.timestamps null: false
    end
  end
end

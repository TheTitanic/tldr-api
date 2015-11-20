class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :heading, null: false
      t.text :content, null: false
    end
  end
end

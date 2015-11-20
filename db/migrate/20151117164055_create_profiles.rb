class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :username, null: false, index: {unique: true}

      t.timestamps null: false
    end
  end
end

class AddProfileRefToDocuments < ActiveRecord::Migration
  def change
    add_reference :documents, :profile, index: true, foreign_key: true
  end
end

class AddDocumentRefToSnippets < ActiveRecord::Migration
  def change
    add_reference :snippets, :document, index: true, foreign_key: true
  end
end

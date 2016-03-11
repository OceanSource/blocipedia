class AddIndexToCollaborators < ActiveRecord::Migration
  def change
    add_index :collaborators, :id, unique: true
    add_index :collaborators, :user_id
    add_index :collaborators, :wiki_id
  end
end

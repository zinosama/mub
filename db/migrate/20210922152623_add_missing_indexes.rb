class AddMissingIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :mub_templates, :activated_at
    add_index :mub_templates,
      [:resource_type, :name],
      unique: true
  end
end

class AddUniqueIndexForTag < ActiveRecord::Migration[6.1]
  def change
    add_index :mub_tags,
      [:name, :value],
      unique: true
  end
end

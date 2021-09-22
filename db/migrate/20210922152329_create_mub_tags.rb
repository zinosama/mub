class CreateMubTags < ActiveRecord::Migration[6.1]
  def change
    create_table :mub_tags do |t|
      t.string :name, null: false
      t.string :value, null: false
      t.timestamps
    end

    create_table :mub_tag_associations do |t|
      t.references :tag, null: false
      t.references :template, null: false
      t.timestamps
    end
  end
end

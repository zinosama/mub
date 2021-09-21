class CreateMubTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :mub_templates do |t|
      t.string :resource_type, null: false
      t.string :name, null: false
      t.text :description
      t.datetime :activated_at
      t.string :classification, null: false
      t.timestamps
    end
  end
end

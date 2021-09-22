class CreateMubProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :mub_property_settings do |t|
       t.string :display_name, null: false
       t.string :resource_type, null: false
       t.string :setter_method_name, null: false
       t.string :target_column, null: false
       t.string :fk_entity
       t.timestamps
    end

    create_table :mub_properties do |t|
      t.references :template, null: false
      t.references :property_setting, null: false
      t.jsonb :value
      t.boolean :allow_modify, null: false
      t.timestamps
    end

    add_index :mub_property_settings, :resource_type
    add_index :mub_properties,
      [:property_setting_id, :template_id],
      unique: true
  end
end

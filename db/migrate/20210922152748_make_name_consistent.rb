class MakeNameConsistent < ActiveRecord::Migration[6.1]
  def change
    rename_column :mub_property_settings, :display_name, :name
  end
end

class AddDisplaynameToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :displayname, :string
    add_index :profiles, :displayname
  end
end

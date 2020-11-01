class AddIdsToSong < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :profile_id, :integer
    add_index :songs, :profile_id
    add_column :songs, :slug, :string
    add_index :songs, :slug
  end
end

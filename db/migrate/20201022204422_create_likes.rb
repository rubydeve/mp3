class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.bigint :song_id
      t.bigint :profile_id

      t.timestamps
    end
    add_foreign_key :likes, :songs
    add_foreign_key :likes, :profiles    
  end
end

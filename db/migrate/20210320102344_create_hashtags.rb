class CreateHashtags < ActiveRecord::Migration[6.1]
  def change
    create_table :hashtags do |t|
      t.string :name
      t.integer :popularity
      t.bigint :searches
      t.integer :day_searches

      t.timestamps
    end
    add_column :animes, :hashtags_ids, :string, array: true
  end
end

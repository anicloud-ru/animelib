class AnimeHashtagsIdsToInteger < ActiveRecord::Migration[6.1]
  def change
    remove_column :animes, :hashtags_ids
    add_column :animes, :hashtags_ids, :integer, array: true
  end
end

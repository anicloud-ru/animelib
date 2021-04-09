class AddRowsToAnime < ActiveRecord::Migration[6.1]
  def change
    add_column :animes, :description_ru, :text
    add_column :animes, :description_en, :text
    add_column :animes, :duration, :integer
    add_column :animes, :score, :float
    add_column :animes, :genres_ids, :string, array: true
    add_column :animes, :aired_on, :date
    add_column :animes, :released_on, :date
    add_column :animes, :franchise, :string
    add_column :animes, :fandubbers, :string, array: true
  end
end

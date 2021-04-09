class ImprovingAnimeModel < ActiveRecord::Migration[6.1]
  def change
    add_column :animes, :kind, :string
    add_column :animes, :status, :string
    add_column :animes, :episodes_number, :integer
    add_column :animes, :age_rating, :string
  end
end

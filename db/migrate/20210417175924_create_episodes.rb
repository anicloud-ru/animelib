class CreateEpisodes < ActiveRecord::Migration[6.1]
  def change
    create_table :episodes do |t|
      t.string :canonical
      t.string :russian
      t.belongs_to :anime
      t.integer :episode
      t.timestamps
    end
    rename_column :arcs, :series, :episodes
    rename_column :arcs, :name, :russian
    add_column :arcs, :canonical, :string
  end
end

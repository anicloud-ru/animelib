class CreateAnimes < ActiveRecord::Migration[6.1]
  def change
    create_table :animes do |t|
      t.string :canonical
      t.string :russian
      t.string :optionally
      t.timestamps
    end
  end
end

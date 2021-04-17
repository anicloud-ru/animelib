class CreateArcs < ActiveRecord::Migration[6.1]
  def change
    create_table :arcs do |t|
      t.string :name
      t.integer :number
      t.integer :series, array: true
      t.belongs_to :anime

      t.timestamps
    end
  end
end

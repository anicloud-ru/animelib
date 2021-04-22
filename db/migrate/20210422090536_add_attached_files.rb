class AddAttachedFiles < ActiveRecord::Migration[6.1]
  def change
    change_table :animes do |t|
      t.has_attached_file :poster
    end
    change_table :arcs do |t|
      t.has_attached_file :poster
    end
    change_table :videos do |t|
      t.has_attached_file :video
    end
  end
end

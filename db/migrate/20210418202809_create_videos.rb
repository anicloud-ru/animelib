class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :name
      t.string :url, default: 's3'
      t.integer :user_id, default: 0
      t.integer :likes, default: 0
      t.integer :dislikes, default: 0
      t.integer :views, default: 0
      t.string :kind, default: 'fandub'
      t.string :status, default: 'created'
      t.string :fandub
      t.string :fansub
      t.belongs_to :episode
      t.timestamps
    end
  end
end

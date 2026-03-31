class CreateGames < ActiveRecord::Migration[7.2]
  def change
    create_table :games do |t|
      t.references :user, null: false, foreign_key: true
      t.string :home_team
      t.string :visitor_team
      t.integer :hometeam_score
      t.integer :visitorteam_score
      t.string :hero_player
      t.integer :drink_count
      t.string :stadium
      t.date :watched_date
      t.text :memo

      t.timestamps
    end
  end
end

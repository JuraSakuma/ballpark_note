class Game < ApplicationRecord
  belongs_to :user
  validates :home_team, :visitor_team, :hometeam_score, :visitorteam_score, :stadium, :watched_date, presence: true
end

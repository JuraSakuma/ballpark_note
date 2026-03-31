class GamesController < ApplicationController
  before_action :authenticate_user!

  def index 
    @games = current_user.games
  end

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.build(game_params)
    if @game.save
    redirect_to games_path
    else
    render :new, status: :unprocessable_entity
    end
  end


  private

  def game_params
    params.require(:game).permit(
      :home_team, :visitor_team, :hometeam_score,
      :visitorteam_score, :hero_player, :drink_count,
      :stadium, :watched_date, :memo
    )
  end
end

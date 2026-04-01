class GamesController < ApplicationController
  before_action :authenticate_user!

  def index 
    @games = current_user.games.order(watched_date: :desc)
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

  def show
    @game = current_user.games.find(params[:id])
  end

  def edit
    @game = current_user.games.find(params[:id])
  end

  def update
    @game = current_user.games.find(params[:id])
    if @game.update(game_params)
      redirect_to games_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @game = current_user.games.find(params[:id])
    @game.destroy
    redirect_to games_path
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

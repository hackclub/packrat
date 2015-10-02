class ClubsController < ApplicationController
  before_action :authenticate_club_leader!

  def index
    @clubs = Club.all
  end

  def new
  end

  def create
  end

  def show
    @club = Club.find(params[:id])
    @meetings = @club.meetings.order(created_at: :asc)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

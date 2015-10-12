class ClubsController < ApplicationController
  before_action :authenticate_leader!

  def index
    @clubs = Club.all
  end

  def show
    @club = Club.find(params[:id])
    @meetings = @club.meetings.order(created_at: :asc)
  end
end

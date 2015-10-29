class ClubsController < ApplicationController
  before_action :authenticate_admin!, only: [:admin, :create]
  before_action :authenticate_leader!, except: [:admin, :create]

  def index
    @leader_clubs = current_leader.clubs
    @other_clubs = Club.where.not('id in (?)', current_leader.club_ids)
    @show_join_club_form = current_leader.clubs.empty?
  end

  def admin
    @clubs = Club.all
  end

  def create
  end

  def show
    @club = Club.find(params[:id])
    @meetings = @club.meetings.order(created_at: :desc)
  end

  def leader_join
    invite_code = params.require(:leader_invite_code).downcase
    club = Club.find_by(leader_invite_code: invite_code)
    if club.nil?
      flash.now[:error] = 'Invalid invite code'
    else
      club.leaders << current_leader
    end

    redirect_to clubs_path
  end
end

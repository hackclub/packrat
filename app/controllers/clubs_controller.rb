class ClubsController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create]
  before_action :authenticate_leader!, except: [:new, :create]

  def index
    @leader_clubs = current_leader.clubs
    @other_clubs = Club.where.not('id in (?)', current_leader.club_ids)
    @show_join_club_form = current_leader.clubs.empty?
  end

  def new
    @clubs = Club.all
  end

  def create
    @club = Club.new(club_params)

    respond_to do |format|
      if @club.save
        format.html { redirect_to new_club_path,
            notice: 'Club was successfully created.' }
      else
        format.html { render :new }
      end
    end
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

  private
    # Never trust parameters from the scary internet, only allow the white list
    # through.
    def club_params
      params.require(:club).permit(:name)
    end
end

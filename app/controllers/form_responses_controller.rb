# coding: utf-8
class FormResponsesController < ApplicationController
  before_filter :authenticate_club_member!

  # GET /form_responses/new
  def new
    @clubs = []
    unless Club.exists?
      @clubs.push 'clubs not found'
    else
      for club in Club.all.to_a
        @clubs.push club.name
      end
    end
    @form_response = FormResponse.new
  end

  # POST /form_responses
  def create
    @form_response = FormResponse.new(form_response_params)
    unless current_club_member.club_id
      current_club_member.update(club_id: Club.find_by(name: form_response_params['club']).id)
    end
    unless current_club_member.full_name
      current_club_member.update(full_name: form_response_params['name'])
    end

    respond_to do |format|
      if @form_response.save
        format.html { redirect_to :form_response_success, notice: 'Form_Response was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def success
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_response_params
      params.require(:form_response).permit(:club, :name, :feedback, :phone_number, :rating, :email, :misc)
    end
end

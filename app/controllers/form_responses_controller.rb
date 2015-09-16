# coding: utf-8
class FormResponsesController < ApplicationController
  before_action :set_form_response, only: [:show, :edit, :update, :destroy]

  # GET /form_responses
  def index
    @form_responses = FormResponse.all
  end

  # GET /form_responses/1
  def show
  end

  # GET /form_responses/new
  def new
    @clubs = []
    if Club.all.to_a.length == 0
      @clubs.push 'clubs not found'
    else
      for club in Club.all.to_a
        @clubs.push club.name
      end
    end
    @form_response = FormResponse.new
  end

  # GET /form_responses/1/edit
  def edit
  end

  # POST /form_responses
  def create
    @form_response = FormResponse.new(form_response_params)

    respond_to do |format|
      if @form_response.save
        format.html { redirect_to @form_response, notice: 'Form_Response was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /form_responses/1
  def update
    respond_to do |format|
      if @form_response.update(form_response_params)
        format.html { redirect_to @form_response, notice: 'Form_Response was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /form_responses/1
  def destroy
    @form_response.destroy
    respond_to do |format|
      format.html { redirect_to form_responses_url, notice: 'Form_Response was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_response
      @form_response = FormResponse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_response_params
      params.require(:form_response).permit(:club, :name, :feedback, :phone_number, :rating, :email, :misc)
    end
end

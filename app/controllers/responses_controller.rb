# coding: utf-8
class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :edit, :update, :destroy]

  # GET /responses
  def index
    @responses = Response.all
  end

  # GET /responses/1
  def show
  end

  # GET /responses/new
  def new
    @clubs = []
    if Club.all.to_a.length == 0
      @clubs.push 'clubs not found'
    else
      for club in Club.all.to_a
        @clubs.push club.name
      end
    end
    @response = Response.new
  end

  # GET /responses/1/edit
  def edit
  end

  # POST /responses
  # POST /responses.json
  def create
    @response = Response.new(response_params)

    respond_to do |format|
      if @response.save
        format.html { redirect_to @response, notice: 'Response was successfully created.' }
        format.json { render :show, status: :created, location: @response }
      else
        format.html { render :new }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responses/1
  # PATCH/PUT /responses/1.json
  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to @response, notice: 'Response was successfully updated.' }
        format.json { render :show, status: :ok, location: @response }
      else
        format.html { render :edit }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to responses_url, notice: 'Response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.require(:response).permit(:club, :name, :feedback, :phone_number, :rating, :email, :misc)
    end
end

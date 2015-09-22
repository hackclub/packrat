class FeedbackResponsesController < ApplicationController
  before_action :set_feedback_response, only: [:show, :edit, :update, :destroy]

  # GET /feedback_responses
  # GET /feedback_responses.json
  def index
    @feedback_responses = FeedbackResponse.all
  end

  # GET /feedback_responses/1
  # GET /feedback_responses/1.json
  def show
  end

  # GET /feedback_responses/new
  def new
    @feedback_response = FeedbackResponse.new
  end

  # GET /feedback_responses/1/edit
  def edit
  end

  # POST /feedback_responses
  # POST /feedback_responses.json
  def create
    @feedback_response = FeedbackResponse.new(feedback_response_params)

    respond_to do |format|
      if @feedback_response.save
        format.html { redirect_to @feedback_response, notice: 'Feedback response was successfully created.' }
        format.json { render :show, status: :created, location: @feedback_response }
      else
        format.html { render :new }
        format.json { render json: @feedback_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedback_responses/1
  # PATCH/PUT /feedback_responses/1.json
  def update
    respond_to do |format|
      if @feedback_response.update(feedback_response_params)
        format.html { redirect_to @feedback_response, notice: 'Feedback response was successfully updated.' }
        format.json { render :show, status: :ok, location: @feedback_response }
      else
        format.html { render :edit }
        format.json { render json: @feedback_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedback_responses/1
  # DELETE /feedback_responses/1.json
  def destroy
    @feedback_response.destroy
    respond_to do |format|
      format.html { redirect_to feedback_responses_url, notice: 'Feedback response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback_response
      @feedback_response = FeedbackResponse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_response_params
      params.require(:feedback_response).permit(:meeting_id, :rating)
    end
end

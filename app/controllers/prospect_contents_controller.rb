class ProspectContentsController < ApplicationController
  before_action :set_prospect_content, only: [:show, :update, :destroy]

  # GET /prospect_contents
  def index
    @prospect_contents = ProspectContent.all
    
    render json: @prospect_contents
  end

  # GET /prospect_contents/1
  def show
    render json: @prospect_content
  end

  # POST /prospect_contents
  def create
    @prospect_content = ProspectContent.new(prospect_content_params)

    if @prospect_content.save
      render json: @prospect_content, status: :created, location: @prospect_content
    else
      render json: @prospect_content.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /prospect_contents/1
  def update
    if @prospect_content.update(prospect_content_params)
      render json: @prospect_content
    else
      render json: @prospect_content.errors, status: :unprocessable_entity
    end
  end

  # DELETE /prospect_contents/1
  def destroy
    @prospect_content.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prospect_content
      @prospect_content = ProspectContent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def prospect_content_params
      params.require(:prospect_content).permit(:prospect_id, :content_id)
    end
end

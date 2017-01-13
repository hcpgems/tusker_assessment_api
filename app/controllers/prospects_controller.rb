class ProspectsController < ApplicationController
  before_action :set_prospect, only: [:show, :update, :destroy]

  DATASOURCE_SITE = 'http://tuskermarvel.com/'

  # require 'net/http'
  require 'open-uri'
  # require 'json'


  def next
    @prospects = load_data_from_uri "prospects.json"
    @packages = load_data_from_uri "packages.json"
  
    @prospects.each do | p |
      @packages.each do | pk |
        if (p['received'] & pk['contents']).empty?
          p['next_package'] = pk
          break
        end
      end
    end

    render json: @prospects
  end

  # GET /prospects
  def index
    # @prospects = Prospect.all
  
    @prospects = load_data_from_uri 'prospects.json'

    render json: @prospects
  end

  # GET /prospects/1
  def show
    render json: @prospect
  end

  # POST /prospects
  def create
    @prospect = Prospect.new(prospect_params)

    if @prospect.save
      render json: @prospect, status: :created, location: @prospect
    else
      render json: @prospect.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /prospects/1
  def update
    if @prospect.update(prospect_params)
      render json: @prospect
    else
      render json: @prospect.errors, status: :unprocessable_entity
    end
  end

  # DELETE /prospects/1
  def destroy
    @prospect.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prospect
      @prospect = Prospect.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def prospect_params
      params.require(:prospect).permit(:contact, :city_id)
    end

    def load_data_from_uri (entity_name)
      datasource_uri = (params[:datasource] || DATASOURCE_SITE) + entity_name
      # response = Net::HTTP.get_response(URI.parse(source))
      # json_data = response.body
      # @prospects = JSON.parse(json_data)
      @data = JSON.parse(open( datasource_uri ).read )
    end

end

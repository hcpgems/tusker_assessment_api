class PackageController < ApplicationController

  require 'open-uri'
  require 'json'

  def index
    datasource_uri = 'http://tuskermarvel.com/packages.json'
    @packages = JSON.parse(open( datasource_uri ).read )

    render json: @packages
  end

  def show
  end

  def load
  end
end

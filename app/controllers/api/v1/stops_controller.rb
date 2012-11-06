class Api::V1::StopsController < ApplicationController
  load_and_authorize_resource


  # GET /stops
  # GET /stops.json
  def index
  end

  # GET /stops/1
  # GET /stops/1.json
  def show
  end

  # POST /stops
  # POST /stops.json
  def create
    if @stop.save
      render 'api/v1/stops/show'
    else
      render 'api/v1/stops/show', :status => :bad_request
    end
  end

  # PUT /stops/1
  # PUT /stops/1.json
  def update
    if @stop.update_attributes(params[:stop])
      render 'api/v1/stops/show'
    else
      render 'api/v1/stops/show', status: :unprocessable_entity
    end
  end

  # DELETE /stops/1
  # DELETE /stops/1.json
  def destroy
    @stop.destroy
    head :no_content
  end

end
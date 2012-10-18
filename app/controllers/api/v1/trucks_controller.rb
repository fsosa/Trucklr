class Api::V1::TrucksController < ApplicationController
  load_and_authorize_resource

  def profile
    @truck = current_truck
    render 'api/v1/trucks/show'
  end

  # GET /trucks
  # GET /trucks.json
  def index
  end

  # GET /trucks/1
  # GET /trucks/1.json
  def show
  end

  # POST /trucks
  # POST /trucks.json
  def create
    if @truck.save
      render 'api/v1/trucks/show'
    else
      render 'api/v1/trucks/show', :status => :bad_request
    end
  end

  # PUT /trucks/1
  # PUT /trucks/1.json
  def update
    if @truck.update_attributes(params[:truck])
      render 'api/v1/trucks/show'
    else
      render 'api/v1/trucks/show', status: :unprocessable_entity
    end
  end

  # DELETE /trucks/1
  # DELETE /trucks/1.json
  def destroy
    @truck.destroy
    head :no_content
  end

end

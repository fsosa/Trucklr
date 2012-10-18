class API::V1::StopsController < ApplicationController

  # GET /stops
  # GET /stops.json
  def index
    @stops = Stop.all

    respond_to do |format|
      format.json { render json: @stops }
    end
  end

  # GET /stops/1
  # GET /stops/1.json
  def show
    @stop = Stop.find(params[:id])

    respond_to do |format|
      format.json { render json: @stop }
    end
  end

  # GET /stops/new
  # GET /stops/new.json
  def new
    @stop = Stop.new

    respond_to do |format|
      format.json { render json: @stop }
    end
  end

  # GET /stops/1/edit
  def edit
    @stop = Stop.find(params[:id])
  end

  # POST /stops
  # POST /stops.json
  def create
    @stop = Stop.new(params[:truck])

    respond_to do |format|
      if @stop.save
        format.json { render json: @stop, status: :created, location: @stop }
      else
        format.json { render json: @stop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stops/1
  # PUT /stops/1.json
  def update
    @stop = Stop.find(params[:id])

    respond_to do |format|
      if @stop.update_attributes(params[:truck])
        format.json { head :no_content }
      else
        format.json { render json: @stop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stops/1
  # DELETE /stops/1.json
  def destroy
    @stop = Stop.find(params[:id])
    @stop.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

end
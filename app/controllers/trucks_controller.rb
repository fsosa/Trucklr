class TrucksController < ApplicationController

  # GET /trucks
  # GET /trucks.json
  def index
    @trucks = Truck.all

    respond_to do |format|
      format.json { render json: @trucks }
    end
  end

  # GET /trucks/1
  # GET /trucks/1.json
  def show
    @truck = Truck.find(params[:id])

    respond_to do |format|
      format.json { render json: @truck }
    end
  end

  # GET /trucks/new
  # GET /trucks/new.json
  def new
    @truck = Truck.new

    respond_to do |format|
      format.json { render json: @truck }
    end
  end

  # GET /trucks/1/edit
  def edit
    @truck = Truck.find(params[:id])
  end

  # POST /trucks
  # POST /trucks.json
  def create
    @truck = Truck.new(params[:truck])

    respond_to do |format|
      if @truck.save
        format.json { render json: @truck, status: :created, location: @truck }
      else
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trucks/1
  # PUT /trucks/1.json
  def update
    @truck = Truck.find(params[:id])

    respond_to do |format|
      if @truck.update_attributes(params[:truck])
        format.json { head :no_content }
      else
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trucks/1
  # DELETE /trucks/1.json
  def destroy
    @truck = Truck.find(params[:id])
    @truck.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

end

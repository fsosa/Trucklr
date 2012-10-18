class TrucksController < ApplicationController
  load_and_authorize_resource

  def profile
    @truck = current_truck
    redirect_to root_path unless @truck
    @is_owner = true
    respond_to do |format|
        format.json { render :json => @truck.to_json, :status => 200 }
        format.html { render 'show' }
      end
  end

  # GET /trucks
  # GET /trucks.json
  def index
  end

  # GET /trucks/1
  # GET /trucks/1.json
  def show
    @is_owner = (@truck == current_truck)
  end

  # GET /trucks/new
  # GET /trucks/new.json
  def new
  end

  # GET /trucks/1/edit
  def edit
  end

  # POST /trucks
  # POST /trucks.json
  def create
    if @truck.save
      respond_to do |format|
        format.json { render :show, :status => 200 }
        format.html { redirect_to @truck and return }
      end
    else
      respond_to do |format|
        format.json { render json: @truck.errors, :status => 403 }
        format.html { redirect_to @truck and return }
      end
    end
  end

  # PUT /trucks/1
  # PUT /trucks/1.json
  def update
    respond_to do |format|
      if @truck.update_attributes(params[:truck])
        format.json { head :no_content }
        format.html { redirect_to @truck }
      else
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trucks/1
  # DELETE /trucks/1.json
  def destroy
    @truck.destroy

    respond_to do |format|
      format.json { head :no_content }
      format.html { redirect_to root_path }
    end
  end

end

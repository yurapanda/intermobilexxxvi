class CarsTodoListsController < ApplicationController
  before_action :set_cars_todo_list, only: [:show, :edit, :update, :destroy, :ready_for_pickup, :picked_up]
  before_action :authenticate_user!
  # GET /cars_todo_lists
  # GET /cars_todo_lists.json

   respond_to :html, :json

  def index
    @cars_todo_lists = CarsTodoList.all
    @user = current_user
     respond_to :html, :json
    
  end

  # GET /cars_todo_lists/1
  # GET /cars_todo_lists/1.json
  def show
     @comments = Comment.where(cars_todo_list_id: @cars_todo_list)

  end

  # GET /cars_todo_lists/new
  def new
    @cars_todo_list = CarsTodoList.new
    @user = current_user
  end

  # GET /cars_todo_lists/1/edit
  def edit
  end


  def ready_for_pickup
    @cars_todo_list.update_attribute(:ready_for_pickup_at, Time.now)
    redirect_to @cars_todo_list, notice: "Car is Ready for Pickup."
  end   

  def picked_up
    @cars_todo_list.update_attribute(:pickedup_at, Time.now)
    redirect_to @cars_todo_list, notice: "Car has been pickedup."
  end   



  # POST /cars_todo_lists
  # POST /cars_todo_lists.json
  def create
    @cars_todo_list = CarsTodoList.new(cars_todo_list_params)

    respond_to do |format|
      if @cars_todo_list.save
        format.html { redirect_to @cars_todo_list, notice: 'Cars todo list was successfully created.' }
        format.json { render :show, status: :created, location: @cars_todo_list }
      else
        format.html { render :new }
        format.json { render json: @cars_todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars_todo_lists/1
  # PATCH/PUT /cars_todo_lists/1.json
  def update
    respond_to do |format|
      if @cars_todo_list.update(cars_todo_list_params)
        format.html { redirect_to @cars_todo_list, notice: 'Cars todo list was successfully updated.' }
        format.json { render :show, status: :ok, location: @cars_todo_list }
      else
        format.html { render :edit }
        format.json { render json: @cars_todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars_todo_lists/1
  # DELETE /cars_todo_lists/1.json
  def destroy
    @cars_todo_list.destroy
    respond_to do |format|
      format.html { redirect_to cars_todo_lists_url, notice: 'Cars todo list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cars_todo_list
      @cars_todo_list = CarsTodoList.find(params[:id])
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cars_todo_list_params
      params.require(:cars_todo_list).permit(:car_plate_number, :car_model, :car_owner_email, :owner_name, :image, :bill_summary, :comments)
    end
end

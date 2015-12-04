class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  def index
    @services = Service.all
    if current_user.isAdmin?
      redirect_to "/users"
    else
      redirect_to "/users/#{current_user.id}"
    end
  end

  # GET /services/1
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
    redirect_to "/services/#{params[:id]}"
  end

  # POST /services
  def create
    @service = Service.new(service_params)
    @service.approved = false
    @user = current_user
    @service.user_id = @user.id
    @user.hours = @user.hours + @service.hours

    if @service.save
      @user.save
      redirect_to @user
    else
      render :new
    end
  end

  # PATCH/PUT/services/1
  def update
    if @service.update(service_params)
      redirect_to @service
    else
      render :edit
    end
  end

  # DELETE /services/1
  def destroy
    @service.destroy
    @user = current_user
    @user.hours = @user.hours - @service.hours
    @user.save
    redirect_to @user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:placeName, :hours, :description)
    end
end

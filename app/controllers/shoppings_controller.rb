class ShoppingsController < ApplicationController
  before_action :set_shopping, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /shoppings or /shoppings.json
  def index
    @shoppings = Shopping.all.order("created_at desc")
  end

  # GET /shoppings/1 or /shoppings/1.json
  def show
  end

  # GET /shoppings/new
  def new
    if current_user.admin?
      @shopping = Shopping.new
    else
      redirect_to root_path, alert: "You are not authorized to create."
    end
  end

  # GET /shoppings/1/edit
  def edit
  end

  # POST /shoppings or /shoppings.json
  def create
    if current_user.admin?
      @shopping = Shopping.new(shopping_params)

      respond_to do |format|
        if @shopping.save
          format.html { redirect_to shopping_url(@shopping), notice: "Shopping was successfully created." }
          format.json { render :show, status: :created, location: @shopping }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @shopping.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path, alert: "You are not authorized to create."
    end
  end

  # PATCH/PUT /shoppings/1 or /shoppings/1.json
  def update
    if current_user.admin?
      respond_to do |format|
        if @shopping.update(shopping_params)
          format.html { redirect_to shopping_url(@shopping), notice: "Shopping was successfully updated." }
          format.json { render :show, status: :ok, location: @shopping }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @shopping.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path, alert: "You are not authorized to update."
    end
  end

  # DELETE /shoppings/1 or /shoppings/1.json
  def destroy
    if current_user.admin?
      @shopping.destroy

      respond_to do |format|
        format.html { redirect_to shoppings_url, notice: "Shopping was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      redirect_to root_path, alert: "You are not authorized to delete."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping
      @shopping = Shopping.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shopping_params
      params.require(:shopping).permit(:name, :description, :category, :price, :image)
    end
end

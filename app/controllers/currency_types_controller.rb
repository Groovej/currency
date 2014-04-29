class CurrencyTypesController < ApplicationController
  before_action :set_currency_type, only: [:show, :edit, :update, :destroy]

  # GET /currency_types
  # GET /currency_types.json
  def index
    @currency_types = CurrencyType.all
  end

  # GET /currency_types/1
  # GET /currency_types/1.json
  def show
  end

  # GET /currency_types/new
  def new
    @currency_type = CurrencyType.new
  end

  # GET /currency_types/1/edit
  def edit
  end

  # POST /currency_types
  # POST /currency_types.json
  def create
    @currency_type = CurrencyType.new(currency_type_params)

    respond_to do |format|
      if @currency_type.save
        format.html { redirect_to @currency_type, notice: 'Currency type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @currency_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @currency_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /currency_types/1
  # PATCH/PUT /currency_types/1.json
  def update
    respond_to do |format|
      if @currency_type.update(currency_type_params)
        format.html { redirect_to @currency_type, notice: 'Currency type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @currency_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /currency_types/1
  # DELETE /currency_types/1.json
  def destroy
    @currency_type.destroy
    respond_to do |format|
      format.html { redirect_to currency_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_currency_type
      @currency_type = CurrencyType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def currency_type_params
      params.require(:currency_type).permit(:country_id, :name, :value)
    end
end

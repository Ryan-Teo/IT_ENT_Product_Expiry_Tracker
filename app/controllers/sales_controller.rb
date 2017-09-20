class SalesController < ApplicationController
  def new
    @sale = new Sale
  end

  def create
    @sale = Sale.new(sale_params)
  end

  def update
     @sale = Sale.find[params[:saleID][:batchID]]
    
    
    respond_to do |format|
      if @sale.update_attributes(product_params)
        format.html { redirect_to @sale, notice: 'Sale has been updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @sale = Sale.find[params[:saleID][:batchID]]
  end

  def destroy
    @sale = Sale.find[params[:saleID][:batchID]]
    @sale.destroy
    redirect_to sales_path
  end

  def index
    @sale = Sale.all
  end

  def show
    @sale = Sale.find[params[:saleID][:batchID]]
  end
  
private
  def sale_params
    params.require(:sale).permit(:saleID, :batchID, :salePrice, :saleStartDate, :saleEndDate)
  end

end

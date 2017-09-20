class BatchesController < ApplicationController
  def new
    @batch = Batch.new
  end

  def create
    @batch = Batch.new(batch_params)    # Not the final implementation!
    if @batch.save
      flash[:success] = "Welcome to the Product Expiry Date App!"
    else
      render 'new'
    end
  end

  def update
    @batch = Batch.find[params[:batchID][:productID]]
    
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end
  
  private
  def batch_params
    params.require(:batch).permit(:batchID, :productID, :quantity, :expiryDate)
  end
  
end

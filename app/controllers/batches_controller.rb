class BatchesController < ApplicationController
  def new
    @batch = Batch.new
    @batch.productID = params[:productID]
  end

  def create
    @batch = Batch.new(batch_params)    # Not the final implementation!
    if @batch.save
      redirect_to '/batches?product=' + @batch.productID
      flash[:success] = "Welcome to the Product Expiry Date App!"
    else
      render 'new'
    end
  end

  def update
    @batch = Batch.find_by(batchID: params[:id])
    
    respond_to do |format|
      if @batch.update_attributes(batch_params)
        format.html { redirect_to '/batches?product=' + @batch.productID, notice: 'Batch has been updated.' }
        format.json { render :index, status: :ok, location: @batch }
      else
        format.html { render :edit }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def edit
     @batch = Batch.find_by(batchID: params[:id])
  end

  def destroy
    @batch = Batch.find_by(batchID: params[:id])
    @batch.destroy
    redirect_to '/batches?product=' + @batch.productID
  end

  def index
    @batches = Batch.all
  end

  def show
    @batch = Batch.find_by(batchID: params[:id])
  end
  
  private
  def batch_params
    params.require(:batch).permit(:batchID, :productID, :quantity, :expiryDate)
  end
  
end

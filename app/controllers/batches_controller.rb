class BatchesController < ApplicationController
  skip_before_filter :verify_authenticity_token  
  def new
    @batch = Batch.new
    @batch.productID = params[:productID]
    @o = [(0..9)].map(&:to_a).flatten
    @string = (0...8).map { @o[rand(@o.length)] }.join
    @batch.batchID = @string
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
    @batches = Batch.all.order('expiryDate')
  end

  def show
    @batch = Batch.find_by(batchID: params[:id])
  end
  
  #function to render the checkout page
  def checkout
    
  end
  
  #function to handle the data from the checkout page [POST]
  def reduce_quantity
    @batch = Batch.find_by(batchID: params[:id])
    #update the quantity 
    @batch.quantity -= 1
  end
  
  # def get_barcode
  #   @product = Product.find_or_initialize_by(productID: params[:productID])
  #   unless @product.new_record?
  #     #Goes to new batch
  #     respond_to do |format|
  #       format.html { redirect_to new_batch_url(:productID => @product.productID) }
  #       format.json { render action: 'show', status: :created, location: @product }
  #     end
  #     else
  #       redirect_to new_product_path(productID: params[:productID])
  #   end
  # end
  
  private
  def batch_params
    params.require(:batch).permit(:batchID, :productID, :quantity, :expiryDate)
  end
  
end

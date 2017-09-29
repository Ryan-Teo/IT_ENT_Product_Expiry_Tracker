class ProductsController < ApplicationController
  skip_before_filter :verify_authenticity_token  
  
   def new
    @product = Product.new
    @product.productID = params[:productID]
   end

  def create
    # Store a new instance of product with specified product_params
    @product =  Product.new(product_params)
    
    # if successfully, display flash message
    if @product.save
      flash[:success] = "New Product Added!"
      redirect_to products_path
    else
      render 'new'
    end
  end

  # This method is called onced submit button is clicked on Edit page
  def update
    #Find product by productID
    @product = Product.find_by(productID: params[:id])
    
    respond_to do |format|
      if @product.update_attributes(product_params)
        format.html { redirect_to products_path, notice: 'Product has been updated.' }
        format.json { render :index, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # render form for updating information on product
  def edit
    @product = Product.find_by(productID: params[:id])
  end

  # delete product
  def destroy
    @product = Product.find_by(productID: params[:id])
    @product.destroy
    redirect_to products_path
  end

  # render index page , lists all products in a table
  def index
    @products = Product.all
  end

  #show individual detailed product page
  def show
    @product = Product.find_by(productID: params[:productID])
  end
  
  
  
  def get_barcode
    @product = Product.find_or_initialize_by(productID: params[:productID])
    unless @product.new_record?
      #Goes to new batch
      respond_to do |format|
        format.html { redirect_to new_batch_url(:productID => @product.productID) }
        format.json { render action: 'show', status: :created, location: @product }
      end
      else
        redirect_to new_product_path(productID: params[:productID])
    end
  end
  
  
  # Product instance private attributes
  private 
  def product_params
     params.require(:product).permit(:productID, :name, :description, :price , batch_ids:[])
  end
end

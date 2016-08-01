class ProductsController < ApplicationController
  def index
    @products = Product.all
    # @review = current_user.reviews.build if logged_in?
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(permitted_product_params)
      if @product.save
        flash[:success] = 'Product was successfully created.'
        format.html { redirect_to @product }
      else
        format.html {render :new}
      end

  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.'}
      format.json { head :no_content }
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update #responds to patch request
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes!(permitted_product_params)
        flash[:success] = 'Product was successfully updated.'
        format.html { redirect_to product_path }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
        puts @product.errors.messages.inspect
      end
    end
  end



private

  def permitted_product_params
    params.require(:product).permit(:name, :price, :category, :product_id)
  end

end

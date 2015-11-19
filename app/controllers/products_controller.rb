class ProductsController < ApplicationController
  before_action :set_product,:except => [:index,:new,:create]

 def index
 @products = Product.search(params[:search])
end


def new
  @product = Product.new
end

def create
  @product = Product.new(product_params)
  if params[:preview_button] || !@product.save
        render :new

  else
        redirect_to products_path

  end
end

def show
end

def edit
end

def update
  if @product.update(product_params)
    redirect_to products_path
  else
    render :edit
  end
end

def destroy
  @product.destroy
  redirect_to products_path
end

private

def set_product
  @product = Product.find(params[:id])
end

def product_params
  params.require(:product).permit!
end

end

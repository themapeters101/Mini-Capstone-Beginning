class Api::ProductsController < ApplicationController

  def index
    @products = Product.all

    search_term = params[:search]
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]
    
    if search_term
      @products = @products.where("name iLIKE ? " "%#{search_term}")
    end

    sort_attribute = params[:sort]
    sort_order = params[:sort_order]

    if sort_attribute && sort_order
      @products = @products.order(sort_attribute => sort_order)
    elsif sort_attribute 
      @products = @products.order(sort_attribute)
    end
    render 'index.json.jbuilder'
  end
 
  def create
    @product = Product.new(
                            name: params[:name],
                            price: params[:price],
                            descrpition: params[:descrpition],
                            image_url: params[:image_url]
                            )
   if @product.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end
  
  def show
    @product = Product.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @product = Product.find(params[:id])

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.descrpition = params[:descrpition] || @product.descrpition
    @product.image_url = params[:image_url] || @product.image_url

    if @product.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destoy
    @product = Product.find(params[:id])
    @product.destroy
    render json: {message: "Product successfully destroyed."}
  end
end

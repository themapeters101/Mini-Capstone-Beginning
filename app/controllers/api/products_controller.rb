class Api::ProductsController < ApplicationController

  def index
    @products = Product.all
    render 'index.json.jbuilder'
  end
 
  def create
    @product = Product.new(
                            name: params[:name],
                            price: params[:price],
                            descrpition: params[:descrpition],
                            image_url: params[:image_url]
                            )
    @product.save
    render 'show.json.jbuilder'
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

    @product.save
    render 'show.json.jbuilder'
  end

  def destoy
    @product = Product.find(params[:id])
    @product.destroy
    render json: {message: "Product successfully destroyed."}
  end
end

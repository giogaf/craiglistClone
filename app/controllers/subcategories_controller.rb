class SubcategoriesController < ApplicationController
  before_action :set_subcategory, only: [:show]
  def show
  	@category= Category.find(@subcategory.category_id)
  	@category_name=@category.nombre
  	@lists= List.where(subcategory_id: params[:id])
  end

  private
  def set_subcategory
  	@subcategory= Subcategory.find(params[:id])
  end

end

class SubcategoriesController < ApplicationController
  before_action :set_subcategory, only: [:show]
  def show
  	@category_name=Category.find(@subcategory.category_id).nombre
  end

  private
  def set_subcategory
  	@subcategory= Subcategory.find(params[:id])
  end

end

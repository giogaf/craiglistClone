class CategoriesController < ApplicationController
  before_action :set_category,only: [:show]
  def show
  	@lists=List.where(category_id:params[:id])
  end
private
	def set_category
		@category= Category.find(params[:id])
	end
end

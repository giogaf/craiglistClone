class PagesController < ApplicationController
  def home
  	@category= Category.all
  end

  def about
  end

  def contact
  end
end

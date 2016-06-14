class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
    @category_options = Category.all.map {|c| [c.nombre.capitalize,c.id]}
    # select categorias y subcategorias separados
    #@subcategory_options=[]
    #@category_options.each do |cat|
    #@subcategory_options<<Subcategory.where(category_id:cat[1]).map{|c| [c.nombre,c.id]}
    # end
    # select group categorias/subcategorias
    @subcategory_options={}
    @category_options.each do |v,c|
      @subcategory_options.store(v, Subcategory.where(category_id:c).map{|sub|[sub.nombre,sub.id]})   
    end
    
  end

  # GET /lists/1/edit
  def edit
    @category_options = Category.all.map {|c| [c.nombre.capitalize,c.id]}
    @subcategory_options={}
    @category_options.each do |v,c|
      @subcategory_options.store(v, Subcategory.where(category_id:c).map{|sub|[sub.nombre,sub.id]})   
    end

  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)
    @list.category_id = @list.subcategory.category_id

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:titulo, :descripcion, :category_id, :subcategory_id)
    end
end

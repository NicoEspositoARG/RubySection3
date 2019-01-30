class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.all
  # si lo modifico .limit(1) devuelve un solo obj
end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    # antes de ejecutar el metodo, ejecuta el before_action, que define el metodo set_blog
  end

  # GET /blogs/new
  def new
    @blog = Blog.new #crea la instancia, sin parametros. se usa para mapear con la vista new.html
    #est
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create # cuando en la vista clickeo create, se mapea con este metodo
    @blog = Blog.new(blog_params) #esta llamando al método blog_params que está al final.
      #est
      respond_to do |format|
        if @blog.save
          format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        #redirect_to @blog es lo mismo que blog_path(@blog), es la ruta
      else
        format.html { render :new }

      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        
      else
        format.html { render :edit }
        
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body)
    end
  end

class RecipesController < ApplicationController
    # before_action :authenticate_user, only: %i[new create edit update destroy]
    before_action :authenticate_user, except: :index
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  
    def index
      @recipes = Recipe.all
    end
  
    def show
    end
  
    def new
      @recipe = Recipe.new
    end
  
    def edit
    end
  
    def create
      @recipe = Recipe.new(recipe_params)
  
      respond_to do |format|
        if @recipe.save
          upload_file
          format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @recipe.update(recipe_params)
          upload_file
          format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_recipe
        @recipe = Recipe.find(params[:id])
      end

      def upload_file
        if uploaded_file = params[:recipe][:image]
          pathname = Rails.root.join 'public', 'images', uploaded_file.original_filename
          File.open(pathname, 'wb') do |file|
            file.write uploaded_file.read
          end
          @recipe.update_attribute :image_filename, uploaded_file.original_filename
        end
      end

      # Only allow a list of trusted parameters through.
      def recipe_params
        params.require(:recipe).permit(
            :name, :description, :difficulty, :author_id, ingredient_ids: [], comments_attributes: [ :body ]
        )
      end
  end
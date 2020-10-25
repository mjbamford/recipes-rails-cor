class RecipesController < ApplicationController
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
          format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @recipe.update(recipe_params)
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
  
      # Only allow a list of trusted parameters through.
      def recipe_params
        params.require(:recipe).permit(
            :name, :description, :difficulty, :author_id, ingredient_ids: [], comments_attributes: [ :body ]
        )
      end
  end
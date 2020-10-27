class RecipesController < ApplicationController
    before_action :find_recipe, only: [:show, :edit, :update, :destroy]
    before_action :baria_user, only: [:edit, :update, :destroy]
    before_action :authenticate_user
    
    
    def index
        @search = Recipe.ransack(params[:q])
        @recipes = @search.result
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
        if @recipe.save
            redirect_to recipes_path, notice: "レシピを投稿しました"
        else
            render :new
        end
    end
    
    def update
        if @recipe.update(recipe_params)
            redirect_to recipes_path, notice: "レシピを更新しました"
        else
            render :edit
        end
    end
    
    def destroy
        @recipe.destroy
        redirect_to recipes_path, notice: "レシピを削除しました"
    end
    
    private
    
    def find_recipe
        @recipe = Recipe.find(params[:id])
    end
    
    def recipe_params
        params.require(:recipe).permit(:title, :content, :image_recipe, :image_recipe_cache, :remove_image_recipe, :description).merge(user_id: current_user.id)
    end
    
    def baria_user
        unless Recipe.find(params[:id]).user.id.to_i == current_user.id
            redirect_to recipes_path(current_user), notice: "権限がありません"
        end
    end
    
end

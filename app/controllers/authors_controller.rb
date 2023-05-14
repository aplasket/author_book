class AuthorsController < ApplicationController
  def index
    @authors = Author.sort_by_creation
  end

  def new
    @author = Author.new
  end

  def create
    author = Author.create!(author_params)

    redirect_to '/authors'
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit
    
  end

  private
    def author_params
      params.permit(:name, :currently_alive, :age)
    end
end
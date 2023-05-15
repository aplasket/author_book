class AuthorsController < ApplicationController
  def index
    @authors = Author.sort_by_creation
  end

  def new
    @author = Author.new
  end

  def create
    Author.create!(author_params)

    redirect_to "/authors"
  end

  def show
    @author = Author.find(params[:id])
  end
  
  def edit
    @author = Author.find(params[:id])
  end

  def update
    author = Author.find(params[:id])
    author.update(author_params)
    redirect_to "/authors/#{author.id}"
  end

  private
    def author_params
      params.permit(:name, :currently_alive, :age)
    end
end
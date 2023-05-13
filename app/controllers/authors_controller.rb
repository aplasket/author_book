class AuthorsController < ApplicationController
  def index
    @authors = Author.sort_by_creation
  end

  def new
    @author = Author.new
  end

  def create
    author = Author.new({
      name: params[:name],
      currently_alive: params[:currently_alive],
      age: params[:age]
    })

    author.save

    redirect_to '/authors'
  end

  def show
    @author = Author.find(params[:id])
  end

end
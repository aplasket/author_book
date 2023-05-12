class AuthorsController < ApplicationController
  def index
    @authors = Author.sort_by_creation
  end


  def show
    @author = Author.find(params[:id])
  end
end
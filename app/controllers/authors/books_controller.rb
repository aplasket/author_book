class Authors::BooksController < ApplicationController
  def index
    @author = Author.find(params[:author_id])

    if params[:sort] == "AZ"
      @books = @author.sort_books
    else
      @books = @author.books
    end
  end

  def new
    @author = Author.find(params[:author_id])
    @book = Book.new
  end

  def create
    author = Author.find(params[:author_id])
    author.books.create!(book_params)
    redirect_to "/authors/#{author.id}/books"
  end

  private
    def book_params
      params.permit(:title, :price, :rating, :purchasable_online)
    end
end
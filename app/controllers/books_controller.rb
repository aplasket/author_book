class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to "/books/#{params[:id]}"
  end

  private
    def book_params
      params.permit(:title, :price, :rating, :purchasable_online)
    end
end
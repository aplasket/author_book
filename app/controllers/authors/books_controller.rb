class Authors::BooksController < ApplicationController
  def index
    @author = Author.find(params[:author_id])
    @books = get_books
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
  
  def get_books
    if !params[:price].nil?
      @author.books_over_price(params[:price])
    elsif params[:sort] == "AZ"
      @author.sort_books
    else
      @author.books
    end
  end
end
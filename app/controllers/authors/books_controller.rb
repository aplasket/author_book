# module Authors
#   class BooksController < ApplicationController

#   end
# end

class Authors::BooksController < ApplicationController
  def index
    @author = Author.find(params[:author_id])
    @books = @author.books
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
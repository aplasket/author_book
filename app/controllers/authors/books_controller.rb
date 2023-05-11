# module Authors
#   class BooksController < ApplicationController

#   end
# end

class Authors::BooksController < ApplicationController
  def index
    @author = Author.find(params[:author_id])
    @books = @author.books
  end
end
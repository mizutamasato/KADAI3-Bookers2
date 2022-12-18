class BooksController < ApplicationController
  def new
    #@book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @user = current_user
    @book.save
    redirect_to book_path#'/books'
  end
  
  def index
    @user = current_user
    #@books = Book.all
  end

  def show
  end

  def edit
  end
  
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

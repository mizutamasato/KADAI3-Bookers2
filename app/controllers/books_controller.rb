class BooksController < ApplicationController
  def new
    #@book = Book.new
  end

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if @new_book.save
    flash[:notice] = "succcessfully!!"
    redirect_to book_path(@new_book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def index
    @user = current_user
    @books = Book.all
    @new_book = Book.new
  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @user = current_user
    if @book.update(book_params)
      flash[:notice] = "succcessfully!!"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

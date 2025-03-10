class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      error_messages = "#{@book.errors.count} errors prohibited this obj from being saved:<br>" +
      @book.errors.full_messages.map { |msg| "・#{msg}" }.join("<br>")
      flash[:alert] = error_messages.html_safe
      redirect_to books_path
    end
  end

  def update
    is_matching_login_book
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def edit
    is_matching_login_book
    @book = Book.find(params[:id])
  end

  def index
   @books = Book.all
   @book = Book.new
  end

  def show
    @book_detail= Book.find(params[:id])
    @book = Book.new
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_book
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
  end
end
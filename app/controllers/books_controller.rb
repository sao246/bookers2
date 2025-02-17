class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to '/home/top'
  end

  def index
  end

  def show
  end

    # Create bookデータのストロングパラメータ
    private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end

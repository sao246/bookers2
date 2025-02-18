class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to '/'
  end

  def index
   @books = Book.all
  end

  def show
    @book = Book.find(params[:id]) 
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'  # 投稿一覧画面へリダイレクト  
  end
  
  # Create bookデータのストロングパラメータ
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def create         # インデックス画面で Create Book ボタンを押したときに呼び出されるアクション
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :books
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end


private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

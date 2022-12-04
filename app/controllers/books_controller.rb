class BooksController < ApplicationController
  before_action :book_all, only: [:index, :create, :destroy]
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  def index
    @book = Book.new
  end
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :index
    end
  end
  def show
  end

  def edit
  end
  def update
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end
  def destroy
    @book.destroy
    redirect_to books_path
  end
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  def book_all
    @books = Book.all
  end
  def find_book
    @book = Book.find(params[:id])
  end
end

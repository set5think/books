class BooksController < ApplicationController

  before_filter :find_book, only: [:show, :edit, :update, :destroy]
  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      flash[:notice] = "failed to create book"
      render :new
    end
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      flash[:notice] = "failed to update book"
      render :edit
    end
  end

  def destroy
    if @book.destroy
      redirect_to books_path
    else
      flash[:notice] = "failed to destroy book"
      redirect_to book_path(@book)
    end
  end

  private

  def book_params
    params.require(:book).permit!
  end

  def find_book
    @book = Book.find(params[:id])
  end

end

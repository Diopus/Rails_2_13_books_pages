module Web
  class PagesController < ApplicationController
    before_action :set_book, only: %i[ index new create ]
    before_action :set_page, only: %i[ show edit update destroy ]

    # GET /pages or /pages.json
    def index
      @pages = @book.pages
    end

    # GET /pages/1 or /pages/1.json
    def show
    end

    # GET /pages/new
    def new
      @page = @book.pages.build
    end

    # GET /pages/1/edit
    def edit
      @book = @page.book
    end

    # POST /pages or /pages.json
    def create
      @page = @book.pages.build(page_params)

      respond_to do |format|
        if @page.save
          format.html { redirect_to book_path(@book), notice: "Page was successfully created." }
          format.json { render :show, status: :created, location: @page }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /pages/1 or /pages/1.json
    def update
      debugger
      @book = @page.book
      respond_to do |format|
        if @page.update(page_params)
          format.html { redirect_to book_path(@book), notice: "Page was successfully updated." }
          format.json { render :show, status: :ok, location: @page }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /pages/1 or /pages/1.json
    def destroy
      @book = @page.book 
      @page.destroy!

      respond_to do |format|
        format.html { redirect_to book_path(@book), notice: "Page was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      def set_book
        @book = Book.find(params[:book_id])
      end
      
      # Use callbacks to share common setup or constraints between actions.
      def set_page
        @page = Page.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def page_params
        params.require(:page).permit(:body, :book_id)
      end
  end
end

class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]
  def index
    @documents = current_user.documents.all
  end

  def show
  end

  def new
    @document = Document.new
  end

  def create
    # params -> { name: '6e7', photos: [photo1, photo2] }
    @document.
    if creator.save
      @travel = creator.travel
      redirect_to travel_path(@travel)
    else
      creator.errors.full_messages
        render :new
    end
  end

  def edit
  end

  def update
     @document.update(document_params)
    if @document.save
    redirect_to document_path(@document), notice: 'Le document a bien été mis à jour.'
    else
      @document.errors.full_messages
    end
  end

  def destroy
    @document.destroy
    redirect_to documents_path, notice: 'Le document a bien été supprimé.'
  end


  private

  def set_document
    @document = current_user.documents.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:name, :expiration_date, :type, :files)
  end

end

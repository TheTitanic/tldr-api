class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :update, :delete]

  # GET /documents
  # List all documents.
  def index
    @documents = Document.all

    render json: @documents
  end

  # GET /documents/:id
  # Show an individual document.
  def show
    render json: @document
  end

  # POST /documents
  # Create a new document.
  def create
    @document = Document.new(document_params)

    if @document.save
      render json: @document, status: :created, location: @document
    else
      render json: @document.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /documents/:id
  # Update an existing document.
  def update
    @document = Document.find(params[:id])

    if @document.update(document_params)
      head :no_content
    else
      render json: @document.errors, status: :unprocessable_entity
    end
  end

  # DELETE /documents/:id
  # Delete an existing document.
  def destroy
    @document.destroy

    head :no_content
  end

  private

  def set_document
    @document = Document.find(params[:id])
  end

  def document_params
    params[:document]
  end
end

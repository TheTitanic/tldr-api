class SnippetsController < ApplicationController
  before_action :set_snippet, only: [:show, :update, :delete]

  # GET /snippets
  # List all snippets.
  def index
    @snippets = Snippet.all

    render json: @snippets
  end

  # GET /snippets/:id
  # Show an individual snippet.
  def show
    render json: @snippet
  end

  # POST /snippets
  # Create a new snippet.
  def create
    @snippet = Snippet.new(snippet_params)

    if @snippet.save
      render json: @snippet, status: :created, location: @snippet
    else
      render json: @snippet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /snippets/:id
  # Update an existing snippet.
  def update
    @snippet = Snippet.find(params[:id])

    if @snippet.update(snippet_params)
      head :no_content
    else
      render json: @snippet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /snippets/:id
  # Delete an existing snippet.
  def destroy
    @snippet.destroy

    head :no_content
  end

  private

  def set_snippet
    @snippet = Snippet.find(params[:id])
  end

  def snippet_params
    params[:snippet]
  end
end

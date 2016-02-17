class TranslationsController < ApplicationController
  before_action :set_translation, only: [:show, :update, :delete]

  # GET /translations
  # List all translations.
  def index
    @translations = Translation.all

    render json: @translations
  end

  # GET /translations/:id
  # Show an individual translation.
  def show
    render json: @translation
  end

  # POST /translations
  # Create a new translation.
  def create
    @translation = Translation.new(translation_params)

    if @translation.save
      render json: @translation, status: :created, location: @translation
    else
      render json: @translation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /translations/:id
  # Update an existing translation.
  def update
    @translation = Translation.find(params[:id])

    if @translation.update(translation_params)
      head :no_content
    else
      render json: @translation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /translations/:id
  # Delete an existing translation.
  def destroy
    @translation.destroy

    head :no_content
  end

  private

  def set_translation
    @translation = Translation.find(params[:id])
  end

  def translation_params
    params[:translation]
  end
end

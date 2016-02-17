class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :delete]

  # GET /comments
  # List all comments.
  def index
    @comments = Comment.all

    render json: @comments
  end

  # GET /comments/:id
  # Show an individual comment.
  def show
    render json: @comment
  end

  # POST /comments
  # Create a new comment.
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/:id
  # Update an existing comment.
  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      head :no_content
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/:id
  # Delete an existing comment.
  def destroy
    @comment.destroy

    head :no_content
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params[:comment]
  end
end

class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :update, :delete]

  # GET /profiles
  # List all profiles.
  def index
    @profiles = Profile.all

    render json: @profiles
  end

  # GET /profiles/:id
  # Show an individual profile.
  def show
    render json: @profile
  end

  # POST /profiles
  # Create a new profile.
  # Called on account creation.
  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      render json: @profile, status: :created, location: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /profiles/:id
  # Update an existing profile.
  def update
    @profile = Profile.find(params[:id])

    if @profile.update(profile_params)
      head :no_content
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /profiles/:id
  # Delete an existing profile.
  # Called on account deletion.
  def destroy
    @profile.destroy

    head :no_content
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params[:profile]
  end
end

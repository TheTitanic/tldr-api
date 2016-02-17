class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :update, :destroy]

  # POST /accounts
  # Create a new account.
  def create
    @account = Account.new(account_params)

    if @account.save
      render json: @account, status: :created, location: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accounts/:id
  # Update an existing account.
  def update
    @account = Account.find(params[:id])

    if @account.update(account_params)
      head :no_content
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /accounts/:id
  # Delete an existing account.
  def destroy
    @account.destroy

    head :no_content
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params[:account]
  end
end

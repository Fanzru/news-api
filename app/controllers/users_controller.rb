

class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  # GET /users or /users.json
  def index
    @users = User.all
    render json: {
      "code": 200,
      "status": true,
      "message": "get all data successfully",
      "value": @users,
    }
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
    render json: {
      "code": 200,
      "status": true,
      "message": "get all data successfully",
      "value": @user,
    }
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    begin
      @user = User.create(
          name: params[:name]
      )
      render json: {
        "code": 200,
        "status": true,
        "message": "save data successfully",
        "value": @user,
      }
    rescue
      render json: {
        "code": 400,
        "status": false,
        "message": "save data failed",
      }
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    begin
      @user = User.where(id: params[:id]).update(name: request.params[:name] )
      render json: {
        "code": 200,
        "status": true,
        "message": "update data successfully",
        "value": @user,
      }
    rescue
      render json: {
        "code": 400,
        "status": false,
        "message": "update data failed",
      }
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    begin
      @user.destroy
      render json: {
        "code": 200,
        "status": true,
        "message": "delete data successfully",
      }
    rescue
      render json: {
        "code": 400,
        "status": false,
        "message": "delete data failed",
      }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {})
    end
end

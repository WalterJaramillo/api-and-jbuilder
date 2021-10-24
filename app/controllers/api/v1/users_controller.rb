class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    #render json: @user.to_json(only: [:id, :username])
    render :show
  end

  # POST /users
  def create
    #curl -i -H "Content-Type:application/json" -X POST http://localhost:3000/api/v1/users -d '{"username": "Alan Brito"}'
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    #curl -i -H "Content-Type:application/json" -X PUT http://localhost:3000/api/v1/users/1 -d '{"username": "Viaa"}
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    #curl -i -H "Content-Type:application/json" -X DELETE http://localhost:3000/api/v1/users/1 -d '{"username": "Viaa"}'
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params  # permite o niega los parametros que nos pueden enviar en este caso solo es permitido username
      params.require(:user).permit(:username,:correo)
    end
end

class Api::V1::UsersController < ApiController
  before_action :set_user, only: [:show, :update, :destroy]

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: '404 not found' }, status: 404
  end

  def index
    users = User.all
    render json: users
  end

  def show
    render json: @user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update_attributes(user_params)
      head :no_content
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy!
    head :no_content
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      # params.fetch(:user, {}).permit(:name, :email, :password)
      params.permit(:name, :email, :password)
    end

    def render_status_404(exception)
      render json: { errors: [exception] }, status: 404
    end

    def render_status_500(exception)
      render json: { errors: [exception] }, status: 500
    end
end
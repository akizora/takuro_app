class Api::V1::LibrariesController < ApiController
    before_action :set_library, only: [:show]

    # ActiveRecordのレコードが見つからなければ404 not foundを応答する
    rescue_from ActiveRecord::RecordNotFound do |exception|
        render json: { error: '404 not found' }, status: 404
      end
    
    def index
      # libraries = Library.all
      libraries = Library.where(city: params[:city])
      render json: libraries
    end

    def show
      libraries = Library.where(city: params[:id])
      render json: libraries
    end

    def show_detail
      libraries = Library.where(city: params[:name]).where(id: params[:id])
      render json: libraries
    end

  private
    def set_library
      @library = Library.where(city: params[:name])
    end
end

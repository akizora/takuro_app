class Api::V1::CitiesController < ApiController

  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound do |exception|
      render json: { error: '404 not found' }, status: 404
    end
  
  def index
    cities = City.where(pref_id: "13")
    render json: cities
  end

  # 人気のエリアだけ表示させる（お気に入りのエリアは設定させたい）
  def show_popular_city
    # popularcities = City.where(pref_id: "13").where('id like ?', '6%')
    popularcities = City.where(pref_id: "13").where(popularflg: "1")
    render json: popularcities
  end

  def show
    cities = City.where(pref_id: "13")
    render json: cities
  end
end

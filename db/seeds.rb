# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ActiveSupport::JSONを使ってhoge.jsonをデコードしてrubyオブジェクトに変換。変数jsonに展開
# json = ActiveSupport::JSON.decode(File.read('libraries_tokyo.json'))

# 変数jsonに入った配列状態のjsonデータを一つ一つ取り出して、モデル.createを使ってdbに投入
# json.each do |data|
#     Library.create(systemid:data['systemid'], systemname:data['systemname'], libkey:data['libkey'], 
#     libid:data['libid'], short:data['short'], formal:data['formal'], url_pc:data['url_pc'], address:data['address'],
#      pref:data['perf'], city:data['city'], post:data['post'], tel:data['tel'], geocode:data['geocode'], category:data['category'])
# end

# Pref data
# pref_data = ActiveSupport::JSON.decode(File.read('prefs.json'))
# pref_data.each do |data|
#     Pref.create(id:data['id'], name:data['name'])
# end

# City data
city_data = ActiveSupport::JSON.decode(File.read('cities.json'))
city_data.each do |data|
    City.create(id:data['id'], name:data['name'], pref_id:data['pref_id'])
end


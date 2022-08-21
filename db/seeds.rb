# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Jenre.create([
  { name: 'ひとり' },
  { name: '友人' },
  { name: 'デート' },
  { name: '家族' },
  { name: 'ドライブ' },
  { name: 'ランニング' }
])

Place.create([
  { name: '北海道' },
  { name: '東北' },
  { name: '関東' },
  { name: '中部' },
  { name: '近畿' },
  { name: '中国' },
  { name: '四国' },
  { name: '九州' }
])

Category.create([
  { name: '街並み' },
  { name: '駅' },
  { name: 'ビル' },
  { name: '施設' },
  { name: '展望台' },
  { name: 'イルミネーション' },
  { name: '公園' },
  { name: '河川' },
  { name: '海岸' },
  { name: '山' }
])


Admin.create!(
  id: '1',
  email: 'admin@admin',
  password: '202020',
)
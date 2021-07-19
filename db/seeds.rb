# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tag.create([
  { tag_name: '刺身・寿司'},
  { tag_name: '焼き物'},
  { tag_name: '揚げ物・煮物'},
  { tag_name: '前菜・〆'}
])

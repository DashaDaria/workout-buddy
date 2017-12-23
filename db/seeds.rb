# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
upper_body = Category.create(name: "upper body")
core = Category.create(name: "core")
lower_body = Category.create(name: "lower body")
full_body = Category.create(name: "full body")


plank = Exercise.create(
  name: "plank",
  category_id: core.id,
  difficulty: 2,
  how: "Get in the pushup position, only put your forearms on the ground instead of your hands",
  length: 30)
squat = Exercise.create(
  name: "squat",
  category_id: lower_body.id,
  difficulty: 1,
  how: "Stand with your head facing forward and your chest held up and out.",
  length: 30)
burpee = Exercise.create(
  name: "burpee",
  category_id: full_body.id,
  difficulty: 3,
  how: "Stand with your feet shoulder-width apart, weight in your heels, and your arms at your sides.",
  length: 30)

  dasha = User.create(name: "dasha", email: "dasha@me.com", password: '123')

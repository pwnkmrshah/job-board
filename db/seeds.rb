# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if AdminUser.count == 0
  AdminUser.create!(email: 'admin@job.com', password: 'password', password_confirmation: 'password') if Rails.env.development? || Rails.env.qa?
end

if User.count ==  0
  for i in 0..50 do
    Job.create(
      company_name: Faker::Company.name,
      title: Faker::Company.profession ,
      skills: Faker::Company.industry,
      description: Faker::Company.bs,
      locality: Faker::Address.city
    )
  end
end

if  Plan.count == 0
  Plan.create(stripe_plan_id: 'plan_KU8eEdaF8hfcLn',  stripe_product_id: 'prod_KU8c9Acl4AcJDR', stripe_price_id: 'price_1JpAcmSDuAfvGjIgdEuC2S96')
end

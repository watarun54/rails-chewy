# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = []
500.times do |each_idx|
  users << User.new(
              name: "user_#{each_idx}",
              age: rand(20..65)
            )
end
User.import! users

user_ids = User.all.pluck(:id)

100.times do |batch_idx|
  receipts = []
  1000.times do |each_idx|
    receipts << Receipt.new(
                  title:  "receipt_#{batch_idx}_#{each_idx}",
                  amount: rand(1000..100_000),
                  issued_at: Random.rand(Date.new(2018, 1, 1)..Date.new(2022, 1, 1)),
                  user_id: user_ids.sample
                )
  end
  Receipt.import! receipts
end

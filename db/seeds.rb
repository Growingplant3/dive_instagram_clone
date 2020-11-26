50.times do
  user = User.new
  user.name = Faker::Name.unique.name
  user.email = Faker::Internet.unique.email
  user.password = "abcdefgh"
  user.password_confirmation = "abcdefgh"
  user.comment = Faker::Games::SuperMario.character
  user.save
end
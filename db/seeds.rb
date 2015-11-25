User.create!(name:  "Example User",
             email: "bla@bla.bla",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true
)

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@bla.bla"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
20.times do
  content = Faker::Lorem.sentences(5)
  title = Faker::Lorem.sentence(rand(3..6))
  tags = Faker::Lorem.words(rand(1..3))

  users.each { |user| user.posts.create!(body: content, title: title, tags: tags) }
end

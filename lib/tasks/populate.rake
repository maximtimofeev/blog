namespace :db do
  desc "Fill users database"
  task populate: [ 'db:drop', 'db:create', 'db:migrate' ] do
    require 'faker'
    
    2.times do
      user = User.create!(
        name: Faker::Overwatch.hero,
        email: Faker::Internet.email,
        moderator: false,
        creator: false,
        banned: false)
      2.times do
        post = Post.create!(
          title: Faker::WorldOfWarcraft.hero,
          body: Faker::WorldOfWarcraft.quote,
          visible: true,
          user: user)
        Comment.create!(
          body: "This is my comment",
          user: user,
          post: post,
          visible: true)      
      end
    end
  end
end
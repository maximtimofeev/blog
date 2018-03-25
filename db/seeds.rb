Comment.destroy_all
Post.destroy_all
User.destroy_all

hash_users = 10.times.map do
  {
  name: Faker::Internet.user_name[0...16],
  email: Faker::Internet.safe_email
  }
end
users = User.create! hash_users
users.first(7).each { |u| u.update creator: true }
users.first(2).each { |u| u.update moderator: true }

creators = User.where(creator: true)
hash_posts = 20.times.map do
  {
    title: Faker::Hipster.paragraph,
    body: Faker::Hipster.paragraphs,
    user: creators.sample
  }
end

posts = Post.create! hash_posts
hash_comments = 200.times.map do
  {
    body: Faker::Hipster.paragraphs,
    user: users.sample,
    post: posts.sample
      }
end
Comment.create! hash_comments
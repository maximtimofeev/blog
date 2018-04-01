Comment.destroy_all
Post.destroy_all
User.destroy_all

hash_users = 10.times.map do
  email = Faker::Internet.safe_email
  {
    name: Faker::Internet.user_name[0...16],
    email: email,
    password: email
  }
end
users = User.create! hash_users
users.first(7).each { |u| u.update creator: true }
users.first(2).each { |u| u.update moderator: true }

creators = User.where(creator: true)
hash_posts = 20.times.map do
  {
    title: Faker::Hipster.paragraph,
    body: Faker::Hipster.paragraph,
    user: creators.sample
  }
end

posts = Post.create! hash_posts
hash_commentaries = 200.times.map do
  commentable = ((rand(2) == 1) ? posts : users).sample
  {
    body: Faker::Hipster.paragraph,
    user: users.sample,
    commentable_id: commentable.id,
    commentable_type: commentable.class.to_s
  }
end
Comment.create! hash_commentaries
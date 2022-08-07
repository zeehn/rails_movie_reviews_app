# Rails Movies Reviewing System
This is a rails based application that I have built during my course of Rails 6 by Pragmatic Studios. 

## About app 
- User authentication and authorization built from scratch without using any gem.
- Active Storage file uploads to Amazon S3
- Favorites Feature implemented where only authenticated users can like/fav the movies.
- Categories feature implemented where movies can be categorized based on genre.
- Hosted using Heroku free tier and PostgreSQL database
- App uses Multiple through associations to prevent 1+n query problem.
- Custom scopes are defined using Ruby Lambdas.
- App consists of Multiple many to many associations & one polymorphic association 

# Installation
```
git clone https://github.com/zeehn/rails_movie_reviews_app.git
cd rails_movie_reviews_app
bundle install
```


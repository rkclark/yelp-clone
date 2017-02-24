# Yelp Clone

### Makers Academy Week 8 Challenge - Ruby on Rails

To complete this challenge I had to learn Ruby on Rails from scratch and build a basic clone of Yelp.com in one week.

In order to stretch my learning as far as possible, I completed all of the basic  requirements in the specification as well as the additional 'bonus challenges'. I chose to focus purely on the back-end mechanics of the application, so no time was spent on any front-end design - hence the ugliness!

The app is deployed to Heroku, [click here to have a look.](https://rkclark-yelp-clone.herokuapp.com/)

## Specification

The application fulfils the following specification:

#### v1

- Visitors can create new restaurants using a form, specifying a name and description
- Restaurants can be edited and deleted
- Visitors can leave reviews for restaurants, providing a numerical score (1-5) and a comment about their experience
- The restaurants listings page should display all the reviews, along with the average rating of each restaurant
- Validations should be in place for the restaurant and review forms - restaurants must be given a name and rating, reviews must be given a rating from 1-5 (comment is optional)

#### v2

- Users can register/login directly with the site
- Users can login via Facebook
- Some indication should be given on the page (as part of the layout) whether the user is currently logged in, along with links to the available actions (i.e. Logout/Edit account is signed in, otherwise Sign In/Sign Up)

#### v3
- A user must be logged in to create restaurants
- Users can only edit/delete restaurants which they've created
- Users can only leave one review per restaurant
- Users can delete their own reviews

#### v4 - Bonus Challenges

- Each restaurant displays its average review rating
- Users can endorse reviews
- Each review is displayed with its endorsement count
- The page does not reload when a new endorsement is created (i.e. use AJAX)
- The view templates are refactored using partials
- Uses can add an image when they create a restaurant
- The restaurant images are hosted on AWS S3

## Technologies Used

**Framework**

- Ruby on Rails 5.0.1
- Devise for User model
- Haml for view template engine
- Paperclip for image handling

**Database**

- Postgresql

**Testing**
- RSpec
- Capybara
- Poltergeist
- Database Cleaner

**External Services**
- Facebook Omniauth
- Amazon Web Services S3 for image hosting

## Installation and Usage

*Requires Facebook Developer and Amazon Web Services S3 accounts*

- Create a new Facebook App, set the site URL to `http://localhost:3000`
- Create a new AWS S3 Bucket
- Clone this repo
- Run `bundle install` in project root directory
- Create a `.env` file in the project root containing the following environment variables:
```
FACEBOOK_APP_SECRET --> Your Facebook Developer App Secret
S3_BUCKET_NAME --> Your AWS Bucket name
AWS_ACCESS_KEY_ID --> Your AWS Access Key
AWS_SECRET_ACCESS_KEY --> Your AWS Secret Acesss Key
AWS_REGION --> Your AWS Region, e.g. 'eu-west-2'
AWS_HOST_NAME --> Your AWS Host Name, e.g. s3.eu-west-2.amazonaws.com
```
- Run `bin/rake db:create` to create databases
- Run `bin/rake db:migrate` to run database migrations
- Run `bin/rails s` to run the rails server
- Open `http://localhost:3000` to view the app

### Running the Tests

Run `rspec` in the project root directory

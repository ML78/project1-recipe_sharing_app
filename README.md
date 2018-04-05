# Project #1: Recipe-sharing app

A web app for sharing recipe ideas built with Ruby on Rails and deployed to Heroku.

Start sharing today: https://recipe-ideas.herokuapp.com

## Technical Specifications
* Rails v5.1.5
* Ruby v2.4.1
* Postgres database

### Approach
The app utilises the model–view–controller (MVC) framework of Rails and the Bootstrap front-end framework.

* Models:
  * User - Users set up an account via a form and have their own profile page listing the recipes contributed.
  * Recipe - Users add recipes via a form.
  * Category - Users add categories to recipes from a pre-set list via the new recipe form. Admin manages these categories.  
  * Ingredient - Users add ingredients to recipes via the new recipe form. New ingredients can be added by the user if they are not on the existing list selection.


* Handles data validation:
  * Sign up information - verifying valid email addresses and setting secure passwords.
  * All fields in the forms are set as required.
  * Incorrect inputs are handled through error messages.


* Handles authentication and authorization. Examples include:
  * All users must be signed in to access certain app features, such as adding new recipes.
  * Users can only edit and delete their own recipes.
  * Only the Admin user can add/edit/delete categories and edit/delete ingredients.  


* The app endeavours to adhere to best practices including the use of partials in views to adhere to the  principle of ***DRY*** (Don't Repeat Yourself).

* Ruby Gems have been installed including:
  * pry-rails v0.3.6 for development
  * rails_12factor v0.0.3 for production
  * brcrypt v3.1.7 for password encryption
  * jquery-rails v4.3.1 and bootstrap-sass v3.3.7 for styling
  * cloudinary v1.9.1 for image file uploads
  * wikipedia-client v1.10.0 to get wikipedia content through their API

## Dedication

Dedicated to Lambert Lam because he will definitely use this app. :fork_and_knife: :tropical_drink: :pizza: :spaghetti:

## TODO
Please refer to the file: `todo.md`

## Terms & Conditions
This project is licensed under the MIT License.

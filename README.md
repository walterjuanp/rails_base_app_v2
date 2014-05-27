# Rails Base application

Rails 4.1 (using Ruby 2.0.0) base application with Devise authentication and private, public, admin sections.

For start using app:

```
# download
$ git clone git@github.com:walterjuanp/rails_base_app_v2.git

# install gems
$ cd rails_base_app_v2/site/
$ bundle

# create database and migrate
$ bundle exec rake db:create
$ bundle exec rake db:migrate

# run seeds for add the first users
$ bundle exec rake db:seed

# run! check all at localhost:3000
$ bundle exec rails s
```



# Change application name

Rename this project to your custom project name.
First go inside `site` folder and search for `site` word in all project, and change the important things:

``` 
$ cd site
$ grep -rin 'site' .
```
Output example:

```
$ grep -rin 'site' .
./app/views/layouts/application.html.erb:4:  <title>Site</title>
./config/application.rb:9:module Site
./config/initializers/session_store.rb:3:Rails.application.config.session_store :cookie_store, key: '_site_session'
./config/routes.rb:5:  # You can have the root of your site routed with "root"
./public/robots.txt:3:# To ban all spiders from the entire site uncomment the next two lines:
```

Otherwise if you preferer you can use the the [rename gem](http://rubygems.org/gems/rename) from [morshedalam](https://github.com/morshedalam/rename).

# Structure
This base application is divided in 3 parts:

 - **public**: Controllers and views for public, non autentication access.
 - **private**: Controllers and views for private access, only User's can access.
 - **admin**: Controllers and views for admin access, only Admin's can access.
 
 The controllers in all parts extends from the correspondent `base_controller`.

# Devise configuration

We add the **scoped views** for customize the devise views by model, this means that we add the `config.scoped_views = true` option inside the `config/initializers/devise.rb` file.

Other thing that we do is **overwrite** the method `after_sign_in_path_for` in `app/controllers/application_conroller.rb`, this is because if the user that sign in is an Admin we will be redirect by default to stored location or admin_path same as for User's this will be redirect to private_path or stored location. 

## Admin
This application has an `Admin` user. By defualt Devise create a model with this modules:

```
devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
```

But we **remove the registerable option** for admin users:

```
devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
```

This means that the devise controllers are:

 - controllers/admin/passwords_controller
 - controllers/admin/sessions_controller
 
And views:

 - views/admin/passwords/edit.html.erb
 - views/admin/passwords/new.html.erb
 - views/admin/sessions/new.html.erb

## User
This application has an `User` user. We add some modules apart from defaults, we add `confirmable` and `lockable`:

```
devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
```

This means that the devise controllers are:

 - controllers/private/confirmations_controller
 - controllers/private/passwords_controller
 - controllers/private/registrations_controller
 - controllers/private/unlocks_controller
 - controllers/private/sessions_controller
 
And views:

 - views/private/confirmations/*.html.erb
 - views/private/passwords/*.html.erb
 - views/private/registrations/*.html.erb
 - views/private/unlocks/*.html.erb
 - views/private/sessions/*.html.erb

## Email
### Templates
The email is shared between users and admins, the templates are:

 - views/devise/mailer/confirmation_instructions.html.erb
 - views/devise/mailer/reset_password_instructions.html.erb
 - views/devise/mailer/unlock_instructions.html.erb

### Configuration
Ensure you have defined default url and delivery method options in your environments files. Here is an example of `default_url_options` and `delivery_method` appropriate for a development environment in `config/environments/development.rb`:

```
config.action_mailer.default_url_options = { host: 'localhost:3000' }
config.action_mailer.delivery_method = :sendmail
```

In production, `:host` should be set to the actual host of your application.

Inside `config/initializers/devise.rb` you can find some other configurations such as `config.mailer_sender`

## Others
Check `config/initializers/devise.rb` for other devise configurations.

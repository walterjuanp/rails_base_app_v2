# Rails Base application

Rails base application with devise for authentication.

## Config for your site

### Application name

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

### Devise

#### Admin user
This application has an `Admin` user. By defualt Devise create a model with this modules:

```
devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
```

But we **remove the registerable option** for admin users.

And we add the **scoped views** for customize the devise views by model, this means that we add the `config.scoped_views = true` option inside the `config/initializers/devise.rb` file.

Other thing that we do is **overwrite** the method `after_sign_in_path_for` in `app/controllers/application_conroller.rb`, this is because if the user that sign in is an Admin we will be redirect by default to stored location or admin_path 

#### Email configuration
Ensure you have defined default url options in your environments files. Here is an example of `default_url_options` appropriate for a development environment in `config/environments/development.rb`:

```
config.action_mailer.default_url_options = { host: 'localhost:3000' }
```

In production, `:host` should be set to the actual host of your application.


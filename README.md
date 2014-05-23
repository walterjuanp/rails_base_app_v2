# Rails Base application

Rails base application

## Config for your site

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



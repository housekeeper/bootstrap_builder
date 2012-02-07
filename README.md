# Bootstrap Builder

A Rails form builder that generates [Twitter Bootstrap](http://twitter.github.com/bootstrap) markup and helps keep your code clean.

* Includes Twiter Bootsrap CSS and Javascript files
* Uses existing Rails helpers
* Autogenerates labels
* Generates horizontal, vertical and inline forms
* Groups of checkboxes

## Installation

Add gem definition to your Gemfile:
    
    gem 'bootstrap_builder'
    
Bundle it:
    
    bundle install

Require it in your CSS manifest file:

    //= require bootstrap
    //= require bootstrap-responsive  <-- only if you want to support other devices
    
Require it in your Javascript manifest file if you want to use Bootstrap's jQuery plugins:

    //= require bootstrap


## Usage (with haml)

### A sample user form

Override the autogenerated label by using the `:label` option on any element.

    = bootstrap_form_for @user, :url => [:admin, @user] do |f|
      = f.text_field :name
      = f.email_field :email, :prepend => '@'
      = f.password_field :password
      = f.password_field :password_confirmation
      = f.select :role, User::ROLES
      = f.time_zone_select :time_zone
      = f.check_box :reminder, :label => 'Send Daily Reminder?'
      = f.submit 'Save'

### A login form

Add a class to the form or any field to change the way it is rendered.

    = bootstrap_form_for @session_user, :url => login_path, :class => 'form-horizontal' do |f|
      = f.text_field :email
      = f.password_field :password
      = f.check_box :remember_me, :label => 'Remember me when I come back'
      = f.submit 'Log In'
  
### A search form

Hide the label by passing `:label => ''` on any field. (Useful for inline search forms)


    = bootstrap_form_for @search, :url => [:admin, :users], :html => {:method => :get, :class => 'form-search'} do |f|
      = f.text_field :name_equals, :label => 'Find by', :placeholder => 'Name'
      = f.select :role_equals, User::ROLES, :label => ''
      = f.submit 'Search', :class => 'btn-default'

*(Example using [MetaSearch](https://github.com/ernie/meta_search) helpers)*

### More examples

Use `:prepend' and `:append` on any element.

    = f.email_field :email, :prepend => '@'
    = f.text_field :price, :append => '.00'

A checkbox group:
  
    = f.check_box :option, :values => [['option 1', 1], ['option 2', 2], ['option 3', 3]]

---

Author: [The Working Group](http://www.theworkinggroup.ca)


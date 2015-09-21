# Vaulty
A platform that allows family members to selectively share content with other members of their family in Vaults. This was our midterm project.

## Local deployment option (_recommended_)
1. Ensure Ruby `v2.1` (or higher) is installed.
1. Ensure the [`bundler`](http://bundler.io) gem is installed
1. Run `bundle install`
1. Run the following command(s) to setup the database with seed data:
  1. `bundle exec rake db:drop && bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rake db:seed`
1. Run `shotgun -p 3000 -o localhost` to launch the server
1. Visit `http://localhost:3000/` in your browser
1. Check the `/db/seeds.rb` file for accounts setup by the seed data.

----

### Content types currently supported
- text
- photos (images)

### Details
- A vault can have an unlimited number of users
- A user can belong to as many vaults as they like.
- Once a user is logged in, they shall be able to see all the content from all vaults to which they belong.
- In order to differentiate content between vaults, a colour coding system was implimented. When a vault is created there are colour choices available.

### Frameworks and Library employed
- ActiveRecord
- Sinatra
- Ruby gems
  - `carrierwave`
  - `thin`
  - `mandrill`
- [YoxView jQuery image viewer plugin](http://www.yoxigen.com/yoxview/)
- [Salvattore jQuery Masonry display] (http://salvattore.com/)
- Materialize styling library for our front end, viewing and layout

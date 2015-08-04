## Getting Started


# Vaulty
A platform that allows family members to selectively share content with other members of their family in Vaults. This was our midterm project.

It has been deployed on the web here:

[vaulty.herokuapp.com](https://vaulty.herokuapp.com/)

## Local deployment option
1. `bundle install`
1. `shotgun -p 3000 -o 0.0.0.0`
1. Visit `http://localhost:3000/` in your browser

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
- Rails
- Ruby gems
  - `carrierwave`
  - `thin`
  - `mandrill`
- [YoxView jQuery image viewer plugin](http://www.yoxigen.com/yoxview/)
- [Salvattore jQuery Masonry display] (http://salvattore.com/)
- Materialize styling library for our front end, viewing and layout

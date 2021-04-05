# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (User has_many ratings, Course has_many ratings, etc.) 
- [x] Include at least one belongs_to relationship (Rating belongs_to user, Rating belongs_to course, etc.)
- [x] Include at least two has_many through relationships (Course has_many users through ratings, User has_many courses through ratings)
- [x] Include at least one many-to-many relationship (Course has_many users through ratings, User has_many courses through ratings)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (Rating has content and stars)
- [x] Include reasonable validations for simple model objects (Course, Rating, and User models all have validations)
- [x] Include a class level ActiveRecord scope method (Subjects can be ordered alphabetically and courses can be ordered by subject alphabetically)
- [x] Include signup (BCrypt)
- [x] Include login (BCrypt)
- [x] Include logout (BCrypt)
- [x] Include third party signup/login (Google OmniAuth)
- [x] Include nested resource show or index (user/1/ratings/1)
- [x] Include nested resource "new" form (users/1/ratings/new)
- [x] Include form display of validation errors (_errors.html.erb)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship. User has many workouts.
- [x] Include at least one belongs_to relationship. Workout belongs to User.
- [x] Include at least one has_many through relationship. Workout has many exercises through workout_exercise and vice versa.
- [x] The "through" part of the has_many through includes at least one user submittable attribute. Exercise_attributes.
- [x] Include reasonable validations for simple model objects. User ad workout have simple validations.
- [x] Include a class level ActiveRecord scope method. Scoping for completed exercises.
- [x] Include a nested form writing to an associated model using a custom attribute writer. New workout for current_user.
- [x] Include signup
- [x] Include login
- [x] Include logout
- [x] Include third party signup/login (OmniAuth w/Facebook)
- [x] Include nested resource show or index (URL e.g. users/2/recipes). User/id/workouts
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients). User/id/workouts/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new). Included field with errors.

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate

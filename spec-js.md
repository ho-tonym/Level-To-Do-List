# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
    I use jQuery frequently to make get/post, document ready calls in list.js, item.js
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend.
    I felt this feature didn't suit my application, but I implemented a section on the bottom of each list show page that has the current title. We can click next/back to go through all the list titles that the user owns. Next/Back buttons are wired up via AJAX of course and do not require a page refresh.
    The JSON is serialized and stripped of unnecessary information through the active_model_serializers gem which allows for the use of Active Model Serialization.
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend.
    The lists show page is an index page for all items in that particular list. You can enter new items, and delete items which will send requests via AJAX written with some jQuery. The JSON is serialized and stripped of unnecessary information through the active_model_serializers gem which allows for the use of Active Model Serialization.
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM.

- [x] Use your Rails API and a form to create a resource and render the response without a page refresh.
    Creating items in list#show page or deleting them fills this requirement.
- [x] Translate JSON responses into js model objects.
    The JSON response is the arguments for creating an Item class object.
- [x] At least one of the js model objects must have at least one method added by your code to the prototype.
    itemCreate(), template() are static prototype methods for the item class which can be found in item.js

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message

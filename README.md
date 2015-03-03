OMDB Rails Lab
==============

Remember the [OMDB Lab](https://github.com/wdi-sf-jan/omdb_api_lab)?
In the third week of class we used AJAX to call OMDB's API for movie
information. We're going to do a similar lab, but this time we're
going to incorporate our newfound server-side knowledge.

Goals
-----

- Do all of the OMDB API interaction from within Rails. Any AJAX
requests you make should only be from the browser to your server.
- Use the Typheous library to call the OMDB API from Rails.
- Create a search page that allows you to search for movies.
- As an improvement, use AJAX to call your server, which will call
  OMDB, and send JSON back to the browser than can be used to render
  the search results.

Part 1
------

Building a Rails app and using Typhoeus make OMDB API requests.

1. Create a new Rails app.
2. Add the `typhoeus` gem to your `Gemfile`.
2. Create a `movies` controller.
3. In your `movies/index.html.erb` template create a search form. Read
the best practices for creating search forms in
[Section 1.1](http://guides.rubyonrails.org/form_helpers.html)
4. In your `movies_controller.rb` have an action handle the form
submission and grab the search term the user entered.
6. Search OMDB for movies with that title using Typheous.
7. The results will be returned as a JSON string. Convert it into a
Ruby object.
8. Pass the search results to a template you create and render the
list of results in the template.

Part 2
------

You should have a (minimally) functional site after Part 1. However,
we did not use any AJAX nor did we have our Rails app act as a JSON
API. Let's do both of those things now.

Instead of having your search form cause a page refresh, use
JavaScript to make an AJAX request to your server (which will then
call OMDB). Then, instead of your server rendering the results in a
template, it should return them as JSON to the browser. Use JavaScript
to render the results (either with jQuery, or using Handlebars, if you
want to be fancy).

1. Rename `movies.js.coffee` to `movies.js` and,
2. DELETE THE COMMENTS. Rails generates CoffeeScript files by default,
but we don't want to use CoffeeScript. `#` is not the comment syntax
in JavaScript, so we need to delete those too.
3. Rails provides `jQuery` for us (see for yourself in
`application.js`) so you can just start using it.
4. Use `jQuery` to listen for the `submit` event on the form. Prevent
the page from taking it's default action.
5. Use one of `$.ajax()`, `.get()`, or `$.getJSON()` to call your
server with the search term the user typed in.
6. In your controller, search OMDB just as you did in Part 1, but this
time use `respond_to` to return JSON to the browser.
7. Use `jQuery` to render the list of movies client-side.

Bonus #1
--------

Use `Handlebars` to render the list of movies after your AJAX
request. Check out
[handlebars_assets](https://github.com/leshill/handlebars_assets) if
you're interested in integrating Handlebars templates with your Rails
application.

Bonus #2
--------

Implement the `movies#show` page that will give more information on a
specific movie.

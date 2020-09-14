# Stimulus Reflex Todos

This is a demo app showing how [StimulusReflex](https://stimulusreflex.com/) works for a production-ready but trivial application. Interesting points:

* There is not yet any validation done; that remains to be handled
- Authentication with Devise, scoping the Action Cable connection to that logged-in user, and making the user available to reflex classes
- System testing with Capybara and Headless Chrome. Note that the session storage for the test environment had to be set to use the cache, and the cache set to memory store. This is because it defaulted to cookie and null, respectively, but SR doesn't work with cookie sessions currently.
- We need the session to track the todo being edited, otherwise it's lost when any other reflex happens, such as adding a todo
- Only one real line of JavaScript was needed, to clear the input after creating a new todo. Stimulus made this easy. All the rest of the functionality is only data attributes and server-side reflexes

## Getting Started

### Requirements

1. Ruby
1. PostgreSQL (e.g. [Postgres.app][postgres-app])

### Setup

```sh
$ bundle install
$ rails db:setup
```

### Testing

```sh
$ bin/rspec
```

### Running

```sh
$ rails server
```

[postgres-app]: http://postgresapp.com

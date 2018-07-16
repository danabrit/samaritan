# Samaritan

This project is designed to help bring volunteers and community service projects together. The goal is to enable non-profit and other organizations to publicize their upcoming service projects, and the type of help they need from volunteers.

Anyone interested in helping a worthwhile cause locally can visit a website, find out what types of projects they could reasonably contribute to, and get involved. The aim is to keep the bar low for involvement.

## Installation

1. Clone the repo.
2. `cd samaritan`
3. `bundle install`
4. Create the database: `bundle exec rake db:create`
5. Migrate the database: `bundle exec rake db:migrate`

## Deployment

### Environment Variables

On production, you need to set these variables:

* `DEFAULT_URL_HOST` - The actual host of your application (_eg. http://example.com_)

## Contributions

Though this is a very young project, if you feel inclined, I would welcome contributions in the form of pull requests and issue reports.

### Pull Requests

* No pull requests will be accepted that break the test suite.
* The application is built using the following gems, and code contributions should include suitable tests using the same stack:

  * rspec
  * factory_bot
  * capybara

* View and route tests are unnecessary.
* Integration tests are awesome.
* Model tests are also awesome.
* For the most part, this project conforms to the standard [Github Ruby style guide](https://github.com/styleguide/ruby). Please try to do the same.
* I will do my best to review MRs in a timely manner. Be patient; this is not my full-time job. It's not even my part-time job. :-)

## Issues

If you find a bug in this project, please submit an Issue. Be as thorough as possible about your environment, including versions of what you're using that might be relevant (browser, operating system, etc.), which branch you were running, etc.

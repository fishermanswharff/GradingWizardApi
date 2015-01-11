[![Build status][ci-image]][ci-url] 
[![Code Climate][cc-climate-image]][cc-climate-url] 
[![Test Coverage][cc-cov-image]][cc-cov-url]



![General Assembly Logo](docs/img/GeneralAssembly_logo.png)

# Todo list for this API:
* update readme with endpoint behavior
* update readme with how to use
* email controller
* email view

# Todo list for repo config to build with travis:
* output logs from rspec
* config build artifacts post to AWS S3

# Grading Wizard
has a sole purpose: to receive Travis CI webhooks on automated builds, compile the results from repositories and produce an aggregated result of the builds from forks and master branches.

# API endpoint behavior
* `GET '/repos'` will force a query for all GA WDI Boston public repos, and save unique repos. 
* `GET /repos?name=github_repo_name` will return that repo and its pull requests built by travis
* Travis CI webhooks `POST`'ing to `https://gradingwizard.herokuapp.com/travisreports` will be received by `travis#nomnom` and will parse the Travis build to check if it's a pull request or just a regular push. 
* A pull request will be saved to the matching parent repo. 
* Subsequent requests on repos will include that repo's travis-build pull requests. For instance, `GET '/repos/72'` will return this json: 

```json
{
  "id":72,
  "name":"wdi_1_ruby_demo_basics",
  "url":"https://github.com/ga-wdi-boston/wdi_1_ruby_demo_basics",
  "pull_requests_count":1,
  "pull_requests":
  [
    {
      "travis_identifier":46572831,
      "name":"ga-wdi-boston/wdi_1_ruby_demo_basics",
      "build_status":0,
      "status_message":"Passed",
      "build_url":"https://travis-ci.org/ga-wdi-boston/wdi_1_ruby_demo_basics/builds/46572831",
      "commit_message":"travis file with prod url on pull_request",
      "committer_name":"fishermanswharff",
      "pull_request_number":1
    }
  ]
}
```

## Example of future expectation for reporting:

email with: 

Subject: Results of ${wdi_repo_name}<br>
Body: <br>

Number of tests built with Travis-CI: 5<br>
Average score: 3.2<br>

\[Results of the builds\]<br>

```ruby
          |
  |   |   |
| | | | | | 
0 1 2 3 4 5
```

Top 3 Results:

Student A, B, C

Bottom 3 Results: 
Student D, E, F

Most common test failure: NAME OF RPSEC TEST


[ci-image]: https://travis-ci.org/fishermanswharff/GradingWizardApi.svg?branch=master
[ci-url]: https://travis-ci.org/fishermanswharff/GradingWizardApi

[cc-climate-image]: https://codeclimate.com/github/fishermanswharff/GradingWizardApi/badges/gpa.svg
[cc-climate-url]: https://codeclimate.com/github/fishermanswharff/GradingWizardApi

[cc-cov-image]: https://codeclimate.com/github/fishermanswharff/GradingWizardApi/badges/coverage.svg
[cc-cov-url]: https://codeclimate.com/github/fishermanswharff/GradingWizardApi
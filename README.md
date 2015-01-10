[![Build status][ci-image]][ci-url] 
[![Code Climate][cc-climate-image]][cc-climate-url] 
[![Test Coverage][cc-cov-image]][cc-cov-url]



![General Assembly Logo](docs/img/GeneralAssembly_logo.png)

# Todo list for this API:
* update readme with endpoint behavior
* update readme with how to use
* email controller
* email view

# Todo list for repo config:
* output logs from rspec
* config build artifacts post to AWS S3

# Grading Wizard
has a sole purpose: to receive Travis CI webhooks on automated builds, compile the results from repositories and produce an aggregated result of the builds from forks and master branches.

## Example Result

email with: 

TITLE: Results of wdi_1_ruby_quiz_whatever
BODY:

Number of tests: 5
Average score: 3.2

          |
  |   |   |
| | | | | | 
0 1 2 3 4 5

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
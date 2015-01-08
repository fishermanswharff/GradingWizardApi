![General Assembly Logo](http://i.imgur.com/ke8USTq.png)

# Todo list:
* fix caching on production
* fix production error 500 internal server error
* new pull_request model
* implement build artifacts post to AWS S3

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
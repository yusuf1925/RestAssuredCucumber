Feature: API Tests

  Scenario: Login and validate the User Info
    Given Get the API Url
    Then Construct the "login" request body with the following data
      | email    | eve.holt@reqres.in |
      | password | cityslicka           |
    Then Make a Rest Call to "/api/login" with "POST" method
    And Verify if the status code is "200"

  Scenario: Unsuccessfully Login and validate
    Given Get the API Url
    Then Construct the "login" request body with the following data
      | email    | eve.holt@reqres.in |
    Then Make a Rest Call to "/api/login" with "POST" method
    And Verify if the status code is "400"

  Scenario: Unsuccessfully Login and validate
    Given Get the API Url
    When Make a Rest Call to "/api/users/2" with "DELETE" method
    Then Verify if the status code is "204"


#https://reqres.in/api/users/2
  Scenario: Single user correction
    Given Get the API Url
    Then Make a Rest Call to "/api/users/2" with "GET" method
    And Verify if the status code is "200"
    And Verify if the response contains the following info
      | data.id | 2 |
      | data.email | janet.weaver@reqres.in |
      | data.first_name | Janet |
      | data.last_name | Weaver |
      | data.avatar | https://reqres.in/img/faces/2-image.jpg |
      | support.url | https://reqres.in/#support-heading |
      | support.text | To keep ReqRes free, contributions towards server costs are appreciated! |

  Scenario: Check for a delayed api
    Given Get the API Url
    Then Make a Rest Call to "/api/users?delay=3" with "GET" method
    And Verify if the status code is "200"
    And Check for the response time
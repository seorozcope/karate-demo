Feature: Sample API test

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  Scenario: sample test GET
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies


  Scenario: sample test GET with path params
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And match response.data[0].first_name != null
    And match response.data[3].id == 10
    And assert response.data.length == 6
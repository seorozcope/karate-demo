Feature: Sample API GET test

  Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read('responses/userResponse.json')

  Scenario: Post demo with simple request body
    Given path '/users'
    And request {"name" : "morpheus", "job" : "leader" }
    When method POST
    Then status 201
    And print response

  Scenario: Post demo verifying the response structure and some values
    Given path '/users'
    And request { "name": "Raghav", "job": "leader"}
    When method post
    Then status 201
    And match response == {"name": "Raghav", "job": "leader","id": "#string","createdAt": "#ignore"}

  Scenario: Post demo matching with files
    Given path '/users'
    And request { "name": "Raghav", "job": "leader"}
    When method post
    Then status 201
    And match response == expectedOutput


  Scenario: Post demo Read body data from file
    Given path '/users'
    And def requestBody = read('requests/userData.json')
    And request requestBody
    When method post
    Then status 201


  Scenario: Post demo Read body data from file and setting other values to som fields
    Given path '/users'
    And def requestBody = read('requests/userData.json')
    And request requestBody
    And set requestBody.job = "freelancer"
    When method post
    Then status 201
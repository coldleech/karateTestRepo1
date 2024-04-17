Feature: test GET method

  Background: Setup the Base path
    Given url 'http://localhost:8989'
    And print '=== This is Background Keyword ==='

  Scenario: to get all data from application in JSON format
    #Given url 'http://localhost:8989/normal/webapi/all'
    Given path '/normal/webapi/all'
    When method get # Send the GET request
    Then status 200 # Status code of response should be 200

  Scenario: to get all data from application in JSON format using path variables
    #Given url 'http://localhost:8989'
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    # Base Path + Context Path
    When method get # Send the GET request
    Then status 200 # Status code of response should be 200

  Scenario: to get all data from application in XML format using path variables
    #Given url 'http://localhost:8989'
    And path '/normal/webapi/all'
    And header Accept = 'application/xml'
    # Base Path + Context Path
    When method get # Send the GET request
    Then status 200 # Status code of response should be 200

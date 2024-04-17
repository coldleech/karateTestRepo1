Feature: to validate GET End point

  Background: Setup the Base path
    Given url 'http://localhost:8989'
    And print '=== This is Background Keyword ==='

  Scenario: to get the data in JSON format and validate
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get # Send the GET request
    Then status 200 # Status code of response should be 200
    And match response/List/item/jobId == '1'
    And match response/List/item/jobTitle == 'Software Engg'
    And match response/List/item/experience/experience[1] == 'Google'
    And match response/List/item/project/project/projectName == 'Movie App'
    And match response/List/item/project/project/technology/technology[2] == 'SQL Lite'
    # skip the 'response' keyword
    And match /List/item/jobId == '1'
# Travers XML similar to JSON remember to downsize the value by 1 i. e. 1 -> 0.
    And match response.List.item.experience.experience[0] == 'Google'

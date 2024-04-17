Feature: to validate GET End point

  Background: Setup the Base path
    Given url 'http://localhost:8989'
    And print '=== This is Background Keyword ==='

  Scenario: to get the data in JSON format and validate
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get # Send the GET request
    Then status 200 # Status code of response should be 200
    And match response.[0].jobId == 1
    And match response.[0].experience[1] == 'Apple'
    And match response[0].project[0].projectName == 'Movie App'
    And match response.[0].project[0].technology[2] == 'Gradle'
    # validate the size of array
    And match response.[0].experience[*] == ['Google','Apple','Mobile Iron']
    And match response.[0].project[0].technology[*] == ['Kotlin','SQL Lite','Gradle']
    # Contains keyword
    And match response.[0].experience[*] contains ['Mobile Iron']
    And match response.[0].project[0].technology[*] contains ['SQL Lite']
    And match response.[*].jobId contains 1

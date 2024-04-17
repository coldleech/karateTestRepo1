Feature: to validate GET End point

  Background: Setup the Base path
    Given url 'http://localhost:8989'
    And print '=== This is Background Keyword ==='

  Scenario: to get the data in JSON format and validate
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get # Send the GET request
    Then status 200 # Status code of response should be 200
    And print response
    And match response ==
      """
      [
        {
          "jobId": 1,
          "jobTitle": "Software Engg",
          "project": [
            {
              "technology": [
                "Kotlin",
                "SQL Lite",
                "Gradle"
              ],
              "projectName": "Movie App"
            }
          ],
          "jobDescription": "To develop andriod application",
          "experience": [
            "Google",
            "Apple",
            "Mobile Iron"
          ]
        }
      ]
      """

  Scenario: to get the data in XML format and validate
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get # Send the GET request
    Then status 200 # Status code of response should be 200
    And print response
    And match response ==
      """
      <List>
      <item>
      <jobId>1</jobId>
      <jobTitle>Software Engg</jobTitle>
      <jobDescription>To develop andriod application</jobDescription>
      <experience>
        <experience>Google</experience>
        <experience>Apple</experience>
        <experience>Mobile Iron</experience>
      </experience>
      <project>
        <project>
          <projectName>Movie App</projectName>
          <technology>
            <technology>Kotlin</technology>
            <technology>SQL Lite</technology>
            <technology>Gradle</technology>
          </technology>
        </project>
      </project>
      </item>
      </List>
      """

  Scenario: to get the data in JSON format and validate using a specific property of body and headers
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get # Send the GET request
    Then status 200 # Status code of response should be 200
    And print response
    And match response contains deep {"jobDescription": "To develop andriod application",}
    And match header Content-Type == 'application/json'
    And match header Connection == 'keep-alive'

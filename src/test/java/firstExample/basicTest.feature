Feature: basicTest

  Background:
    * url 'http://apiv3.iucnredlist.org'

  Scenario: Country list
    Given path '/api/v3/country/list'
    And param token = '9bb4facb6d23f48efbf424bb05c0c1ef1cf6f468393bc745d42179ac4aca5fee'
    When method GET
    Then status 200
    Then print response
    Then print 'EXAMPLE', response.results[28]

  Scenario: Species in Turkey
    Given path '/api/v3/country/getspecies/TR'
    And param token = '9bb4facb6d23f48efbf424bb05c0c1ef1cf6f468393bc745d42179ac4aca5fee'
    When method GET
    Then status 200
    Then print response
    * match response.result[3].scientific_name == "Abies nordman"

  Scenario: Create user for medium
    Given url 'https://reqres.in/api/users'
    * def userRequest = read('user.json')
    * set userRequest.job = "Minister"
    * print userRequest
    And request userRequest
    When method POST
    Then status 201
    Then print response

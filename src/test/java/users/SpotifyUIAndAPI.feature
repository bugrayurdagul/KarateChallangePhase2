
Feature: SpotifyUI

  Background:
    * configure driver = { type: 'chromedriver', executable: 'src/test/resources/chromedriver.exe' }
    * url baseUrl
    * def UID = '31p4hsslvqno7sc57pqrthnxp62m'
    @SpotifyUIAndAPI
  Scenario: UI and API Test

    Given driver 'https://open.spotify.com/'
    * maximize()
    When click("//button[@data-testid='login-button']")
    And input('#login-username', 'bugra.yurdagul@outlook.com')
    And input('#login-password', '2847233By')
    And click('#login-button')
    And waitFor('.IPVjkkhh06nan7aZK7Bx')
    * header Authorization = 'Bearer ' + myToken
    * def requestBody = {"name": "Mentorlabs Faz2","description": "Api","public": false}
    Given path 'users/'+UID+'/playlists'
    And request requestBody
    When method post
    Then status 201
    And def playlistID = response.id
    * header Authorization = 'Bearer ' + myToken
    Given path 'search'
    And param q = 'The Final Countdown'
    And param type = 'track'
    When method get
    Then status 200
    And def trackURI = response.tracks.items[0].uri
    * header Authorization = 'Bearer ' + myToken

    Given path 'playlists/'+playlistID+'/tracks'
    * def reqBody = {uris:[#(trackURI)]}
    And request reqBody
    When method post
    Then status 201

    Given driver 'https://open.spotify.com/'
    * maximize()
    * delay(3000)
    And waitFor('.AINMAUImkAYJd4ertQxy').click()
    * delay(3000)
    And waitFor('button[data-testid=play-button]').click()
    * delay(5000)

      * header Authorization = 'Bearer ' + myToken

      Given path 'me/player/currently-playing'
      When method get
      And def isPlaying = response.is_playing
      And def songName = response.item.name
      And match isPlaying == true
      And match songName == 'The Final Countdown'





















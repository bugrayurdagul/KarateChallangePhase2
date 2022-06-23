package examples.users;

import com.intuit.karate.junit5.Karate;

public class SpotifyTestRunner {

    @Karate.Test
    Karate testSpotifyAll() {return Karate.run("spotifyui","spotifyapi").relativeTo(getClass());}


}

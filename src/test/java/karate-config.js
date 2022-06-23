function fn() {
var client_id = 'a5637486ea2e49169db968122dde5440';
var client_secret = 'bd239eca061c4defa93476acf484e445';



  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myToken: 'BQCjp3p0drUVcUiXvmylmDzjHFiuiJr3gfdpJKiKWUF7QzPQLhhttlVzDWP-1LfXI0QKcBHqbkZMfIXvbW4fKelz7AMcx7NmQUfZWRtNGdzrBcQ4UyxkxWfpTWYZsZiAN97PD1TQauJT4BOzhHoQyrM4zXenpKo-Ycfqk41v1Lo_9MQbl9sKWzlhDXm5YruwnxUbJ9j6hmaANvrAuBeljxF04JuWylHfNCT9Dj21argr3f5iiYbinOgUIjbLkkYTAfVuLyWUIrJHAok',
    baseUrl: 'https://api.spotify.com/v1/',
    playlistID: '',
    trackURI: ''

  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/cd_organizer')

get ('/') do
  @all_cds = CD.alphabetize()
  erb(:index)
end

post('/cds') do
  form_artist = params.fetch('artist')
  form_album = params.fetch('album')
  @cd = CD.new({:artist => form_artist, :album=> form_album})
  @cd.save()
  @all_cds = CD.alphabetize()
  erb(:index)
end


get('/cds/:artist') do
  @artist_cds = CD.search_artist(params.fetch('artist'))
  erb(:artist)
end

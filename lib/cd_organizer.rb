class CD
  attr_reader(:artist, :album)

  @@cds = []

  define_method(:initialize) do |attributes|
    @artist = attributes.fetch(:artist)
    @artist = @artist.split('')
    @artist.at(0).upcase!()
    @artist = @artist.join('')
    @album = attributes.fetch(:album)
  end

  define_method(:save) do
    @@cds.push(self)
  end

  define_singleton_method(:all) do
    @@cds
  end

  define_singleton_method(:clear) do
    @@cds = []
  end

  define_singleton_method(:search_artist) do |artist_to_search|
    cds_to_return = []
    @@cds.each() do |cd|
      if cd.artist().downcase() == artist_to_search.downcase()
        cds_to_return.push(cd)
      end
    end
    cds_to_return
  end


  define_singleton_method(:search_album) do |album_to_search|
    cds_to_return = []
    @@cds.each() do |cd|
      if cd.album().downcase() == album_to_search.downcase()
        cds_to_return.push(cd)
      end
    end
    cds_to_return
  end

  define_singleton_method(:list_artists) do
    artists_to_return = []
    @@cds.each() do |cd|
      if !(artists_to_return.include?(cd.artist()))
        artists_to_return.push(cd.artist())
      end
    end
    artists_to_return.sort()
  end

  define_singleton_method(:alphabetize) do
    cds_to_return = []
    list_artists().each() do |artist|
      cds_to_return.push(search_artist(artist))
    end
    cds_to_return
  end

end

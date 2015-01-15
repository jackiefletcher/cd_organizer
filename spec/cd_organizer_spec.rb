require('sinatra')
require('cd_organizer')

describe(CD) do
  before() do
    CD.clear()
  end

  describe("#artist") do
    it("return the artist name") do
      test_cd = CD.new({:artist => "The Beatles", :album => "Abbey Road"})
      expect(test_cd.artist()).to(eq("The Beatles"))
    end
  end

  describe("#album") do
    it("return the album name") do
      test_cd = CD.new({:artist => "The Beatles", :album => "Abbey Road"})
      expect(test_cd.album()).to(eq("Abbey Road"))
    end
  end

  describe('#save') do
    it("saves itself to the class array of cds") do
      test_cd = CD.new({:artist => "The Beatles", :album => "Abbey Road"})
      test_cd.save()
      expect(CD.all()).to(eq([test_cd]))
    end
  end

    describe('.all') do
      it("is empty when first initialized") do
        test_cd = CD.new({:artist => "The Beatles", :album => "Abbey Road"})
        expect(CD.all()).to(eq([]))
      end
    end

    describe('.clear') do
      it("empties the class array") do
        test_cd = CD.new({:artist => "The Beatles", :album => "Abbey Road"})
        test_cd.save()
        CD.clear()
        expect(CD.all()).to(eq([]))
      end
    end

    describe('.search_artist') do
      it("finds the artist and returns all CDs that match that artist") do
        test_cd = CD.new({:artist => "The BEATLES", :album => "Abbey Road"})
        test_cd.save()
        test_cd2 = CD.new({:artist => "The Beatles", :album => "The White Album"})
        test_cd2.save()
        test_cd3 = CD.new({:artist => "Rolling Stones", :album => "Some Girls"})
        test_cd3.save()
        expect(CD.search_artist("The Beatles")).to(eq([test_cd, test_cd2]))
      end
    end

    describe('.search_album') do
      it("finds the album(s) and returns all CDs that match that album name") do
        test_cd = CD.new({:artist => "The Beatles", :album => "Greatest HiTs"})
        test_cd.save()
        test_cd2 = CD.new({:artist => "The Beatles", :album => "The White Album"})
        test_cd2.save()
        test_cd3 = CD.new({:artist => "Rolling Stones", :album => "GReatest Hits"})
        test_cd3.save()
        expect(CD.search_album("Greatest Hits")).to(eq([test_cd, test_cd3]))
      end
    end

    describe('.list_artists') do
      it("returns all artists in the CD class alphabetized") do
        test_cd = CD.new({:artist => "The Beatles", :album => "Greatest Hits"})
        test_cd.save()
        test_cd2 = CD.new({:artist => "The Beatles", :album => "The White Album"})
        test_cd2.save()
        test_cd3 = CD.new({:artist => "Rolling Stones", :album => "Some Girls"})
        test_cd3.save()
        expect(CD.list_artists()).to(eq(["Rolling Stones", "The Beatles"]))
      end
    end

    describe('.alphabetize') do
      it("alphabetizes the all cd objects in the cd class by artist") do
        test_cd = CD.new({:artist => "The Beatles", :album => "The White Album"})
        test_cd.save()
        test_cd2 = CD.new({:artist => "The Beatles", :album => "Greatest Hits"})
        test_cd2.save()
        test_cd3 = CD.new({:artist => "Rolling Stones", :album => "Some Girls"})
        test_cd3.save()
        expect(CD.alphabetize()).to(eq([[test_cd3],[test_cd, test_cd2]]))
      end
    end

end

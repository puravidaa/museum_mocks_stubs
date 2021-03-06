require 'minitest/autorun'
require 'minitest/pride'
require './lib/museum'

class MuseumTest <Minitest::Test

  def test_it_exists
    skip
    dmns = Museum.new("Denver Museum of Nature and Science")
    assert_instance_of Museum, dmns
  end

  def test_it_has_attributes
    skip
    dmns = Museum.new("Denver Museum of Nature and Science")

    assert_equal "Denver Museum of Nature and Science", dmns.name
    assert_equal [], dmns.exhibits
  end

  def test_it_can_add_exhibits
    skip
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    imax = Exhibit.new("IMAX", 15)
    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)

    assert_equal [gems_and_minerals,dead_sea_scrolls,imax], dmns.exhibits
  end


  def test_patrons_starts_empty
    skip
    dmns = Museum.new("Denver Museum of Nature and Science")

    assert_equal [], dmns.patrons
  end

  def test_it_can_admit_patrons
    skip
    dmns = Museum.new("Denver Museum of Nature and Science")

    bob = Patron.new("Bob", 20)
    sally = Patron.new("Sally", 20)

    dmns.admit(bob)
    dmns.admit(sally)

    assert_equal [bob,sally], dmns.patrons
  end

  def test_it_can_list_admitted_patrons_by_name
    skip
    dmns = Museum.new("Denver Museum of Nature and Science")

    bob = Patron.new("Bob", 20)
    sally = Patron.new("Sally", 20)

    dmns.admit(bob)
    dmns.admit(sally)

    assert_equal ["Bob","Sally"], dmns.patrons_by_name
  end

  def test_it_can_tell_you_the_average_exhibit_cost
    skip
    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new("Gems and Minerals", 4)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 11)
    imax = Exhibit.new("IMAX", 15)
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)

    assert_equal 10, dmns.average_exhibit_cost
  end

  def test_there_are_recommended_exhibits_for_a_given_patron
    ###CHALLENGE
    skip
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    imax = Exhibit.new("IMAX", 15)
    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    bob = Patron.new("Bob", 20)
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Gems and Minerals")
    sally = Patron.new("Sally", 20)
    sally.add_interest("IMAX")
    #hint: look at the recommend_exhibits() method and figure out which method you need to be called on which object, and then stub from there.
    assert_equal [gems_and_minerals,dead_sea_scrolls], dmns.recommend_exhibits(bob)
    assert_equal [imax], dmns.recommend_exhibits(sally)
  end

end

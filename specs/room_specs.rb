require('minitest/autorun')
require('minitest/reporters')
require('pry')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../room.rb")
require_relative("../guests.rb")
require_relative("../songs.rb")


class TestRoom < MiniTest::Test
  def setup()
    @song1 = Song.new("purple haze")
    @guest = Guests.new("Joe", @song1)
    @room1 = Room.new("Lomond", 2, [@song1])
    # @room2 = Room.new("Lomond", 2, 0, ["song1", "Song 2"])

  end


  def test_get_room_name
    assert_equal("Lomond", @room1.get_room_name)
  end

  def test_check_in_guest()
    assert_equal(["Joe Bloggs"], @room1.check_in_guest("Joe Bloggs"))
  end

  def test_check_out_guest()
    @room1.check_in_guest("John Doe")
    @room1.check_out_guest("John Doe")
    assert_equal(0, @room1.get_current_guests_count)
  end

  def test_add_song()
    @room1.add_song(@song1)
    assert_equal(true, @room1.check_songs(@song1))
  end

  def test_get_current_guests
    @room1.check_in_guest(@guest)
    assert_equal(1, @room1.get_current_guests_count)
  end



end

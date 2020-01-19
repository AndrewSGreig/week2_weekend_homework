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
    @song2 = Song.new("let it be")
    @song_list = [@song1, @song2]
    @guest1 = Guests.new("Joe Bloggs", @song1)
    @guest2 = Guests.new("Fred Bloggs", @song2)
    @guest3 = Guests.new("John Doe", @song1)
    @total_guests = [@guest1, @guest2, @guest3]
    @room1 = Room.new("Lomond", 2, [@song1, @song2])
    # @room2 = Room.new("Lomond", 2, 0, ["song1", "Song 2"])

  end


  def test_get_room_name
    assert_equal("Lomond", @room1.get_room_name)
  end

  def test_check_in_guest()
    # assert_equal(["Joe Bloggs"], @room1.check_in_guest("Joe Bloggs"))
    assert_equal([@guest1], @room1.check_in_guest(@guest1))
  end

  def test_check_out_guest()
    @room1.check_in_guest(@guest3)
    @room1.check_out_guest(@guest3)

    assert_equal(0, @room1.get_current_guests.count)
  end

  def test_add_song()
    @room1.add_song(@song1)
    assert_equal(true, @room1.check_songs(@song1))
  end

  def test_get_current_guests
    @room1.check_in_guest(@guest1)
    assert_equal(1, @room1.get_current_guests.count)
  end

  def test_room_capacity__attempted_breach()
    #get existing # of people in room
    # compare with room _room_capacity
    #if spare space checkin
    is_room_full = false
    for guest in @total_guests
      if @room1.get_current_guests.count < @room1.check_room_capacity
        p "There is space in the room. Welcome #{guest.guest_name}!"
        @room1.check_in_guest(guest)
      else
        is_room_full = true#
        p "There is no more space in the room. Sorry #{guest.guest_name}"
      end
    end
  end


end

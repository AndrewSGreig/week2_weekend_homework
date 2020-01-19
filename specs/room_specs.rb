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
    @room1 = Room.new("Lomond", 2, [@song1, @song2], 5)
    # @room2 = Room.new("Lomond", 2, 0, ["song1", "Song 2"])
    @guest1 = Guests.new("Joe Bloggs", 20, @song1)
  end


  # def test_get_room_name
  #   assert_equal("Lomond", @room1.get_room_name)
  # end

  def test_check_in_guest()
    # assert_equal(["Joe Bloggs"], @room1.check_in_guest("Joe Bloggs"))
    # p @room1.get_current_guests
    original_guest_count = @room1.get_current_guests.count
    expected_guest_count = original_guest_count + 1
    @room1.check_in_guest(@room1, @guest1)
    assert_equal(expected_guest_count, @room1.get_current_guests.count)
  end

  def test_check_out_guest()
    @room1.check_in_guest(@room1, @guest1)
    @room1.check_out_guest(@guest1)

    assert_equal(0, @room1.get_current_guests.count)
  end

  def test_add_song()
    @room1.add_song(@song1)
    assert_equal(true, @room1.check_songs(@song1))
  end

  def test_get_current_guests
    @room1.check_in_guest(@room1, @guest1)
    assert_equal(1, @room1.get_current_guests.count)
  end

  def test_room_capacity__attempted_breach()
    #get existing # of people in room
    # compare with room _room_capacity
    #if spare space checkin

    @guest2 = Guests.new("Fred Bloggs", 2,  @song2)
    @guest3 = Guests.new("John Doe", 100, @song1)
    @guest4 = Guests.new("Jane Doe", 50, @song2)
    @total_guests = [@guest1, @guest2, @guest3, @guest4]

    is_room_full = false
    for guest in @total_guests
      if @room1.get_current_guests.count <= @room1.check_room_capacity
        if @room1.guest_can_afford_entrance(guest)
        # p "There is space in the room. Welcome #{guest.guest_name}!"
        @room1.check_in_guest(@room1, guest)
        # p @room1.get_current_guests
        # p guest
        # p @room1.get_current_guests.last
        assert_equal(guest, @room1.get_current_guests.last)
        end
      else
        is_room_full = true

        # current_guest_count = @room1.get_current_guests.count
        # p "current_guest_count = #{current_guest_count}"
        # max_guests = @room1.max_guests
        # p "max_guests = #{max_guests}"
        # assert_equal(max_guests, current_guest_count)
         assert_equal(@room1.max_guests, (@room1.get_current_guests.count))
      end
    end

    # if is_room_full
    # p "current guests = #{@get_current_guests}"
  end


end

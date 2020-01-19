class Room
  attr_accessor :room_name, :max_guests, :current_guests, :song_list, :entrance_fee

  # def initialize(name, max_guests, current_guests, song_list)
  def initialize(name, max_guests, song_list, entrance_fee)
      @room_name = name
      @max_guests = max_guests
      @current_guests = []
      @song_list = []
      @entrance_fee = entrance_fee
  end

  def get_current_guests
    return @current_guests
  end

def guest_can_afford_entrance(guest)
  if guest.available_cash >= @entrance_fee
    return true
  else
    return false
  end
end

  def check_in_guest(room, guest)
    # if guest.available_cash > @CodeClan_Caraoke.entrance_fee
    # binding.pry
     # if room.get_current_guests.count <= room.check_room_capacity
      # if guest.available_cash >= @entrance_fee
      if guest_can_afford_entrance(guest)
        # p "There is space in the room and you can afford it. Welcome #{guest.guest_name}!"
        @current_guests << guest
        guest.available_cash -= @entrance_fee
      else
        # p  "There is space in the room but you cannot afford it. Sorry #{guest.guest_name}!"
      end
    # else
    #   is_room_full = true#
    #   # p "There is no more space in the room. Sorry #{guest.guest_name}"
    # end

    #  p "Guest #{guest.guest_name} has £#{guest.available_cash}"
    # p "entrance_fee = #{entrance_fee}"
  end

  def check_room_capacity
    return @max_guests
  end

  def check_out_guest(guest)
    @current_guests.delete(guest)
  end

  def get_room_name
    return @room_name
  end

  def add_song(song)
    @song_list << song
  end

  def get_songs()
    return @song_list
  end

  def get_song_name(song)
    return song
  end

  def check_songs(input_song)
    song_is_present = false
    for song in @song_list
      if (song.song_name == input_song.song_name)
        song_is_present = true
      end
    end
    return song_is_present
  end



end

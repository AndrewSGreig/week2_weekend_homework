class Room
  attr_accessor :room_name, :max_guests, :current_guests, :song_list

  # def initialize(name, max_guests, current_guests, song_list)
  def initialize(name, max_guests, song_list)
      @room_name = name
      @max_guests = max_guests
      @current_guests = []
      @song_list = []
  end

  def get_current_guests_count
    return @current_guests.length
  end

  def check_in_guest(guest)
    @current_guests << guest
  end

  def check_room_capcity
    @room.max_guests
  end


  def check_out_guest(guest)
    @current_guests.delete(guest)
  end

  def get_room_name
    return @room_name
  end

  def add_song(song)
    @song_list << song
    # p @song_list
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

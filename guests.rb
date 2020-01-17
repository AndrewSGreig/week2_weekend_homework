class Guests
  attr_accessor :room_name, :max_guests, :current_guests, :song_list

  def initialize(name,fav_song)
    @name = name#
    @song = fav_song
  end

end

class Guests
  attr_accessor :guest_name, :available_cash, :song

  def initialize(name, cash, fav_song)
    @guest_name = name
    @available_cash = cash
    @song = fav_song
  end

end

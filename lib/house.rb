require '../lib/room'

class House

  attr_reader :price, :address, :rooms, :details

  def initialize(price, address)
    @price = price.tap { |str| str.delete!('$') }.to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    false
  end

  def rooms_from_category(category)
    arr = []
    self.rooms.each do |room|
      if room.category == category
        arr << room
      else
      end
    end
    arr
  end

  def area
    sq_footage = 0
    self.rooms.each do |room|
      sq_footage += room.area
    end
    sq_footage
  end

  def details
    @details = {"price" => @price, "address" => @address}
  end

  def price_per_square_foot
    (self.price / self.area.to_f).round(2)
  end

  def rooms_sorted_by_area
    self.rooms.sort_by {|room| room.area }
  end

end

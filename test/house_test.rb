require 'minitest/autorun'
require 'minitest/pride'
require '../lib/room'
require '../lib/house'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000","123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, '13')
    @room_2 = Room.new(:bedroom, 11, '15')
    @room_3 = Room.new(:living_room, 25, '15')
    @room_4 = Room.new(:basement, 30, '41')
  end

  def test_it_exists
    assert_instance_of House, @house
  end

  def test_it_has_readable_attributes
    assert_equal 400000, @house.price
    assert_equal "123 sugar lane", @house.address
    assert_equal [], @house.rooms
  end

  def test_it_can_add_rooms
    room1 = Room.new(:bedroom, 10, '13')
    @house.add_room(room1)
    assert_equal [room1], @house.rooms
  end

  def test_it_is_above_market
    assert_equal false, @house.above_market_average?
  end

  def test_it_can_find_room_category
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    assert_equal [@room_1, @room_2], @house.rooms_from_category(:bedroom)
  end

  def test_it_can_find_house_area
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    assert_equal 1900, @house.area
  end

  def test_it_can_find_house_details

    assert_equal 400000, @house.details['price']
    assert_equal "123 sugar lane", @house.details['address']
  end

  def test_it_can_find_price_per_square_foot
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 210.53, @house.price_per_square_foot
  end

  def test_it_can_sort_rooms_by_area
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal [@room_4, @room_3, @room_2, @room-1], @house.rooms_sorted_by_area
  end

end

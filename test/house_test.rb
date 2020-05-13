require 'minitest/autorun'
require 'minitest/pride'
require '../lib/room'
require '../lib/house'

class HouseTest < Minitest::Test

  def setup
    @house = House.new("$400000","123 sugar lane")
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

end

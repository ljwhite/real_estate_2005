class Room

  attr_reader :category, :length, :width, :paint

  def initialize(category, length, width)
    @category = category
    @length = length.to_i
    @width = width.to_i
    @paint = false
  end

  def area
    @length * @width
  end

  def is_painted?
    if @paint == false
      false
    elsif @paint == true
      true
    end
  end

  def paint
    @paint = true
  end
end

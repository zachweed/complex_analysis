class ComplexPlane
  BOUNDARY = 100
  BASE_UNIT = "i".freeze

  def initialize
    @y_points = generate_y_points
    @x_points = (-BOUNDARY..BOUNDARY)
  end

  def polar_coordinate(complex_number, theta)
    (complex_number.absolute_value * Math::E) ** (complex_number.i * theta)
  end

  def build_quadrant(max)
    y_coordinates = ""
    x_coordinates = ""
    (max).times do |iteration|
      y_coordinates << " | \n"
    end
    (max).times do |iteration|
      x_coordinates << " " if iteration == 0
      x_coordinates << "-"
    end
    y_coordinates += x_coordinates
    return y_coordinates
  end

  def draw(max)
    {
      left: build_quadrant(max)
    }
  end

  private

    def generate_y_points
      points = []
      (-BOUNDARY..BOUNDARY).each do |i|
        if i == 0
          points << BASE_UNIT
        else
          points << "#{i}#{BASE_UNIT}"
        end
      end
      points
    end
end
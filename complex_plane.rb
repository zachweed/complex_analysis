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
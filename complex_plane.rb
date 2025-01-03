class ComplexPlane
  BOUNDARY = 100
  BASE_UNIT = "i".freeze

  def initialize
    @y_points = generate_y_points
    @x_points = (-BOUNDARY..BOUNDARY)
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
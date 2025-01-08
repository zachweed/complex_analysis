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
    lines_x = []
    (max).times { lines_x << [] }
    lines_y = []
    y_coordinates = ""
    x_coordinates = ""
    y_lambda = -> {
      (max).times do |iteration|
        (max).times do |iteration|
          y_coordinates << "   "
        end
        lines_y << [y_coordinates + "| \n"]
        y_coordinates = ""
      end  
    }
    x_lambda = -> { 
      (max).times do |iteration|
        if iteration == 0 && max == 1
          x_coordinates << " -   -"
        else
          x_coordinates << "- "
        end
        lines_x[iteration] << x_coordinates
      end
    }
    y_lambda.call
    x_lambda.call
    y_lambda.call
    return [ lines_x, lines_y ]
  end

  def draw_left(max)
    left = ""
    max.times { left << "-" }
    left
  end

  def draw_right(max)
    right = ""
    max.times { right << "-" }
    right
  end

  def draw_top(max)
    top = ""
    add_padding = -> { max.times { top << " " } }
    max.times do
      add_padding.call()
      top << "|"
      add_padding.call()
      top << "\n"
    end
    top
  end

  def draw_bottom(max)
    bottom = ""
    add_padding = -> { max.times { bottom << " " } }
    max.times do
      add_padding.call()
      bottom << "|"
      max.times { bottom << " " }
      bottom << "\n"
    end
    bottom
  end

  def draw(max)
    {
      left: draw_left(max),
      right: draw_right(max),
      top: draw_top(max),
      bottom: draw_bottom(max)
    }
    # x_and_y = build_quadrant(max)
    # x = x_and_y[0]
    # y = x_and_y[1]
    # midway_length = y.length / 2
    # puts y[0..midway_length]
    # puts x.join("")
    # puts y[midway_length..(-1)]
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
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

  def draw(max)
    datum = {
      left: draw_left(max),
      right: draw_right(max),
      top: draw_top(max),
      bottom: draw_bottom(max),
      center: draw_center,
    }
    datum[:combined] = datum[:top] + datum[:left] + datum[:center] + datum[:right] + datum[:bottom]
    datum
  end

  private

    def draw_center
      " "
    end

    def draw_left(max)
      left = ""
      max.times { left << "-" }
      left
    end

    def draw_right(max)
      right = ""
      max.times { right << "-" }
      right << "\n"
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
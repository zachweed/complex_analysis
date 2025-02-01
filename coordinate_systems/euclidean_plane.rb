class EuclideanPlane
  def initialize(max)
    @max = max
    @datum = {}
  end

  def draw
    @datum = {
      left: draw_left(@max),
      right: draw_right(@max),
      top: draw_top(@max),
      bottom: draw_bottom(@max),
      center: draw_center
    }
    @datum[:combined] = @datum[:top].join("") + @datum[:left].join("") + @datum[:center] + @datum[:right].join("") + @datum[:bottom].join("")
    @datum
  end

  def distance(x_1, y_1, x_2, y_2)
    Math.sqrt(((x_1 - y_1)**2)+((x_2 - y_2)**2))
  end

  def place_point(x, y)
    raise_error ArgumentError unless ( x <= @max && y <= @max )
    datum = expand_for_point([x,y].max)
    if x >= 1
      if y >= 1
        datum[:top][x + (@max + 1)] = ["x"]
      else
        datum[:bottom][x + (@max + 1)] = ["x"]
      end
    else
      if y >= 1
        datum[:top][x.abs] = ["x"]
      else
        datum[:bottom][x.abs] = ["x"]
      end
    end
    datum
  end

  private

    def expand_for_point(point)
      @datum = {
        left: draw_left(@max + 1),
        right: draw_right(@max + 1),
        top: draw_top(@max + 1),
        bottom: draw_bottom(@max + 1),
        center: draw_center
      }
      @datum[:combined] = @datum[:top].join("") + @datum[:left].join("") + @datum[:center] + @datum[:right].join("") + @datum[:bottom].join("")
      @datum
    end

    def draw_center
      " "
    end

    def draw_left(max)
      left = []
      -(max).upto(1) do |n|
        left << ["-#{n}"]
        left << ["-"]
      end
      left
    end

    def draw_right(max)
      right = []
      1.upto(max) do |n|
        right << ["-"]
      end
      right << ["\n"]
      right
    end

    def draw_top(max)
      top = []
      add_padding = -> { max.times { top << [" "] } }
      max.downto(0) do |n|
        add_padding.call()
        top << ["\n"]
        top << ["|"]
        add_padding.call()
        top << ["\n"]
        top << ["#{n}"]
      end
      top << ["\n"]
      top
    end

    def draw_bottom(max)
      bottom = []
      add_padding = -> { max.times { bottom << [" "] } }
      0.upto(max) do |n|
        add_padding.call()
        bottom << ["|"]
        max.times { bottom << [" "] }
        bottom << ["\n"]
        bottom << ["#{n}"]
      end
      bottom
    end

end
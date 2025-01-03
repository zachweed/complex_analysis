class ComplexNumber
  attr_reader :re, :im, :i, :a

  # Represents the cycle of iota and some
  # exponent.
  IMAGINARY = [ '1', 'i', '-1', '-i' ]

  def initialize(a)
    @a = a
    @re = find_re(a)
    @im = find_base(find_im(a))
    @i = convert_iota(find_iota(a).split("^"))
  end

  def complex_conjugate
    self.class.new(@a.gsub('+', '-'))
  end

  private

    def find_re(a)
      a.match(/(.*)\s(\+|\-).*/)
      $1
    end

    def find_im(a)
      a.match(/((\d*)+i.*)/)
      $1 || ""
    end

    def find_base(im)
      im.match(/(-*\d)*(i\^.*)*/)
      $1
    end

    def find_iota(i)
      i.match(/(i.*)/)
      $1 || ""
    end

    def convert_iota(iota)
      if iota == ""
        return 1
      elsif !iota.is_a?(Array)
        raise ArgumentError, "please provide an array of a base and an exponent"
      else
        if iota.length == 1
          return "i"
        elsif iota.length == 2
          iota, power = iota[0], iota[1].to_i
          IMAGINARY[(power % IMAGINARY.length)]
        else
          return ""
        end
      end
    end
end
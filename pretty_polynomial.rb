def pretty_polynomials(poly, variable = "x")
  power = poly.count
  poly.each_with_index { |val, idx|
    power = power - 1
    if val == 0
      next
    end
    if idx != 0 || val < 0
      print "#{get_sign(val)}"
    end
    if print_coefficient(val)
      print "#{val.abs}"
    end
    if power != 0
      if val != 0
        print variable
      end
      if power != 1
        print "^#{power}"
      end
    end
  }
  puts
end

def print_coefficient(co_eff)
  co_eff != 0 && co_eff != 1
end

def get_sign(val)
  "++-"[val <=> 0] # => "-"
end

pretty_polynomials([0, 0, -57])
pretty_polynomials([0, 0, 0])
pretty_polynomials([1, -2, 3, 4])
pretty_polynomials([22, 0, -1])
pretty_polynomials([3, 4, 5])
pretty_polynomials([-1, -3, 0, 0, -34])
pretty_polynomials([23, -3, 0, 0, 0])
pretty_polynomials([2, 3, 4, 5, 6, 0, 0, 100])
pretty_polynomials([2, 3, 4, 5, 6, 0, 0, -23])

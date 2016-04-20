
# A class that generates the factorials for a given number
class PrimeFactorial

  def generate number
    result = []
    start = 2

    while start <= number
      if (number % start) == 0
        result << start
        number = number/start
      else
        start += 1
      end
    end

    result
  end

end

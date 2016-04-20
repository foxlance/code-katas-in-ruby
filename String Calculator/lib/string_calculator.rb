# Adds sequence of integer values in a given string
class StringCalculator

  def initialize
    @max_number = 999
  end

  def add number_string
    total = 0
    @numbers = parseNumbers number_string

    @numbers.each do |number|
      catchInvalidArgument number

      if number > @max_number
        next
      end

      total += number
    end

    total
  end


  private

  def parseNumbers numbers
    @numbers = numbers.split(/[, \n]/).map { |x| x.to_i }
  end

  def catchInvalidArgument number
    if (number < 0)
      raise ArgumentError, "Invalid parameter: #{number}"
    end
  end

end

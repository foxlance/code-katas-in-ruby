# Converts a Roman Numeral String
class RomanNumeralsConverter

  def initialize
    @roman_hash = {
      1000 => 'M',
      900  => 'CM',
      500  => 'D',
      400  => 'CD',
      100  => 'C',
      90   => 'XC',
      50   => 'L',
      40   => 'XL',
      10   => 'X',
      9    => 'IX',
      5    => 'V',
      4    => 'IV',
      1    => 'I',
    }
  end

  def convert number

    if number == 0
      raise ArgumentError, "There is no equivalent for zero"
    end

    if !number.is_a?(Fixnum)
      raise ArgumentError, "Please provide a valid number"
    end

    roman = ''

    @roman_hash.each do |key, value|
      while number >= key
        roman = "#{roman}#{value}"
        number -= key
      end
    end

    roman
  end

end

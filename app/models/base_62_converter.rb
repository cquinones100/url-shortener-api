class Base62Converter
  ALPHABET = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']

  def initialize(args) 
    @integer = args[:integer]
    @string = args[:string]
  end

  def convert
    if @integer
      convert_integer_to_string
    elsif @string
      convert_string_to_integer
    end
  end

  private

  def convert_integer_to_string
    divide_at_place(@integer, 0, 0)
  end

  def convert_string_to_integer
    convert_string_digit_to_integer(@string)
  end

  def convert_string_digit_to_integer(number)
    digit, *rest = number.split('')
    digit_value = digit_in_alphabet(digit)

    return digit_value if number.length == 1

    power = number.length - 1
    place_value = 62 ** power

    calculated_value = place_value * digit_value
    calculated_value + convert_string_digit_to_integer(rest.join(''))
  end

  def digit_in_alphabet(digit)
    if /\d+/ =~ digit
      digit = ALPHABET[digit.to_i]
    end

    return ALPHABET.find_index { |ele| ele == digit } 
  end

  def divide_at_place(integer, place, current_remainder)
    return convert_from_alphabet(integer) if integer < 62

    place_int = 62**place
    quotient = integer / place_int

    if quotient > place_int
      return divide_at_place(integer, place + 1, current_remainder) 
    end

    current_remainder = integer - (place_int * quotient)

    if current_remainder > 62
      return "#{quotient}#{divide_at_place(current_remainder, 0, 0)}"
    end

    "#{convert_from_alphabet(quotient)}#{convert_from_alphabet(integer % 62)}"
  end

  def digit_greater_than_62(digit)
    digit > 62
  end

  def convert_from_alphabet(int)
    ALPHABET[int]
  end
end

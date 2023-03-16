class RomanNumeral
  attr_reader :year_int

  def initialize(year)
    @year_int = year
  end

  def to_roman
    year_int_str = year_int.to_s
    
    l = year_int_str.length
    
    if l == 1
      return ones_place(year_int_str)
    elsif l == 2
      return (tens_place(year_int_str[0]) +
              ones_place(year_int_str[1]))
    elsif l == 3
      return (hundreds_place(year_int_str[0]) +
              tens_place(year_int_str[1]) +
              ones_place(year_int_str[2]))
    elsif l == 4
      return (thousands_place(year_int_str[0]) +
              hundreds_place(year_int_str[1]) +
              tens_place(year_int_str[2]) + 
              ones_place(year_int_str[3]))
    end
  end
  
  def ones_place(num)
    case num
    when "1"
      "I"
    when "2"
      "II"
    when "3"
      "III"
    when "4"
      "IV"
    when "5"
      "V"
    when "6"
      "VI"
    when "7"
      "VII"
    when "8"
      "VIII"
    when "9"
      "IX"
    else
      ""
    end
  end
  
  def tens_place(num)
    case num
    when "1"
      "X"
    when "2"
      "XX"
    when "3"
      "XXX"
    when "4"
      "XL"
    when "5"
      "L"
    when "6"
      "LX"
    when "7"
      "LXX"
    when "8"
      "LXXX"
    when "9"
      "XC"
    else
      ""
    end
  end
  
  def hundreds_place(num)
    case num
    when "1"
      "C"
    when "2"
      "CC"
    when "3"
      "CCC"
    when "4"
      "CD"
    when "5"
      "D"
    when "6"
      "DC"
    when "7"
      "DCC"
    when "8"
      "DCCC"
    when "9"
      "CM"
    else
      ""
    end
  end
  
  def thousands_place(num)
    case num
    when "1"
      "M"
    when "2"
      "MM"
    when "3"
      "MMM"
    else
      ""
    end
  end
end
# 罗马数字包含以下七种字符： I， V， X， L，C，D 和 M。
#
# 字符          数值
# I             1
# V             5
# X             10
# L             50
# C             100
# D             500
# M             1000
# 例如， 罗马数字 2 写做 II ，即为两个并列的 1。12 写做 XII ，即为 X + II 。 27 写做  XXVII, 即为 XX + V + II 。
#
# 通常情况下，罗马数字中小的数字在大的数字的右边。但也存在特例，例如 4 不写做 IIII，而是 IV。数字 1 在数字 5 的左边，所表示的数等于大数 5 减小数 1 得到的数值 4 。同样地，数字 9 表示为 IX。这个特殊的规则只适用于以下六种情况：
#
# I 可以放在 V (5) 和 X (10) 的左边，来表示 4 和 9。
# X 可以放在 L (50) 和 C (100) 的左边，来表示 40 和 90。 
# C 可以放在 D (500) 和 M (1000) 的左边，来表示 400 和 900。
# 给定一个整数，将其转为罗马数字。输入确保在 1 到 3999 的范围内。
#
# 示例 1:
#
# 输入: 3
# 输出: "III"
# 示例 2:
#
# 输入: 4
# 输出: "IV"
# 示例 3:
#
# 输入: 9
# 输出: "IX"
# 示例 4:
#
# 输入: 58
# 输出: "LVIII"
# 解释: L = 50, V = 5, III = 3.
# 示例 5:
#
# 输入: 1994
# 输出: "MCMXCIV"
# 解释: M = 1000, CM = 900, XC = 90, IV = 4.
#
# 来源：力扣（LeetCode）
# 链接：https://leetcode-cn.com/problems/integer-to-roman
# 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
class Algorithm
  LOOKUP = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }.freeze

  def result
    puts "3999 to Roman: #{int_to_roman(3999)}"
    puts "MMMCMXCIX to int: #{roman_to_int("MMMCMXCIX")}"

    puts "3568 to Roman: #{int_to_roman(3568)}"
    puts "MMMDLXVIII to int: #{roman_to_int("MMMDLXVIII")}"

    puts "MMMDLXVIII to int: #{roman_to_int2("MMMDLXVIII")}"
  end

  def int_to_roman(number)
    return "can't perform!" if number < 1 || number > 3999

    roman = ""
    LOOKUP.each do |symbool, value|
      while number >= value
        roman << symbool
        number -= value
      end
    end
    roman
  end

  # MMMCMXCIX = 3999
  def roman_to_int(roman)
    number = 0

    start = 0
    roman.each_char.with_index do |r, index|
      next if start != 0 && start == index
      if index + 1 < roman.size && LOOKUP.keys.include?("#{r}#{roman[index+1]}")
        number += LOOKUP["#{r}#{roman[index+1]}"]
        start = index + 1
      else
        number += LOOKUP[r]
      end
    end

    number
  end

  # MMMCMXCIX = 3999
  def roman_to_int2(roman)
    number = 0

    roman.each_char.with_index do |r, index|
      if index > 0 && LOOKUP[r] > LOOKUP[roman[index - 1]]
        number += LOOKUP[r] - 2 * LOOKUP[roman[index - 1]]
      else
        number += LOOKUP[r]
      end
    end

    number
  end
end

Algorithm.new.result

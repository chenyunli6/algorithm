# 编写一个函数来查找字符串数组中的最长公共前缀。
#
# 如果不存在公共前缀，返回空字符串 ""。
#
# 示例 1:
#
# 输入: ["flower","flow","flight"]
# 输出: "fl"
# 示例 2:
#
# 输入: ["dog","racecar","car"]
# 输出: ""
# 解释: 输入不存在公共前缀。
# 说明:
#
# 所有输入只包含小写字母 a-z 。
#
# 来源：力扣（LeetCode）
# 链接：https://leetcode-cn.com/problems/longest-common-prefix
# 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
class Algorithm
  def result
    puts "#{["flower","flow","flight"]} longest common prefix: #{longest_common_prefix(["flower","flow","flight"])}"
    puts "#{["dog","racecar","car"]} longest common prefix: #{longest_common_prefix(["dog","racecar","car"])}"
    puts "#{["a"]} longest common prefix: #{longest_common_prefix(["a"])}"
    puts "#{["a", "a", "b"]} longest common prefix: #{longest_common_prefix(["a", "a", "b"])}"
    puts "#{["abab","aba",""]} longest common prefix: #{longest_common_prefix(["abab","aba",""])}"
    puts "#{["","aba",""]} longest common prefix: #{longest_common_prefix(["","aba",""])}"
    puts "#{["aba","aba"]} longest common prefix: #{longest_common_prefix(["aba","aba"])}"
  end

  def my_longest_common_prefix(array)
    return "" if array.empty? || array.any? { |item| item.empty? }
    array = array.compact.uniq
    return array.first if array.size == 1
    b = []
    array.each_with_index do |item, index|
      next if index == array.size - 1 # 最后一笔计算过了，不用再计算了

      two_compare = to_char_index_array(item) & to_char_index_array(array[index + 1])

      b = two_compare if index == 0
      b = b & two_compare

      b = [] if !b.empty? && b.first[1] != 0
    end

    "#{b.map(&:first).join("")}"
  end

  def to_char_index_array(string)
    string.each_char.with_index.to_a
  end

  def longest_common_prefix(array)
    return "" if array.empty?
    min, max = array.minmax
    idx = min.size.times{|i| break i if min[i] != max[i]}
    min[0...idx]
  end
end

Algorithm.new.result

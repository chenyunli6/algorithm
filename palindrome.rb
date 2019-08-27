# 题目链接：

# Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.

# Example 1:

# Input: 121
# Output: true
# Example 2:

# Input: -121
# Output: false
# Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
# Example 3:

# Input: 10
# Output: false
# Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
# Follow up:

# Coud you solve it without converting the integer to a string?
# https://leetcode.com/problems/reverse-integer/

# 判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。
# 示例 1:

# 输入: 121
# 输出: true
# 示例 2:

# 输入: -121
# 输出: false
# 解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
# 示例 3:

# 输入: 10
# 输出: false
# 解释: 从右向左读, 为 01 。因此它不是一个回文数。
# 进阶:

# 你能不将整数转为字符串来解决这个问题吗？

# 来源：力扣（LeetCode）
# 链接：https://leetcode-cn.com/problems/palindrome-number
# 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

class Palindrome
  def result
    puts palindrome?(121)
    puts palindrome?(-121)
    puts palindrome?(10)
    puts "--------------"
    puts palindrome2?(121)
    puts palindrome2?(-121)
    puts palindrome2?(10)
  end

  def palindrome?(x)
    return false if x < 0
    x.to_s.reverse.to_i == x
  end

  def palindrome2?(x)
    return false if x < 0
    return false if x != 0 && x % 10 == 0
    
    res = 0
    x_copy = x
    while x_copy!= 0 do
      res = res * 10 + x_copy % 10
      x_copy /= 10
    end
    
    res <= (2**31 - 1) ? res == x : false
  end
end

Palindrome.new.result
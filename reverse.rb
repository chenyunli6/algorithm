# 题目链接：



# Given a 32-bit signed integer, reverse digits of an integer.

# Example 1:

# Input: 123
# Output: 321
# Example 2:

# Input: -123
# Output: -321
# Example 3:

# Input: 120
# Output: 21
# Note:
# Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
# https://leetcode.com/problems/reverse-integer/

# 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。
# 示例 1:

# 输入: 123
# 输出: 321
#  示例 2:

# 输入: -123
# 输出: -321
# 示例 3:

# 输入: 120
# 输出: 21
# 注意:
# 假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−2 的 31 次方,  2 的 31 次方 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。

# 来源：力扣（LeetCode）
# 链接：https://leetcode-cn.com/problems/reverse-integer
# 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

class Reverse
  def result
    puts reverse(123)
    puts reverse(-123)
    puts reverse(120)
    puts reverse(2147483412)
    puts reverse(-2147483412)
    puts reverse((2**31 - 1))
  end

  def reverse(x)
    puts x
    return -self.reverse(-x) if x < 0
    res = 0

    while x!= 0 do
      res = res * 10 + x % 10
      x /= 10
    end
    
    res <= (2**31 - 1) ? res : 0
  end
end

Reverse.new.result
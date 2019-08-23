class TargetIndex
  def check
    puts target_index([], 9).to_s
    puts target_index([2, 7, 11, 15], 9).to_s
    puts target_indexs([2, 7, 11, 15, 3, 6, 7, 9, 0], 9).to_s
  end

  def target_index(nums, target)
    lookup = {}
    nums.each_with_index do |num, index|
      other = target - num
      if lookup.key?(other)
        break [lookup[other], index]
      else
        lookup[num] = index
      end
    end
  end

  def target_indexs(nums, target)
    indexs = []
    lookup = {}
    nums.each_with_index do |num, index|
      other = target - num
      if lookup.key?(other)
        indexs << [lookup[other], index]
      else
        lookup[num] = index
      end
    end
    indexs
  end
end

TargetIndex.new.check
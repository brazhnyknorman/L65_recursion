def fibs(term)
  fib1 = 0
  fib2 = 1

  n = 1
  total = 0
  prev_term = nil
  prev_prev_term = nil

  while n <= term
    case n
    when 1
      total = fib1
    when 2
      total = fib2
    when 3
      total = fib1 + fib2
      prev_term = total
      prev_prev_term = fib2
    else
      total = prev_term + prev_prev_term
      prev_prev_term = prev_term
      prev_term = total
    end
    n += 1
  end
  puts total
end

def fibs_rec(term)
  case term
  when 1
    0
  when 2
    1
  else
    fibs_rec(term - 1) + fibs_rec(term - 2)
  end
end

# MergeSort Class
class MergeSort
  def sort(numbers)
    num_elements = numbers.length
    if num_elements <= 1
      return numbers
    end

    half_of_elements = (num_elements / 2).round

    left  = numbers.take(half_of_elements)
    right = numbers.drop(half_of_elements)

    sorted_left = sort(left)
    sorted_right = sort(right)

    merge(sorted_left, sorted_right)
  end

  def merge(left_array, right_array)
    if right_array.empty?
      return left_array
    end

    if left_array.empty?
      return right_array
    end

    smallest_number = if left_array.first <= right_array.first
      left_array.shift
    else
      right_array.shift
    end

    recursive = merge(left_array, right_array)

    [smallest_number].concat(recursive)
  end
end

# input = 8
# fibs(input)
# puts fibs_rec(input)
merge_sort = MergeSort.new
puts merge_sort.sort([4, 5, 6, 2])

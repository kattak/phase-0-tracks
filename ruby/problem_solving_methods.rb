#search array
def search_array(ary, int)
  i = 0
  until i == ary.length

    return i if ary[i] == int
    i += 1
  end
  return nil
end

def fib(n)
  if n == 1
    return [0]
  elsif n == 2
    return [0, 1]
    end
    if n > 2
      array_new = [0, 1]
      index = 2
      until array_new.length == n
        fib_new = array_new[index -1] + array_new[index -2]
        array_new << fib_new
        index += 1
      end
    end
  return array_new
end

#Take an array.
#Start at index 0 and 1 and compare elements.
#If element at index 1 is smaller than element at index 0, swap places.
#If not, keep same.
#Move on to index 1 and compare elements.
#If element at index 2 is smaller than element at index 1, swap places.
#Go until length of array.
#Create boolean value for swap.
#Continue to swap while swap is true.
#Stop when swap is false.
#Return new array.

new_array = [26, 2, 1, 43, 3]

def bubble_sort(new_array)
  swap = true
  until swap == false
  index = 0
  swap = false
    until index == new_array.length - 1
      n1 = new_array[index]
      n2 = new_array[index + 1]
      if n1 > n2
        new_array[index] = n2
        new_array[index + 1] = n1
        swap = true
      end
    index += 1
    end
  end
  return new_array
end
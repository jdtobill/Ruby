def merge_sort(arr)
  return arr if arr.size < 2
  mid = arr.size/2
  a, b = merge_sort(arr[0..(mid-1)]), merge_sort(arr[mid..-1])
  merged_list = []
  while a.size > 0 && b.size > 0
    merged_list << (a[0] < b[0] ? a.shift : b.shift)
  end
  merged_list += a if a.size > 0
  merged_list += b if b.size > 0
  merged_list
end

print merge_sort([4,56,12,15,65,6,9])


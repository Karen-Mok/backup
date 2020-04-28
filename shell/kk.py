#二路归并排序（递归）
def merge_sort(nums):
    segment(nums, 0, len(nums) - 1)
    return nums

#切分待排序数组
def segment(nums, left, right):
    if left >= right:
        return
    center = int((left + right) / 2)
    segment(nums, left, center)
    segment(nums, center + 1, right)
    merge(nums, left, center, right)

#两两归并排好序的数组（二路归并）
def merge(nums, left, center, right):
    tmpArray = [0] * len(nums)
    rightIndex = center + 1     #右数组的第一个元素索引
    tmpIndex = left
    begin = left
    while left <= center and rightIndex <= right:
        if nums[left] <= nums[rightIndex]:
            tmpArray[tmpIndex] = nums[left]
            tmpIndex += 1
            left += 1
        else:
            tmpArray[tmpIndex] = nums[rightIndex]
            tmpIndex += 1
            rightIndex += 1
    while left <= center:
        tmpArray[tmpIndex] = nums[left]
        tmpIndex += 1
        left += 1
    while rightIndex <= right:
        tmpArray[tmpIndex] = nums[rightIndex]
        tmpIndex += 1
        rightIndex += 1
    while begin <= right:
        nums[begin] = tmpArray[begin]
        begin += 1

nums = [6, 5, 3, 1, 7, 2, 4]
nums = merge_sort(nums)
print(nums)

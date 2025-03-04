# Remove Element

## Description

Given an array of integers `nums` and an integer `val`, remove all occurrences of `val` in `nums` and return the new length of the array.

It is not necessary to maintain the order of elements in the original array.

## Initial Solution

My initial idea was to iterate through the array and, whenever I found an element equal to `val`, shift the subsequent elements to the left, replacing the removed element. The code looked like this:

```java
class Solution {
    public int removeElement(int[] nums, int val) {
        if (nums.length == 0) return 0;

        int removedCount = 0;

        for (int i = 0; i < nums.length - removedCount; i++) {
            if (nums[i] == val) {
                removedCount++;
                for (int j = i; j < nums.length - removedCount; j++) {
                    nums[j] = nums[j + 1];
                }
                i--;
            }
        }

        return nums.length - removedCount;
    }
}
```
This algorithm has a complexity of `O(n²)` and space `O(1)`. However, the quadratic complexity is not ideal, so I sought a more efficient solution.

## Optimized Solution

A more efficient approach is to iterate through the array and copy the elements that are not equal to `val` to the beginning of the array. This way, we maintain a counter of valid elements and replace the removed elements with the next valid ones. The code looks like this:

```java
class Solution {
    public int removeElement(int[] nums, int val) {
        if (nums.length == 0) return 0;

        int k = 0;

        for(int i = 0; i < nums.length; i++){
            if(nums[i] != val)
                nums[k++] = nums[i];
        }

        return k;
    }
}
```
With this, the algorithm has a complexity of `O(n)` and space `O(1)`.
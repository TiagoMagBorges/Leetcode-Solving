# Remove Duplicates from Sorted Array

## Description

Given a sorted integer array `nums` in non-decreasing order, remove duplicate elements **in-place** (without using extra memory) and return the new length of the array containing only distinct values.

Although the structure of the array may be modified, the count of distinct elements must be reflected in the function's return value.

## Initial Solution

The initial idea was based on the same approach used in the **Remove Element** problem: instead of searching for elements to be removed, we look for the ones that should be kept.

The solution iterates through the array, and whenever it finds a number **different from the last checked number**, it copies that number to the next valid position. The code is as follows:

```java
class Solution {
    public int removeDuplicates(int[] nums) {
        if (nums.length <= 1) return nums.length;

        int lastChecked = nums[0], k = 1;

        for (int i = 1; i < nums.length; i++) {
            if (nums[i] != lastChecked) {
                nums[k++] = nums[i];
                lastChecked = nums[i];
            }
        }

        return k;
    }
}
```
## Final Solution

The variable `lastChecked` can be removed since we can directly access the last unique value in the array using (`nums[k - 1]`). This way, the final implementation is more concise:

```java
class Solution {
    public int removeDuplicates(int[] nums) {
        if (nums.length <= 1) return nums.length;

        int k = 1;

        for (int i = 1; i < nums.length; i++) {
            if (nums[i] != nums[k - 1]) 
                nums[k++] = nums[i];
        }

        return k;   
    }
}
```
Thus, the algorithm still has a time complexity of `O(n)` and a space complexity of `O(1)`, but with one less variable.
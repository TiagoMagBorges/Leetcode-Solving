# Remove Duplicates from Sorted Array

## Description
Given a sorted integer array `nums` in non-decreasing order, the goal is to modify the array **in-place** so that each element appears at most **twice**. Finally, we must return the new length of the array.

## Solution
This solution is a variation of the **"Remove Duplicates from Sorted Array"** problem with a small adjustment:
- Instead of allowing **only one occurrence** of each number, we allow **up to two**.
- To achieve this, we check if the current element (`nums[i]`) is **different from `nums[k - 2]`** (the second-to-last valid element in the array).
- If it is different, we can safely include this occurrence in the array.

```java
public class Solution {
    public int removeDuplicates(int[] nums) {
        if(nums.length <= 2) return nums.length;

        int k = 2;

        for(int i = 2; i < nums.length; i++){
            if (nums[i] != nums[k - 2])
                nums[k++] = nums[i];
        }

        return k;
    }
}
```
This way, the algorithm maintains `O(n)` complexity and `O(1)` space.
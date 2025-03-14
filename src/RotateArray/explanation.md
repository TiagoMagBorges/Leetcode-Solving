# RotateArray

## Description

Given an array of nums integers, rotate the array to the right in k steps, where k is non-negative.

## Initial Solution

My initial idea was to create a hashmap to store the new position of each element in the array after rotation. For each element in the array, I calculate the new position and store it in the hashmap. Finally, I copy the elements from the hashmap to the original array. The code looks like this:

```java
import java.util.HashMap;

class Solution {
    public void rotate(int[] nums, int k) {
        k = k % nums.length;

        HashMap<Integer, Integer> map = new HashMap<>();

        for (int i = 0; i < nums.length; i++) {
            int newPosition = (i + k) % nums.length;
            map.put(newPosition, nums[i]);
        }

        for (int i = 0; i < nums.length; i++) nums[i] = map.get(i);
    }
}
```
In this way, the algorithm has `O(n)` complexity and `O(n)` space. However, I wasn't satisfied with the space complexity, so I looked for a more efficient solution.

## Final Solution

A more efficient approach is to invert the entire array, then invert the first k elements and finally invert the remaining elements. The code looks like this:

```java
class Solution{
    public void rotate(int[]nums, int k){
        k %= nums.length;

        reverse(nums, 0, nums.length - 1);
        reverse(nums, 0, k - 1);
        reverse(nums, k, nums.length - 1);
    }

    private void reverse(int[]nums, int start, int end){
        while(start < end){


Translated with DeepL.com (free version)
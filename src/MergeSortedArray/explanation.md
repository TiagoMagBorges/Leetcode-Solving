# Merge Sorted Array

## Description

You have two integer arrays `nums1` and `nums2`, sorted in non-decreasing order, and two integers `m` and `n`, representing the number of elements in `nums1` and `nums2`, respectively.

The goal is to merge `nums1` and `nums2` into a single array sorted in non-decreasing order. The final array should not be returned by the function, but instead be stored inside the array `nums1`. To accommodate this, `nums1` has a length of `m + n`, where the first `m` elements denote the elements that should be merged, and the last `n` elements are set to 0 and should be ignored. `nums2` has a length of `n`.

## Initial Solution

My initial idea was to make a simple loop of `m + n` that compared which of the two elements was smaller and added it to the final array in a separate variable, and then copied the final array to the original array. The code was as follows:

```java
class Solution {
    public void merge(int[] nums1, int m, int[] nums2, int n) {
        // Allocating a new array where the values will be temporarily stored
        int[] array = new int[m + n];
        // Variables to traverse the arrays
        int i = 0, j = 0, k = 0;

        // Loop to traverse the arrays, comparing which of the two elements is smaller
        while (i < m && j < n) {
            if (nums1[i] < nums2[j])
                array[k++] = nums1[i++];
            else
                array[k++] = nums2[j++];
        }

        // Loops to add the remaining elements of the array that was not completely traversed
        while (i < m) array[k++] = nums1[i++];

        while (j < n) array[k++] = nums2[j++];

        // Copying the temporary array to the original array
        for (int x = 0; x < m + n; x++)
            nums1[x] = array[x];
    }
}
```
Thus, the algorithm has a complexity of `O(m + n)` and space `O(m + n)`. However, I was not satisfied with allocating a new array and copying it back to the original array. So, I tried to find a way to do this without allocating a new array.

## Optimized Solution

The way I found was to start traversing the arrays from back to front, so I can place the sorted elements at the end of the original array without needing to allocate a new array. The code was as follows:

```java
class Solution {
    public void merge(int[] nums1, int m, int[] nums2, int n) {
        // Variables to traverse the arrays
        int i = m - 1, j = n - 1, k = m + n - 1;

        // Loop to traverse the arrays, comparing which of the two elements is larger
        while (i >= 0 && j >= 0) {
            if (nums1[i] > nums2[j])
                nums1[k--] = nums1[i--];
            else
                nums1[k--] = nums2[j--];
        }

        // Loops to add the remaining elements of the array that was not completely traversed
        while (i >= 0) nums1[k--] = nums1[i--];

        while (j >= 0) nums1[k--] = nums2[j--];
    }
}
```
Thus, the algorithm has a complexity of `O(m + n)` and space `O(1)`.

# Majority Element

## Description

Given an array of integers, find the majority element. The majority element is the element that appears more than `n / 2` times, where `n` is the size of the array.

You can assume that the array is not empty and that the majority element always exists in the array.

## Initial Solution

My initial idea was to create a HashMap to store the count of each element in the array. In each iteration, I checked if the current element had already become the majority element. The code looked like this:

```java
import java.util.HashMap;

class Solution {
    public int majorityElement(int[] nums) {
        int maj = nums.length / 2;
        HashMap<Integer, Integer> map = new HashMap<>();
        
        for (int num : nums) {
            map.put(num, map.getOrDefault(num, 0) + 1);
            if (map.get(num) > maj) return num;
        }
        
        return -1;
    }
}
```

With this, the algorithm has a time complexity of `O(n)` and a space complexity of `O(n)`. However, this approach stores unnecessary information, consuming more memory than needed. To avoid this extra space usage, I searched for a more efficient solution.

## Final Solution

After a few failed attempts, I found the Boyer-Moore Voting Algorithm. It keeps only two variables: `candidate` and `count`. In each iteration, it checks if the current number is equal to the candidate. If so, it increments the counter; otherwise, it decrements it. When `count` reaches `0`, the candidate is updated to the current number. In the end, the stored candidate will be the majority element.

```java
class Solution {
    public int majorityElement(int[] nums) {
        int candidate = 0, count = 0;
        
        for (int num : nums) {
            if (count == 0) candidate = num;
            count += (num == candidate) ? 1 : -1;
        }
        
        return candidate;
    }
}
```

Thus, the algorithm maintains a time complexity of `O(n)`, but reduces the space complexity to `O(1)`, making it the most efficient solution for this problem.
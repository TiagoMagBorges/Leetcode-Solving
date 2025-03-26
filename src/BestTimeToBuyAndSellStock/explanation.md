# BestTimeToBuyAndSellStock

## Description

You are given a set of prices where `prices[i]` is the price of a particular stock on the i-th day.

You want to maximize your profit by choosing a single day to buy a stock and choosing a different day in the future to sell that stock.

Return the maximum profit you can make on this transaction. If you can't make any profit, return 0.

## Initial Solution

My initial idea was to create a `profit` variable that is initialized with `0`, which will store the maximum profit that can be made. I then run through the array making comparisons of all possible combinations of buying and selling shares. At each iteration, I check whether the profit obtained is greater than the maximum profit stored in the `profit` variable. If it is, I update the `profit` value. The code looks like this:

```java
class Solution {
    public int maxProfit(int[] prices) {
        int profit = 0;
        
        for(int i = 0; i < prices.length - 1; i++){
            for(int j = i+1; j < prices.length; j++)
                if(prices[j] - prices[i] > profit) profit = prices[j] - prices[i];
        }
        return profit;
    }
}
```
The time complexity of this solution is `0(n²)` and the space complexity is `0(1)`. But since the solution is very slow, I decided to try a different approach.

## Final Solution

The way I found was to create two variables, `buy` and `profit`. The `buy` variable will store the lowest share purchase price and the `profit` variable will store the maximum profit that can be made. I scroll through the array of prices and, at each iteration, I check whether the share price is lower than the value stored in the `buy` variable. If it is, I update the value of `buy`. If not, I check whether the difference between the share price and the `buy` value is greater than the value stored in the `profit` variable. If it is, I update the `profit` value. The code looks like this:

```java
class Solution{
    public int maxProfit(int[] prices){
        int buy = prices[0];
        int profit = 0;
        
        for(int i = 1; i < prices.length; i++){
            if(prices[i] < buy) buy = prices[i];
            else if(prices[i] - buy > profit) profit = prices[i] - buy;
        }
    }
}
```
The time complexity of this solution is `0(n)` and the space complexity is `0(1)`.

Translated with DeepL.com (free version)
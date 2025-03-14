# RotateArray

## Descrição

Dado um array de inteiros nums, gire o array para a direita em k passos, onde k é não negativo.

## Solução Inicial

A minha ideia inicial foi criar um hashmap para armazenar a nova posição de cada elemento do array após a rotação. Para cada elemento do array, calculo a nova posição e armazeno no hashmap. Por fim, copio os elementos do hashmap para o array original. O código ficou assim:

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
Desta forma o algoritmo tem complexidade `O(n)` e espaço `O(n)`. No entanto, não fiquei satisfeito com a complexidade de espaço, então busquei uma solução mais eficiente.

## Solução Final

Uma abordagem mais eficiente é inverter o array inteiro, depois inverter os primeiros k elementos e, por fim, inverter os elementos restantes. O código ficou assim:

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
            int temp = nums[start];
            nums[start] = nums[end];
            nums[end] = temp;
            start++;
            end--;
        }
    }
}
```
Com isso, o algoritmo tem complexidade `O(n)` e espaço `O(1)`.
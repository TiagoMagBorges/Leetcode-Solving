# Remove Duplicates from Sorted Array

## Descrição
Dado um array de inteiros `nums` ordenado em ordem não decrescente, o objetivo é modificar o array **in-place** para que cada elemento apareça no máximo **duas vezes**. Ao final, devemos retornar o novo comprimento do array.

## Solução
Esta solução é uma variação do problema **"Remove Duplicates from Sorted Array"**, mas com uma pequena adaptação:
- Em vez de permitir **apenas uma ocorrência** de cada número, podemos permitir **até duas**.
- Para isso, verificamos se o elemento atual (`nums[i]`) é **diferente do número armazenado em `nums[k - 2]`** (o antepenúltimo número válido no array).
- Se for diferente, significa que ainda podemos incluir essa ocorrência no array.

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

Desse modo, o algoritmo mantem a complexidade `O(n)` e espaço `O(1)`.
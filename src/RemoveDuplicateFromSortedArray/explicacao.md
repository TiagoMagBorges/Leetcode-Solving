# Remove Duplicates from Sorted Array

## Descrição

Dado um array de inteiros `nums` ordenado em ordem não decrescente, remova os elementos duplicados **in-place** (sem usar memória extra) e retorne o novo comprimento do array contendo apenas valores distintos.

Embora a estrutura do array possa ser modificada, a contagem de elementos distintos deve ser refletida no valor retornado pela função.

## Solução Inicial

A ideia inicial foi baseada na mesma abordagem utilizada no problema **Remove Element**: em vez de procurar os elementos que devem ser removidos, buscamos aqueles que devem ser mantidos.

A solução percorre o array e, sempre que encontra um número **diferente do último número verificado**, copia esse número para a próxima posição válida. O código ficou assim:

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
## Solução Final

A variável `lastChecked` pode ser removida, pois já podemos acessar o último valor único diretamente no próprio array (`nums[k - 1]`). Assim, a implementação final fica mais enxuta:

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
Desta forma, o algoritmo ainda tem complexidade `O(n)` e espaço `O(1)`, mas com uma variável a menos.
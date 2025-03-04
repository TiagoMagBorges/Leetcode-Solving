# Remove Element

## Descrição

Dado um array de inteiros `nums` e um inteiro `val`, remova todas as ocorrências de `val` em `nums` e retorne o novo comprimento do array.

Não é necessário manter a ordem dos elementos no array original.

## Solução Inicial

Minha ideia inicial foi iterar pelo array e, sempre que encontrasse um elemento igual a `val`, deslocar os elementos subsequentes para a esquerda, substituindo o elemento removido. O código ficou assim:

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
Este algoritmo tem complexidade `O(n²)` e espaço `O(1)`. No entanto, a complexidade quadrática não é ideal, então busquei uma solução mais eficiente.

## Solução Otimizada

Uma abordagem mais eficiente é iterar pelo array e copiar os elementos que não são iguais a `val` para o início do array. Dessa forma, mantemos um contador de elementos válidos e substituímos os elementos a serem removidos pelos próximos elementos válidos. O código ficou assim:

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
Com isso, o algoritmo tem complexidade `O(n)` e espaço `O(1)`.
# Merge Sorted Array

## Descrição

Você tem dois arrays de inteiros `nums1` e `nums2`, ordenados em ordem não decrescente, e dois inteiros `m` e `n`, representando o número de elementos em `nums1` e `nums2`, respectivamente.

O objetivo é mesclar `nums1` e `nums2` em um único array ordenado em ordem não decrescente. O array final não deve ser retornado pela função, mas sim armazenado dentro do array `nums1`. Para acomodar isso, `nums1` tem um comprimento de `m + n`, onde os primeiros `m` elementos denotam os elementos que devem ser mesclados, e os últimos `n` elementos são definidos como 0 e devem ser ignorados. `nums2` tem um comprimento de `n`.

## Solução Inicial

Minha ideia inicial foi fazer um loop simples de `m + n` que comparava qual dos dois elementos era menor e adicionava ao array final em uma variável separada, e depois copiava o array final para o array original. O código ficou assim:

```java
class Solution {
    public void merge(int[] nums1, int m, int[] nums2, int n) {
        // Alocando um array novo onde os valores ficarão temporariamente
        int[] array = new int[m + n];
        // Variáveis para percorrer os arrays
        int i = 0, j = 0, k = 0;

        // Loop para percorrer os arrays, comparando qual dos dois elementos é menor
        while (i < m && j < n) {
            if (nums1[i] < nums2[j])
                array[k++] = nums1[i++];
            else
                array[k++] = nums2[j++];
        }

        // Loops para adicionar os elementos restantes do array que não foi completamente percorrido
        while (i < m) array[k++] = nums1[i++];

        while (j < n) array[k++] = nums2[j++];

        // Copiando o array temporário para o array original
        for (
                int x = 0;
                x < m + n; x++)
            nums1[x] = array[x];
    }
}
```
Com isso, o algoritmo tem complexidade `O(m + n)` e espaço `O(m + n)`. No entanto, não fiquei satisfeito com a alocação de um novo array e a cópia de volta para o array original. Então, tentei encontrar uma forma de fazer isso sem alocar um novo array.

## Solução Otimizada

A forma que encontrei foi começar a percorrer os arrays de trás para frente, assim posso colocar os elementos ordenados no final do array original sem precisar alocar um novo array. O código ficou assim:

```java
class Solution {
    public void merge(int[] nums1, int m, int[] nums2, int n) {
        // Variáveis para percorrer os arrays
        int i = m - 1, j = n - 1, k = m + n - 1;

        // Loop para percorrer os arrays, comparando qual dos dois elementos é maior
        while (i >= 0 && j >= 0) {
            if (nums1[i] > nums2[j])
                nums1[k--] = nums1[i--];
            else
                nums1[k--] = nums2[j--];
        }

        // Loops para adicionar os elementos restantes do array que não foi completamente percorrido
        while (i >= 0) nums1[k--] = nums1[i--];

        while (j >= 0) nums1[k--] = nums2[j--];
    }
}
```
Desta forma, o algoritmo tem complexidade `O(m + n)` e espaço `O(1)`.
# Majority Element

## Descrição

Dado um array de inteiros, encontre o elemento majoritário. O elemento majoritário é o elemento que aparece mais de `n / 2` vezes, onde `n` é o tamanho do array.

Você pode assumir que o array não está vazio e que o elemento majoritário sempre existe no array.

## Solução Inicial

Minha ideia inicial foi criar um HashMap para armazenar a contagem de cada elemento do array. A cada iteração, verificava se o elemento atual já havia se tornado majoritário. O código ficou assim:

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
Com isso, o algoritmo tem complexidade `O(n)` em tempo e `O(n)` em espaço. No entanto, essa abordagem armazena informações desnecessárias, consumindo mais memória do que o necessário. Para evitar esse uso extra de espaço, busquei uma solução mais eficiente.
## Solução Final

## Solução Final

Após algumas tentativas falhas, encontrei o Algoritmo Boyer-Moore Voting. Ele mantém apenas duas variáveis: `candidate` e `count`. A cada iteração, verifica se o número atual é igual ao candidato. Se for, incrementa o contador, caso contrário, decrementa. Quando `count` chega a `0`, o candidato é atualizado para o número atual. No final, o candidato armazenado será o elemento majoritário.

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
Assim, o algoritmo mantém a complexidade de tempo `O(n)`, mas reduz a complexidade de espaço para `O(1)`, tornando-se a solução mais eficiente para esse problema.
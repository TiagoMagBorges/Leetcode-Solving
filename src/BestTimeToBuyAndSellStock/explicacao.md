# BestTimeToBuyAndSellStock

## Descrição

É-lhe dado um conjunto de preços em que `prices[i]` é o preço de uma determinada ação no i-ésimo dia.

Pretende maximizar o seu lucro escolhendo um único dia para comprar uma ação e escolhendo um dia diferente no futuro para vender essa ação.

Devolva o lucro máximo que pode obter com esta transação. Se não conseguir obter qualquer lucro, devolva 0.

## Solução Inicial

A minha ideia inicial foi criar uma variável `profit` que é inicializada com `0`, que irá armazenar o lucro máximo que pode ser obtido. Em seguida, eu percorro o array fazendo comparações de todas as combinações possíveis de compra e venda de ações. A cada iteração, eu verifico se o lucro obtido é maior que o lucro máximo armazenado na variável `profit`. Caso seja, eu atualizo o valor de `profit`. O código ficou da seguinte forma:

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
A complexidade de tempo dessa solução é `0(n²)` e a complexidade de espaço é `0(1)`. Mas, como a solução é muito lenta, eu decidi tentar uma abordagem diferente.

## Solução Final

A forma que eu encontrei foi criar duas variáveis, `buy` e `profit`. A variável `buy` irá armazenar o menor valor de compra de ações e a variável `profit` irá armazenar o lucro máximo que pode ser obtido. Eu percorro o array de preços e, a cada iteração, eu verifico se o preço da ação é menor que o valor armazenado na variável `buy`. Caso seja, eu atualizo o valor de `buy`. Se não, eu verifico se a diferença entre o preço da ação e o valor de `buy` é maior que o valor armazenado na variável `profit`. Caso seja, eu atualizo o valor de `profit`. O código ficou da seguinte forma:

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
A complexidade de tempo dessa solução é `0(n)` e a complexidade de espaço é `0(1)`.
#!/bin/bash

if [ -z "$1" ]; then
  echo "Uso: ./createNewProblem.sh nomeDoProblema"
  exit 1
fi

PROBLEM_NAME=$1
SRC_DIR="src"
PACKAGE_DIR="$SRC_DIR/$PROBLEM_NAME"

# Verifica se o diretório do problema já existe
if [ -d "$PACKAGE_DIR" ]; then
  echo "Erro: O problema '$PROBLEM_NAME' já existe!"
  exit 1
fi

# Cria o diretório do pacote
mkdir -p "$PACKAGE_DIR"

# Cria o arquivo Solution.java
cat > "$PACKAGE_DIR/Solution.java" <<EOL
package $PROBLEM_NAME;

/*

*/

public class Solution {

}
EOL

# Cria os arquivos de explicação
cat > "$PACKAGE_DIR/explanation.md" <<EOL
# $PROBLEM_NAME

## Description



## Initial Solution



## Final Solution
EOL

cat > "$PACKAGE_DIR/explicacao.md" <<EOL
# $PROBLEM_NAME

## Descrição



## Solução Inicial



## Solução Final
EOL

echo "Problema '$PROBLEM_NAME' criado com sucesso!"

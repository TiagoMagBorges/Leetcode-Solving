#!/bin/bash

if [ -z "$1" ]; then
  echo "Uso: ./createNewProblem.sh nomeDoProblema"
  exit 1
fi

PROBLEM_NAME=$1
SRC_DIR="src"
PACKAGE_DIR="$SRC_DIR/$PROBLEM_NAME"

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
touch "$PACKAGE_DIR/explanation.md"
touch "$PACKAGE_DIR/explicacao.md"

echo "Problema $PROBLEM_NAME criado com sucesso!"

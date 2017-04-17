
|Problema          | Medida de desempenho     | Ambiente     | Sensores | Atuadores|
|:-----------------|:-------------------------|:-------------|:---------|:---------|
|Robô de busca cega         | Menor custo do caminho       | Terreno, robo, ponto de destino       |Tipo do terreno, posição atual, posição final |Movimento do robo |


|Observável|Determinístico|Episódico|Estático|Discreto|Multiagente|
|:---------|:-------------|:--------|:-------|:-------|:----------|
|Parcialmente: O agente so enxerga a parte que lhe interessa do mapa, não necessariamente observando o mapa todo;|Determinístico: O mapa é inalterado durante o processo, não há presença de aleatoriedade;|Sequencial: Uma tomada de decisão de caminho influencia no proximo caminho a ser pego;|Estático: O robo, após determinar um caminho, não vai alterar sua decisão;|Discreto: As variáveis são enumeráveis e finitas como peso, tamanho do mapa e terrenos;|Unico: Apenas o robô;|

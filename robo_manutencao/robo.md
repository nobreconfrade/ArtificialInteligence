
|Problema          | Medida de desempenho     | Ambiente     | Sensores | Atuadores|
|:-----------------|:-------------------------|:-------------|:---------|:---------|
|Robô de manutenção        | Menor custo do caminho para conserto de fabricas       | Terreno, robo, fabricas, peças  |Tipo do terreno, raio de visão destacando o tipo de ferramenta, posição das fabricas |Movimento do robo, captura da ferramenta, entrega da ferramenta |


|Observável|Determinístico|Episódico|Estático|Discreto|Multiagente|
|:---------|:-------------|:--------|:-------|:-------|:----------|
|Parcialmente: O agente so enxerga o raio de visão|Estocático: O andar do agente é aleatório|Sequencial: Uma tomada de decisão de caminho influencia no proximo caminho a ser pego, uma ferramenta pega influencia na proxima|Estático: O robo esta em um mapa estático que nao se altera|Discreto: As variáveis são enumeráveis e finitas como peso, tamanho do mapa, terrenos, fabricas e ferramentas;|Unico: Apenas o robô;|

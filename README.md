# Teste para Engenheiro de Dados - Indeorum

## Introdução
A indeorum iniciou como uma empresa voltada a serviços de data science aplicados a pós-graduação brasileira.
Por isso, seus três produtos lançados são voltados para esta área (Cientum, Ranquium e Quantum).
Desta forma, este teste focará neste domínio. Abaixo na seção de contexto serão explicadas informações referentes ao domínio da pós-graduação, posteriormente serão abordados os objetivos, o arquivo de entrada, a entrega/apresentação, além de dicas e sugestões.

## Contexto
Nesta seção serão apresentadas informações importantes referentes ao contexto da pós-graduação brasileira.

### Instituição de Ensino:
Uma instituição é chamada como "de ensino" quando esta oferece cursos de pós-graduação. 
Esta instituição poderá ser um instituto federal, uma universidade pública ou privada ou até mesmo uma fundação de pesquisa (como a Fiocruz).

### Pesquisador: 
Um pesquisador poderá ser desde um funcionário de uma instituição, como um professor (docente) ou um técnico-administrativo, até um aluno que esteja realizando sua pós-graduação(exemplo: mestrado ou doutorado).

### Produções Intelectuais: 
Uma produção intelectual representa todo objeto científico gerado por um pesquisador. Comumente elas são classificadas em três tipos: artísticas, bibliográficas, técnicas e orientações. Para este teste, _todas as produções do arquivo serão produções biblográficas_, sendo estas dividas nos quatro seguintes tipos: 
- Artigos em Periódicos
- Livros
- Trabalho em Anais/Congresso
- Outros

## Objetivo do Teste

Seus colegas de equipe necessitam das informações que estão disponíveis neste arquivo TSV, porém necessitam de dados consistentes e organizados. Seu trabalho será processar estas informações, aplicando as transformações necessárias, e em sequência carregá-las em uma
nova base de dados. Esta base deverá ser projetada por você, buscando facilitar o trabalho do restante dos seus colegas de equipe.

## Arquivo de Entrada

O arquivo de entrada será um TSV, com informações desestruturadas a respeito de produções. 
Cada linha será referente a uma autoria, contendo informações referentes a produção, ao pesquisador, a instituição e a conexão entre pesquisador e instituição.
As informações neste arquivo poderão incluir eventuais incosistências de dados que necessitem de tratamento.
Estes são dados simulados gerados para o teste, porém seu formato é baseado em um caso real.

## Base Final

A base final deverá ser projetada pensando em sua utilização com enfoque em buscas de produções acadêmicas. Ou seja, deverá ser possível visualizar a produção de um pesquisador, de uma instituição, aplicar filtros temporais e etc de forma eficiente.
Uma aplicação que possui funcionalidade similar é [minhacapes.indeorum.com](http://minhacapes.indeorum.com), uma aplicação ainda em fase alpha de buscas na base brasileira de produções.

## Entregáveis/Apresentação

Para execução do teste, deverá ser realizado o fork deste repositório e desenvolvido a partir de então.
A entrega deverá ser realizada através do envio do link do repositório para o email até **sexta-feira (22/02/19), as 23:59**.
No **sábado, dia 23/02/19, às 14h,** será realizada uma etapa presencial consistindo de uma etapa em grupo, além de uma breve apresentação individual do resultado enviado deste teste.

## Passos sugeridos:

1. Projetar a base de dados destino - escolha a tecnologia que você desejar seja ela relacional, orientada a documento ou o que preferir (ex: MongoDB, Cassandra, PostgreSQL). Documente este processo (abuse de diagramas, anotações do processo e etc.), buscando explicar o porquê de ter tomado as decisões de projeto.
2. Desenvolva um script que leia o arquivo de entrada, aplique a limpeza e as transformações necessárias e carregue-o na base de dados destino. Neste passo também poderá utilizar-se da sua linguagem de preferência (ex: python, ruby, java..). Neste passo você estará realizando um processo completo de ETL. Da mesma forma que no passo anterior, documente suas escolhas.

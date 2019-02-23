# Instala Pacotes de Bibliotecas
install.packages('readr')
install.packages('stringr')
install.packages('lubridate')
install.packages('dplyr')

# Chama Biblioteca readr para ler arquivos tsv
library(readr)
# Chama Biblioteca de manipulação de caracteres (char)
library(stringr)
# Chama Biblioteca lubridate que serve para trabalhar com datas
library(lubridate)
# Chama biblioteca dplyr para trabalhar com agrupamentos
library(dplyr)


# Seta o path a ser utilizado
setwd("C:/Users/Augusto/Desktop/indeorum/")

# lê o arquivo "data.tsv" e coloca no dataset "data"
data <- read_tsv("data.tsv", na = ":")

## MANIPULAÇÂO DE FORMATO DE DATAS

# Procura formatos y-m-d, os muda para y-m-d UTC e os coloca no dataset "a"
a <- parse_date_time(data$publication_date, c("ymd"))   

# Procura formatos d-m-y, os muda para y-m-d UTC e os coloca no dataset "b"
b <- parse_date_time(data$publication_date, c("dmy"))   

# Combina os 2 datasets ("a" e "b") mantendo suas posições, os colocando no dataset "a"
a[is.na(a)] <- b[!is.na(b)]

# retira UTC do fim das datas
a <- gsub(" UTC", "", as.character(factor(a)))

# realoca o dataset "a" com suas modificações na tabela "publication_date" do dataset "data"
data$publication_date <- a

## MANIPULAÇÃO DATAS "START" e "END" + LIMPEZA

# Separa Data Start e Data End da coluna "start_end"
Split <- strsplit(as.character(data$start_end), "|", fixed = TRUE)

# Cria coluna Start e coloca data
Start <- sapply(Split, "[", 1)

# Cria coluna End e coloca data
End <- sapply(Split, "[", 2)

# Coloca "Start" na coluna "data_start"
data$data_start <- Start

# Coloca "End" na coluna "data_end"
data$data_end <- End

# Coloca NA se valor "nill"
data[data=="nill"]<-NA

# Deleta Coluna "start_end"
data$start_end <- NULL

# Arruma Erros de escrita
data[data=="jornal"]<-"journal"
data[data=="artilce"]<-"article"
data[data=="Other"]<-"other"

# Agrupa por tipo de publicação e coloca a coluna ID
data_pub_type <- group_by(data, type)
data_pub_type2 <- summarize(data_pub_type)
#coloca a coluna ID
data_pub_type2$ID <- seq.int(nrow(data_pub_type2))

# Agrupa por instituição e 
data_institution <- group_by(data, institution)
data_institution2 <- summarize(data_institution)
#coloca a coluna ID
data_institution2$ID <- seq.int(nrow(data_institution2))

## Cria DataFrames de Tipos
DF1 <- data.frame(data_pub_type2)
DF2 <- data.frame(data,
                  stringsAsFactors = FALSE)

# Merge DataFrame 1 e DataFrame 2 por "type"
DF3 <- merge(DF1, DF2, by = "type", all.x = TRUE)

# Muda Nomes Data Frame
names(DF3) <- c("type", "type_id","name", "jobs", "institution", "production", "publication_date", "data_start", "data_end")



# Cria DataFrames de Instituição
DF1 <- data.frame(data_institution2)
DF2 <- data.frame(DF3, stringsAsFactors = FALSE)

# Merge DataFrame 1 e DataFrame 2 por "institution"
DF4 <- merge(DF1, DF2, by = "institution", all.x = TRUE)

# Muda Nomes Data Frame
names(DF4) <- c("institution","institution_id","type", "type_id","name", "jobs", "production", "publication_date", "data_start", "data_end")

#limpa coluna instituição (deixa só o institution_id)
DF4$institution <- NULL

#limpa coluna type (deixa só o type_id)
DF4$type <- NULL


## Tabelas 
#tbl_production
#DF4

#tbl_institution
#data_institution2

data_institution2$ID <- NULL

#tbl_type
#data_pub_type2

data_pub_type2$ID <- NULL

#Chama RMySQL e SQLite, Bibliotecas do Banco de Dados
install.packages("RMySQL")
library(RMySQL)
install.packages("SQLite")
library(SQLite)

#Transforma listas em Dataframes
data_institution2 <- as.data.frame(data_institution2)
data_pub_type2 <- as.data.frame(data_pub_type2)

#Cria Conexão
con = dbConnect(MySQL(), user = 'root', password = '12345', dbname = 'indeorumtest',
                host = 'localhost')

# Lista tabelas
dbWriteTable(con, "tbl_production", DF4,
             field.types = NULL, row.names = TRUE, overwrite = TRUE,
             append = FALSE, allow.keywords = FALSE)

dbWriteTable(con,"tbl_type",data_pub_type2, overwrite = TRUE,
             append = FALSE, allow.keywords = FALSE)

dbWriteTable(con, "tbl_institution", data_institution2, overwrite = TRUE,
             append = FALSE, allow.keywords = FALSE)

#Altera Primary Keys se necessário
dbSendQuery(con, "ALTER TABLE tbl_production CHANGE `row_names` `id` INT PRIMARY KEY AUTO_INCREMENT")
dbSendQuery(con, "ALTER TABLE tbl_type CHANGE `row_names` `id` INT PRIMARY KEY AUTO_INCREMENT")
dbSendQuery(con, "ALTER TABLE tbl_institution CHANGE `row_names` `id` INT PRIMARY KEY AUTO_INCREMENT")


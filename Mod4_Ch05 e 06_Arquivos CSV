# Trabalhando com arquivos csv

# Usando o pacote readr com funções mais rápidas que as contidas no pacote 'utils'

# Instalando o pacote readr
install.packages("readr")
library(readr)

# Abre o promt para escolher o arquivo dentro do sistema de arquivos.

# Não é preciso passar o nome do arquivo, podendoi selecioná-lo diretamente.
meu_arquivo <- read_csv(file.choose())
# É possível ainda definir outros parâmetros como o valor do separador.
meu_arquivo <- read_delim(file.choose(), sep = "|")


# Importando arquivos. Os arquivos txt tem o seu campo separado apenas por um espaço simples.
# A função col_names, usada como parâmetro de read_table, aplica os nomes da lista às colunas.
df1 <- read_table("temperaturas.txt", 
                  col_names = c("DAY","MONTH","YEAR","TEMP"))

# Investigando os dados

# Lê os dez primeiros registros do dataframe
head(df1)

# Um resumo sobre a estrutura dos dados dos arquivos, como tipos de dados.
str(df1)

# resumo linha a linha do arquivo.
read_lines("temperaturas.txt", skip = 0, n_max = -1L)
read_file("temperaturas.txt")


# Exportando e Importando

# Exportando o arquivo irirs para o formato CSV dentro do diretório de trabalho.
write_csv(iris, "iris.csv")

# Verificando os arquivos do diretório de trabalho
dir()

# col_integer(): 
# col_double(): 
# col_logical(): 
# col_character(): 
# col_factor(): 
# col_skip(): 
# col_date() (alias = “D”), col_datetime() (alias = “T”), col_time() (“t”) 

# Importando um arquivo CSV alterando o tipo de informação contida em cada coluna
df_iris <- read_csv("iris.csv", col_types = list(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))

dim(df_iris)
str(df_iris)

# Importando
df_cad <- read_csv("cadastro.csv")
head(df_cad)


install.packages("dplyr")
library(dplyr)

#tbl_df permite alterações mais dinâmicas, voltadas para a memória
df_cad <- tbl_df(df_cad)
head(df_cad)
View(df_cad)

write.csv(df_cad, "df_cad_bkp.csv")


# Parsing - alterando o formato de data
parse_date("01/02/15", "%m/%d/%y")
parse_date("01/02/15", "%d/%m/%y")
parse_date("01/02/34", "%y/%m/%d")

# Alterando o local para adequação dos valores numéricos e outros pontos, como dias da semana, mês e ano.
locale("en")
locale("fr")
locale("pt")


# Projeto Big Memory - ajuda a trabalhar melhor com arquivos CSV mais robustos
# http://www.bigmemory.org           
install.packages("bigmemory")
library(bigmemory)
?bigmemory
bigdata <- read.big.matrix(filename = "cadastro.csv",
                           sep = ",",
                           header = TRUE,
                           skip = 1)



                   

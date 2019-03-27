# Exercícios

## Exercicio 1 - Encontre e faça a correção do erro na instrução abaixo:

write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = NA, qmethod = "double")

# Exercício 2 - Faça os ajustes necessários no código para que ele funcione corretamente. Use o pacote readr

# Instalação do pacote readr

install.packages("readr")
library(readr)

install.packages("tidyr")
library(tidyr)

install.packages("dplyr")
library(dplyr)

# Atribuindo iris a um outro data frame
iris_local <- iris
iris_local

# Exportando o arquivo em csv
write.csv(iris_local,"iris.csv")

# Fazendo a leitura do arquivo

df_iris <- read_csv("iris.csv", col_types = list(
    Sepal.Length = col_double(),
    Sepal.Width = col_double(),
    Petal.Length = col_double(),
    Petal.Width = col_double(),
    Species = col_factor(c("setosa", "versicolor","virginica"))
) # end col_types
) # end read_csv

df_iris %>% head(10)

# Exercício 3 - Corrija o código abaixo para que a importação funcione corretamente

install.packages("xlsx")
library(xlsx)

df_pop <- read.xlsx ("UrbanPop.xlsx", sheetIndex =1)
df_pop

# Exercício 4 - Encontre o erro e faça os ajustes necessários na instrução abaixo:

df_sono <- read_csv("http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte3/sono.csv")
sleepData <- select(df_sono, nome, sono_total)
df_sono %>% 
    select(nome, cidade, sono_total) %>%
    arrange (cidade, desc(sono_total)) %>%
    head(8)


# Exercicio 5 - Encontre e faça a correção do erro na instrução abaixo:

# Criando o data frame df3
set.seed(1)
df3 <- data.frame(
    participantes = c("p1","p2","p3","p4","p5","p6"),
    info = c("g1m","g1m","g1f","g2m","g2m","g2m"),
    day1score = rnorm (n=6,mean=80, sd=15),
    day2score = rnorm (n=6, mean=88, sd=8)
) #end data.frame
df3

install.packages("ggplot2")
library(ggplot2)

# Reformatando as informações para a mesma coluna com gather() e separando conteúdo com o mesmo padrão na coluna info, usando a função separate()
df3 %>%
    gather(day,score, c(day1score, day2score)) %>%
    separate (col = info, into = c("group", "gender"), sep=2) %>% 
# criar o gráfico com ggplot2
ggplot (aes(x=day, y=score)) +
geom_point() +
facet_wrap (~group) +
geom_smooth (method ="lm", aes(group =1), se = F)
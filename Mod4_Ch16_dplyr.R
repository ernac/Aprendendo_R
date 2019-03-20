# Transformação de Dados - dplyr

install.packages("readr")
library(readr)

install.packages("dplyr")
library(dplyr)

# Carregando o dataset para treinamento

df_sono <- read.csv("http://datascienceacademy.com.br/blog/aluno/RFundamentos/Datasets/Parte3/sono.csv")
df_sono
head(df_sono)
class(df_sono)
# tbldf é um df específico do dplyr
str(df_sono)

# Pacote dplyr: função glimpse
glimpse(df_sono)

# Usando mutate para criar uma nova coluna temporária
glimpse(mutate(df_sono, peso_libras = sono_total/0.4535))

# Contar a ocorrência de determinada observação
count(df_sono,cidade)

# Plotar histograma com a distribuição de frequência do sono
hist(df_sono$sono_total)

# Subsets - Função Select

sleepData <- select(df_sono, nome, sono_total)

# Avaliação dos dados
head(sleepData)
class(sleepData)

# Criando outros subsets

### Função Filter

# Retorna conjunto de dados baseado em condição


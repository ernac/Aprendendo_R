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

# Condição Simples

filter(df_sono, sono_total>=10)

# Condição Dupla
filter(df_sono, sono_total>=10, peso>=80)

# A função in - contido
filter(df_sono, cidade %in% c("Recife", "Curitiba"))

# Função arrange() - ordenar os dados
# Caracter de concatenamento: pipe %>%

# df_sono organizado pelo nome, concatenado com head
df_sono %>% arrange(nome) %>% head

# Organização em duas colunas: nome e sono_total também concatenados

df_sono %>% select(nome, cidade, sono_total) %>% arrange(nome, sono_total)

# select () +  arrange() + filter()

df_sono %>%
select(nome, cidade, sono_total) %>%
arrange(cidade, sono_total) %>%
filter(sono_total>=16)

# Arrange com ordem descrescent usando desc()

df_sono %>%
select(nome,cidade,sono_total) %>%
arrange (desc(sono_total)) %>% 
filter(sono_total>=16)

# mutate para criar uma coluna temporária

head(df_sono)
df_sono %>% 
mutate(novo_indice = sono_total/peso) %>% 
head
head(df_sono)

df_sono %>% 
mutate (novo_indice = sono_total/peso, peso_libras = peso/0.4535) %>%
head


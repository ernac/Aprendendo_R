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

# Função summarise() - Resumir os dados numa única linha

df_sono %>% 
summarise (media.sono = mean(sono_total))

df_sono %>% 
summarise (
media.sono = mean(sono_total), 
min.sono = min(sono_total),
max.sono = max(sono_total),
total = n()
)

# group by - agrupamento de dados

df_sono %>% 
group_by (cidade) %>% 
summarise (
media.sono = mean(sono_total), 
min.sono = min(sono_total),
max.sono = max(sono_total),
total = n()) %>% 
arrange (desc(total))

# Analisando os dados do pacote Flights

install.packages("hflights")
library(hflights)

# Criando objeto do tipo tbl - dataframe do dplyr

voos <- tbl_df(hflights)
voos

# Resumo de dados - exploração inicial

str(voos)
glimpse(voos)
data.frame(head(voos))

# Acessando ou filtrando - com colchetes e a função filter()

voos[voos$Month == 1 & voos$DayofMonth == 1,]
filter (voos, Month ==3, DayofMonth ==3)

# Filtros múltiplos

filter (voos, UniqueCarrier == "AA" | UniqueCarrier == "UA")
filter (voos, UniqueCarrier %in% c("UA", "AA"))

# Mais filtros mútiplos

select (voos, Year:DayofMonth, contains("Taxi"), contains ("Delay"))

# Usando operador concatenar para múltiplas visões

voos %>% 
select (UniqueCarrier, DepDelay) %>% 
arrange(DepDelay)

voos %>% 
select(Distance, AirTime) %>%
mutate (Speed =Distance/AirTime*60)

# Variações para head()

head(with( voos, tapply(ArrDelay, Dest, mean, na.rm = TRUE)))

# Agregate

head(aggregate (ArrDelay ~ Dest, voos, mean))

# Tally

voos %>% 
group_by (Month, DayofMonth) %>% 
tally (sort=T)
# tidyr
# Remodelagem dos dados como tabela dinâmica

install.packages("tidyr")
library(tidyr)
library(ggplot2)

# Criando base de dados para análise

df <- data.frame (
    nome = c("Game of Thrones", "Mr. Robot","Silicon Valley"),
    regiaoA = c(97,80,84),
    regiaoB = c(86,90,91)
)
df

df %>% 
gather(Regiao, NotaFinal, regiaoA:regiaoB)
?gather


# Criando base de dados

set.seed(20)
df2 <- data.frame (
    id = 1:4,
    acao = sample(rep(c('controle', 'tratamento'), each = 2)),
    work.t1 = runif(4),
    home.t1 = runif(4),
    work.t2 = runif(4),
    home.t2 = runif(4)
)

df2

# Reshape 1 - Transformando colunas em linhas com gather()

    df2_org1 <- df2 %>% 
        gather(key,time,-id,-acao)

    df2_org1 %>% head(8)

# Reshape 2 - Divindo uma coluna em duas através de separate()

df_org2 <- df2_org1 %>% 
    separate(key, into = c("localidade", "tempo"), sep="\\.")
df_org2 %>% head(8)

# Mais um exemplo: criando outra base de dados

df3 <- data.frame (
    participante = c("p1", "p2", "p3", "p4", "p5", "p6"),
    info = c("g1m", "g1m", "g1f", "g2m", "g2m", "g2m"),
    day1score = rnorm (n=6, mean=80, sd=15),
    day2score = rnorm (n=6, mean=88, sd=8)
)

print(df3)

# Reshape de Dados

# Colocando as notas numa mesma coluna usando gather()
df3 %>% 
    gather(day,score, c(day1score,day2score))



# Transformando colunas em linhas com spread() - processo inverso de gather. 
df3 %>% gather(day,score, c(day1score,day2score)) %>%
spread(day,score)

# Separando a coluna info em duas colunas a partir do segundo elemento usando a função separate()

df3 %>%
    gather(day,score, c(day1score,day2score)) %>% 
    separate(col=info, into=c("group","gender"), sep=2)


# Reverter a acão acima usando unite()

df3 %>%
    gather(day,score, c(day1score,day2score)) %>% 
    separate(col=info, into=c("group","gender"), sep=2) %>% 
    unite(infoAgain, group, gender)

# Usando gráficos no ggplot2

df3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  separate(col = info, into = c("group", "gender"), sep = 2) %>%
  ggplot(aes(x = day, y = score)) + 
  geom_point() + 
  facet_wrap(~ group) +
  geom_smooth(method = "lm", aes(group = 1), se = F)

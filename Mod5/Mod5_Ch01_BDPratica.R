# Big Data na Prática - Buscando Dados para Análise Financeira

# http://www.quantmod.com

# Instalar e carregar os pacotes

# Pacote de Análise Financeira
install.packages("quantmod")
# Pacote para análises temporais
install.packages("xts")
# Pacote para análises estatísticas de dados em séries temporais
install.packages("moments")

# Rodando os pacotes
library(quantmod)
library(xts)
library(moments)

# Análise de Dados Financeiros - Séries Temporais

# Selecionando o período de avaliação de dados passando para duas varíaveis - datas de cotações
startDate = as.Date("2019-01-01")
endDate = as.Date("2019-03-26")

# Usando função getSymbols() para conexão dos dados do Google ou Yahoo para coleta de dados financeiros

?getSymbols
# Coletando dados de ações da Petrobrás - PETR4.SA - fonte é o Yahoo, do período listado acima passado nos parâmetros
getSymbols("PETR4.SA", src="yahoo", from=startDate, to=endDate)

# Checar o tipo de dado retornado


# xts é um objeto de dados de séries temporais - coleção de dados gerados ao longo de um período. É um espécie de data.frame.
class(PETR4.SA)

# Confirmando que é um objeto de xts.
is.xts(PETR4.SA)

# Primeiros registros mostrados com head()
head(PETR4.SA)

# Fazendo um slice do data frame apenas com os dados referentes à coluna PETR4.SA.Close - os dados de fechamento

# Há dois modos de fazer o slice - usando o operador colchete ou usando a função Cl() do quantumod

# Usando o oeprador colchete

# Criando um novo data frame, atribuindo todas as linhas e apenas a coluna PETR4.SA.Close do data frame original.
PETR4.SA.Close <- PETR4.SA [,"PETR4.SA.Close"]
is.xts(PETR4.SA.Close) # confirmando se é um objeto do tipo xts
head(PETR4.SA.Close)

# Agora será plotado o gráfico candlechart do novo data frame

?candleChart
candleChart(PETR4.SA)

# Plot dos dados de fechamento do data frame PETR4.SA.Close

plot (PETR4.SA.Close, main="Fechamento Diário das Ações da Petrobrás",
    col="blue", xlab = "Data", ylab = "Preço",
    major.ticks = 'months',
    minor.ticks = FALSE)
)

# Adição de bandas de Bollinger ao gráfico, com média de 20 períodos e 2 desvios

# Bollinger Band

# Sendo o desvio padrão uma medida de volatibilidade, as Bandas de Bollinger ajustam-se às condições de mercado. Portanto, mercados mais voláteis possuem as bandas mais distantes da média, enquanto mercados menos voláteis são próximos da média.

?addBBands
addBBands(n=20,sd=2)

# Adição de indicador ADX, média 11, do tipo exponencial
?addADX
addADX (n=11, maType="EMA")

# Cálculo de logs diários
PETR4.SA.ret <- diff(log(PETR4.SA.Close), lag=1)


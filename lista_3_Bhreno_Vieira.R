####################################################################################
#######################   Universidade Federal de Pernambuco #######################
#######################    Departamento de Ci�ncia Pol�tica  #######################
#######################             Mestrado 2019            #######################
#######################           An�lise de Dados           #######################
#######################            Bhreno Vieira             #######################
#######################               Lista 3                #######################


#### Quest�o 1 ####

#### Quest�o 2 ####

# Declare duas vari�veis (x e y) e valores n�meros maiores que 1 a elas: 

x <- 13

y <- 12

# Confirmando o valor de x e y

x

y

# O resultado da soma seja "z"

z <- x + y

# confirindo o resultado

z

# multiplique o valor de z pelo n� do seu CPF

w <- z * 07567034417

# confirmando o resultado

w

# Resultados
# x = 13, y= 12
# x + y = z 
# 13 + 12 = 25
# w = z * cpf
# w = 189175860425

#### Quest�o 3 ####

# solicitando a base de dados mtcars

head(mtcars)

# visualizando a base mtcars

View(mtcars)

# solicitando os nomes das vari�veis para indificar as colunas do Banco

names(mtcars)

# tipos de vari�veis da base

class(mtcars)

class(mtcars$mpg)
class(mtcars$cyl)
class(mtcars$disp)
class(mtcars$hp)
class(mtcars$drat)
class(mtcars$wt) 
class(mtcars$qsec) 
class(mtcars$vs)
class(mtcars$am)
class(mtcars$gear)
class(mtcars$carb)

## Todas as vari�veis do banco s�o n�mericas. 

# n�mero de dimens�es

dim(mtcars)

# 32 11

# imprimir a 3� coluna

mtcars[, "disp"]

# imprimir a 2� linha

mtcars[, "cyl"]

mtcars["Mazda RX4 Wag",]

# o 4� elemento presente na vari�vel "cyl"

mtcars["Hornet 4 Drive","cyl"]

# resumo descritivo da base

summary(mtcars)

#### Quest�o 4 ####

## use o pacote ffbase para carregar a base de dados "TURMAS.csv"

# primeiro, tenho que instalar o pacote "ffbase"

install.packages("ffbase", dependencies = TRUE)

# solicito o pacote

require(ffbase)

# Ap�s isso,tendo mostrar ao R qual o diret�rio est� sendo utilizado, pergunto onde posso encontrar os dados: 

getwd()

# ap�s isso, indico o caminho: 

setwd("C:/Users/Bhr/Documents/dados_encontro_1_ufpe_certo")

# solicito a abertura dos dados:

turmas <- read.csv2.ffdf(file = "TURMAS.csv", sep = "|")

# conhecendo as dimens�es da base: 

dim(turmas)

# verificando o nome das 10 primeiras colunas: 

names(turmas)[1:10]

# verificando as 6 primeiras linhas da base de dados

head(turmas[, 1:5])

# um resumo de informa��es

summary(turmas)


## filtre os registros referentes ao Estado de Pernambuco (CO_UF == "26")

turmas_pe <- subset(turmas, CO_UF == "26")

#conhecendo a nova base formada

dim(turmas_pe)

head(turmas_pe[, 1:5])

## Transforme em data.frame a base "turmas_pe"

turmas_pe <- as.data.frame(turmas_pe)

## salve a base em formato R.Data

getwd()

save(turmas_pe, file = "turmas_pe_censo_escolar_2016.RData")

#### Quest�o 5 ####

# carregue a base de dados referentes a turmas do Estado de Pernambuco

head(turmas_pe[, 1:5])

names(turmas_pe)

# apresente a m�dia do n�mero de matr�cula por turma

mean(turmas_pe$NU_MATRICULAS)

# M�dia: 23.07089

summary(turmas_pe$NU_MATRICULAS)


#### Quest�o 6 ####

### Etapa I: pr�-processamento dos dados

getwd()

docentes_ne <- read.csv2.ffdf(file = "DOCENTES_NORDESTE.csv", sep = "|", 
                              first.rows=100000)

# conhecendo a base "docentes_ne"

dim(docentes_ne)

head(docentes_ne[, 1:5])

# filtre os registros referentes ao Estado de Pernambuco (CO_UF == "26")

docentes_pe <- subset(docentes_ne, CO_UF == "26")

# transformando em data.frame e salvando em formato RData.

docentes_pe <- as.data.frame(docentes_pe)

getwd()

save(docentes_pe, file = "docentes_pe_censo_escolar_2016.RData")

# conhecendo a nova base

dim(docentes_pe)

names(docentes_pe)

### Etapa II: Qual o percentual de docentes do PE que n�o declaram cor ou ra�a?

table(docentes_pe$TP_COR_RACA)

prop.table(table(docentes_pe$TP_COR_RACA))*100

plot(prop.table(table(docentes_pe$TP_COR_RACA))*100)

# elaborando um gr�fico

require(tidyverse)

ggplot(docentes_pe, aes(prop.table(docentes_pe$TP_COR_RACA)*100))+geom_bar()

# Resposta: cerca de 44% dos docentes n�o declararam sua cor. 

### Etapa III: Qual o percentual de docentes que se declaram pretos ou pardos? 

prop.table(table(docentes_pe$TP_COR_RACA))*100

# Apenas 3,5% dos docentes se declaram "pretos" e 27,79% se declaram "pardos". 

# A soma da porcetagem de pretos e pardos

3.5+27.79

# Resultado da porcetagem de pretos e pardos: 31,29%



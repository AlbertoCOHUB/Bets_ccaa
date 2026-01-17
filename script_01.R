getwd() # saber directorio de trabajo 
setwd("C:/Users/alber/alber/Documents/Bets_ccaa") # ojo con la ruta / o \\

#dia 2 manejo_datos con funciones
library(tidyverse)
library(dplyr)
library(swirlify)
library(sf)
library(spData)
library(patchwork)  

str(apuestas)
glimpse(apuestas)
View(apuestas)
summary(apuestas)

cols_num <- c("AREA", "HABS", "h_km2", "Poder_Comp", 
              "PIB_pc", "salones", "h_salon")

apuestas[cols_num] <- lapply(apuestas[cols_num], function(x) {
  as.numeric(gsub(",", "", x))
})

str(apuestas)


apuestas <- read.csv("apuestas.csv", stringsAsFactors = FALSE)
str(apuestas)


apuestas <- apuestas %>%
  rename(
    Area_km2 = AREA,
    Habitantes = HABS,
    Habitantes_km2 = h_km2,
    Poder_Compra = Poder_Comp,
    PIB_per_capita = PIB_pc,
    Salones_juego = salones,
    Habitantes_por_salon = h_salon
  )

ggplot(data = apuestas) +
  geom_sf(aes(fill = Habitantes_por_salon)) +
  scale_fill_viridis_c(option = "plasma)
  )
  
  class(apuestas)
# debe devolver "sf" "data.frame"

ggplot(data = apuestas) + 
  geom_sf(aes(fill = salones )) +
  scale_fill_viridis_c(option = "plasma")
  
apuestas <- read.csv("apuestas.csv", stringsAsFactors = FALSE)

getwd()
setwd("C:/Users/alber/alber/Documents/Bets_ccaa") # ojo con la ruta / o \\

str(apuestas)
glimpse(apuestas)
View(apuestas)
summary(apuestas)

# Gráfico de dispersión bidimensional básico
# Aquí necesitamos especificar tanto el eje X como el eje Y
ggplot(apuestas,aes(x = Poder_Compra, y = Salones_juego)) +
  geom_point()
  geom_smooth(method = "lm", se = FALSE)

# Con banda de confianza
ggplot(apuestas, aes(x = Poder_Compra, y = Salones_juego)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE)

ggplot(apuestas, aes(x = Poder_Compra, y = Salones_juego)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Relación entre poder de compra y salones de juego",
    x = "Poder de compra",
    y = "Número de salones de juego"
  )
# funciona bien, muestra el desglose de la correlacion por CCAA
ggplot(apuestas, aes(x = Poder_Compra, y = Salones_juego)) +
  geom_point() +
  geom_smooth(method = "loess", se = FALSE) +
  facet_wrap(~ CCAA)
  labs(
    title = "Relación entre poder de compra y salones de juego",
    x = "Poder de compra",
    y = "Número de salones de juego"
  )





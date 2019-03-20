#Matrices y dataframes
#Vinicio SOsa Ecological Statistics Contemporary theory and aplication

matriz <- matrix(seq(1,9), nrow=3,ncol=3, byrow=FALSE)
matriz2 <- matrix(seq(1,9), nrow=3,ncol=3, byrow=FALSE)
matriz

#Dataframe
numeros <- c(1,2,3)
texto <- c("hola","como","estas")
booleanos <- c(TRUE, FALSE, TRUE)


df <- data.frame(numeros, texto, booleanos)
#df <- data.frame(numeros, texto, booleanos, byrow=TRUE)  interesante

matriz[1:2,1:2]
matriz[2,3]
matriz[2:3,2:3]+111
matriz[c(1,3),c(1,3)]+111

df[1:2,1:2]
df[2,3]
df[2:3,2:3]+111 #error

#condiciones para la seleccionde elementos
10>5
matriz>3
matriz[matriz>3]
matriz[matriz>3] <- 999
matriz
#library("raster")

matriz_r <- raster(matriz2)
matriz_r
plot(matriz_r)
points(0.25,0.75,pch=21,bg="red",cex=2)
raster_nuevo = matriz_r - 3.0*(matriz_r)

install.packages("ggplot2")
install.packages("rasterVis")

library("ggplot2")
library("rasterVis")


gplot(matriz_r) + geom_tile(aes(fill=values(matriz_r))) + scale_colour_brewer(palette="Blues") + coord_equal() + geom_text(aes(label=sprintf("%02.0f",values(matriz_r))),color="white",size=5)

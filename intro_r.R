## ----setup, include=FALSE-----------------------------------------------------
knitr::knit_hooks$set(purl = knitr::hook_purl)
knitr::opts_chunk$set(echo = TRUE)

## ----basic_commands-----------------------------------------------------------
3 + 4
3 - 7
2 * 20
4/2
10^3
sqrt(10)

## ----comparisons--------------------------------------------------------------
3 < 5
3 > 5
3 <= 5 
3 >= 5
3 == 5     # Attention: double equal sign
3 != 5

## ----assignment---------------------------------------------------------------
x <- 3
y = 4
5 -> z # works, but not recommended

## ----atomic_vectors-----------------------------------------------------------
pyth_triple <- c(x, y, z)
?c
# indexing
pyth_triple[pyth_triple >= 4]

## ----factors------------------------------------------------------------------
x1 <- c("Dec", "Apr", "Jan", "Mar")
x2 <- c("Dec", "Apr", "Jam", "Mar")
sort(x1)
month_levels <- c(
  "Jan", "Feb", "Mar", "Apr", "May", "Jun", 
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
)
y1 <- factor(x1, levels = month_levels)
y2 <- factor(x2, levels = month_levels)
sort(y1)

## ----sequences----------------------------------------------------------------
seq_incr <- seq(1, 5, by = 1)
seq_decr <- 10^seq(4, 0, by = -1)

## ----matrices-----------------------------------------------------------------
mat <- matrix(0, nrow = 5, ncol = 5)
diag(mat) <- c(rep(1, 2), rep(4, 3))

## ----data_frames--------------------------------------------------------------
v_char <- paste0("char", seq(1, 10, 1))
v_num <- seq(0.01, 0.1, length.out = 10)
v_bool <- c(rep(TRUE, 4), rep(FALSE, 6))
df <- data.frame(col1 = v_char,
                 col2 = v_num,
                 col3 = v_bool)
df$col1[df$col3] #indexing
df$col2[df$col2 > 0.05]

## ----lists--------------------------------------------------------------------
my_list <- list(matrix = mat, 
                vector = pyth_triple, 
                fact = y2, 
                bool = TRUE)

## ----installation, eval = FALSE-----------------------------------------------
#  install.packages("tidyverse")
#  remotes::install_github("tidyverse/tidyverse")

## ----load_packages------------------------------------------------------------
library(tidyverse)
citation("tidyverse")

## ----help_packages------------------------------------------------------------
help(package = "tidyverse")

## ----data_import--------------------------------------------------------------
?read.table

path1 <- file.path("cereal", "cereal_1.txt")
path2 <- file.path("cereal", "cereal_2.txt")
path3 <- file.path("cereal", "cereal_3.csv")
path4 <- file.path("cereal", "cereal_4.csv")

cereal1 <- read.table(path1, header = T)
cereal2 <- read.table(path2)
cereal3 <- read.csv(path3, header = T)
cereal4 <- read.csv2(path4, header = T)

head(cereal1) # look at data

## ----data_proc----------------------------------------------------------------
cereal_new <- cereal2[,2:4]
colnames(cereal_new) <- c("Sodium", "Sugar", "Type")

cereal_new[5,2] <- NA
mean(cereal_new[,2])
cereal_new <- na.omit(cereal_new)
mean(cereal_new[,2])

cereal_new$Desc <- paste(cereal_new$Sugar, cereal_new$Type)

## ----data_exp-----------------------------------------------------------------
?write.table

write.csv(cereal_new, file = file.path("cereal", "cereal_mod.csv"))

save(cereal_new, file = file.path("cereal", "cereal_mod.Rdata"))
load(file = file.path("cereal", "cereal_mod.Rdata"))

## ----basic_plots--------------------------------------------------------------
plot(df$col2, df$col2^2, 
     type = "l", 
     lty = 1, 
     col = 2,
     xlab = "x", ylab = expression(x^2))
points(df$col2, df$col2^2, 
       pch = 19)
abline(v = 0.05, lty = 2)
abline(h = 0.0025, lty = 3)
abline(coef = c(0, 0.1), col = 4)

## ----bar_plot-----------------------------------------------------------------
barplot(df$col2, 
        names.arg = df$col1, 
        cex.names = 0.9,
        col = c(rep(8, 3), rep(7, 2), 1:5))

## ----histogram----------------------------------------------------------------
hist(c(1, 1, 1, 1, 2, 3, 2, 2, 3, 4, 5, 5, 5), 
     breaks = 4,
     main = "Example for histogram",
     xlab = "Numbers",
     col = 4, lty = 2)

## -----------------------------------------------------------------------------
pairs(cereal_new[,1:2])

## ----plots_export-------------------------------------------------------------


## ----ggplots------------------------------------------------------------------
library(ggplot2)
library(RColorBrewer)
ggplot(data = df,
       aes(x = col2, y = col2^2)) + 
  geom_line() +
  geom_point(aes(col = col3)) +
  xlab("x") + ylab(expression(x^2)) +
  labs(col = "Is it right?") +
  scale_color_brewer(palette = "Set1") +
  theme_grey()

## ----if_else------------------------------------------------------------------
if (3 > 5) {
  print("That's true!") 
  } else {
  print("That's false")
  }

## ----loops--------------------------------------------------------------------
for (i in 1:3){
  print(paste("count:", i))
}

j <- 0
while (j < 4){
  print(j)
  j <- j + 1
}

## ----functions----------------------------------------------------------------
my_plot <- function(x, y, color, linetype) {
  plot(x, y, type = "l", col = color, lty = linetype)
}

my_plot(df$col2, df$col2^2, 5, 2)


library(tidyverse)
library(wesanderson)

#math function for twinning
twinning <- function(x, N){ 1 - (1-x)^N}


x1 <- 0.013
p1 <- 0:5

df1 <- data.frame(Pregnancies = p1, Twins = twinning(x1,p1), Rate = x1, P=5)

x2 <- 0.045
p1 <- 0:5

df2 <- data.frame(Pregnancies = p1, Twins = twinning(x2,p1), Rate = x2, P=5)

x1 <- 0.013
p2 <- 0:11

df1b <- data.frame(Pregnancies = p2, Twins = twinning(x1,p2), Rate = x1, P=11)

x2 <- 0.045
p2 <- 0:11

df2b <- data.frame(Pregnancies = p2, Twins = twinning(x2,p2), Rate = x2, P = 11)

df <- rbind(df1, df2, df1b, df2b)

p1 <- ggplot(data = df, aes(x = Pregnancies, y = Twins, linetype = factor(Rate), color = factor(Rate))) +
  labs(x = "Number of pregnancies", y = "Probability of at least one twin-birth")+
  geom_segment(aes(x = -1, y = twinning(x2, 10), xend = 10, yend = twinning(x2, 10)), linetype = "dashed", size = 1,color="grey30") + # high twinning - high fertility
  geom_segment(aes(x = -1, y = twinning(x1, 2), xend = 2, yend = twinning(x1, 2)), linetype = "dashed", size = 1,color="grey30")+   # low twinning - low fertility  
  geom_line() + 
  scale_linetype_manual(values = c("solid", "solid"), guide = "none")+  
  scale_color_manual(values = wes_palette("Zissou1",5)[c(1,5)], guide = "none")+
  geom_point() +
  coord_cartesian(xlim = c(0,11))+
  geom_point(x = -0.49, y = twinning(x1, 2), color = wes_palette("Zissou1",5)[1]) +
  geom_point(x = -0.49, y = twinning(x2, 10), color = wes_palette("Zissou1",5)[5]) +
  theme_classic()
p1


p1 <- ggplot(data = df, aes(x = Pregnancies, y = Twins, linetype = factor(Rate), color = factor(Rate))) +
  labs(x = "Number of pregnancies", y = "Probability of at least one twin-birth")+
  geom_segment(aes(x = -1, y = twinning(x2, 10), xend = 10, yend = twinning(x2, 10)), linetype = "dashed", size = 1, color = "grey30") + # high twinning - high fertility
  geom_segment(aes(x = -1, y = twinning(x1, 2), xend = 2, yend = twinning(x1, 2)), linetype = "dashed", size = 1, color = "grey30")+   # low twinning - low fertility  
  geom_line() + 
  scale_linetype_manual(values = c("solid", "solid"), guide = "none")+  
  scale_color_manual(values = wes_palette("Zissou1",5)[c(1,5)], guide = "none")+
  geom_point() +
  coord_cartesian(xlim = c(0,11))+
  geom_point(x = -0.49, y = twinning(x1, 2), color = wes_palette("Zissou1",5)[1]) +
  geom_point(x = -0.49, y = twinning(x2, 10), color = wes_palette("Zissou1",5)[5]) +
  theme_classic()
p1

ggsave("TwinModel.pdf",p1, width=4.5,height=3.5)

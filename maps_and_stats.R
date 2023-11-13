library(tidyverse)
library(sf)
library(imager)
library(wesanderson)
library(readxl)
library(cowplot)

#import csv containing twinning rates in Africa (from Smits & Monden, 2011)
worldgovt <- read_csv("twinning_rates_africa.csv")

#construct empty twinship columns for the loop
worldgovt$twin_love <- worldgovt$twin_neut <- worldgovt$twin_kill <- worldgovt$twin_sum <- NA

#loop over with the pixels
for(i in 1:39){
  kill = load.image("Base_Kill.jpg")
  kill2 = RGBtoHSV(kill)
  kill_set = round(kill2[,,1],0)
  
  
  base = load.image(paste0("Base_",i,".jpg"))
  base2 = RGBtoHSV(base)
  rb2 = round(base2[,,1],0)
  
  
  test = ifelse(rb2 %in% c(215:235),1,0)
  kill2[,,3] = test
  kill3 = HSVtoRGB(kill2)
  plot(kill3)
  
  
  country_set = kill_set[which(test==1)]
  
  worldgovt$twin_kill[i] = length(country_set[which(country_set %in% c(50:70))])
  worldgovt$twin_love[i] = length(country_set[which(country_set %in% c(290:310))])
  worldgovt$twin_neut[i] = length(country_set[which(country_set %in% c(170:190))])
  worldgovt$twin_sum[i] = worldgovt$twin_kill[i] + worldgovt$twin_love[i] + worldgovt$twin_neut[i]
  
  #invisible(readline(prompt="Press [enter] to continue"))
  
  
}


########## MAPS

#shapefile name
world_shp <- "world-administrative-boundaries.shp"

#read world shapefile into sf object
world_df <- st_read(world_shp)

#select african continent
africa_df <- world_df %>% 
  filter(continent == "Africa")

#twin rate dataframe
twin_df <- worldgovt %>% 
  rename(name = region) %>% 
  mutate(LoveHateRatio = twin_love / (twin_love + twin_kill + twin_neut) )

#merge spatial and twin data
africa <- left_join(africa_df, twin_df, by = "name")

#retrieve global twinning data
world_data <- read_excel("world_list_data.xlsx")

#merge with global spatial data
world <- left_join(world_df, world_data, by = "name") %>% 
  relocate(name, standard_twin) %>% 
  mutate(standard_twin = as.numeric(standard_twin))

#plot africa geminophilia
africa_twinship <- ggplot(data = africa)+
  geom_sf(aes(fill = LoveHateRatio), color = "NA")+
  scale_fill_gradientn(colours = wes_palette("Zissou1", type = "continuous"))+
  labs(fill = "Geminophilia \n index")+
  theme_classic()+
  theme(axis.title = element_blank(), 
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.background = element_blank(),
        complete = TRUE)

#plot african twinning rates
africa_twinning <- ggplot(data = africa)+
  geom_sf(aes(fill = StandardTwin), color = "NA")+
  scale_fill_gradientn(colours = wes_palette("Zissou1", type = "continuous"),
                       limits = c(min(world$standard_twin, na.rm = TRUE), 
                                  max(world$standard_twin, na.rm = TRUE)),
                       oob = scales::squish)+
  labs(fill = "Standardized \n twinning rate")+
  theme_classic()+
  theme(axis.title = element_blank(), 
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.background = element_blank(),
        complete = TRUE)

#plot global rates
world_plot <- ggplot(world)+
  geom_sf(aes(fill = standard_twin), color = "NA")+
  scale_fill_gradientn(colours = wes_palette("Zissou1", type = "continuous"))+
  labs(fill = "Standardized \n twinning rate")+
  theme(axis.title = element_blank(), 
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.background = element_blank(),
        complete = TRUE)

#plot grid of africa maps
africa_grid <- plot_grid(africa_twinning, africa_twinship,
                         labels = c('B', 'C'))

#plot grid everything
plot_grid(world_plot, africa_grid,
          nrow = 2,
          labels = c("A", ""))

######### ANALYSIS

#full sample
m1 <- lm(StandardTwin ~ LoveHateRatio, data = twin_df)
summary(m1) #regression summary
confint(m1) #confidence interval

#restricted sample
subset_twin <- twin_df %>% 
  mutate(neutral_ratio = twin_neut/twin_sum) %>% 
  mutate(LoveHateRatio = twin_love / (twin_love + twin_kill + twin_neut) ) %>% 
  relocate(name, neutral_ratio) %>% 
  filter(neutral_ratio < 0.9)
m2 <- lm(StandardTwin ~ LoveHateRatio, data = subset_twin)
coef(m2)
confint(m2)
summary(m2)

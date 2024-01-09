# Data and code for *The Evolutionary Puzzle of Human Twinship*.

This repository contains the data and code used to generate the plots and maps in the manuscript *The Evolutionary Puzzle of Human Twinship*.

Citation (pre-print): Dalla Ragione, A., Ross C.T., and Redhead, D. (2023). The Evolutionary Puzzle of Human Twinship. DOI: [doi.org/10.32942/X2QP5X](https://doi.org/10.32942/X2QP5X). EcoEvoRxiv.

Authors, contact, affiliation:
- Augusto Dalla Ragione, augusto_dalla_ragione@eva.mpg.de, Max Planck Institute for Evolutionary Anthropology
- Cody T. Ross, cody_ross@eva.mpg.de, Max Planck Institute for Evolutionary Anthropology
- Daniel Redhead, daniel_redhead@eva.mpg.de, Max Planck Institute for Evolutionary Anthropology; University of Groningen

## Files description

The repository contains two R scripts, a ZIP file containing 40 JPGs representing African countries and used to construct an index of geminophilia, a csv file with standardized twinning rates of African countries, an xlsx file with standardized global twinning rates, and a global country-level spatial dataset compressed in ZIP format.

### images.zip

ZIP file containing 40 JPGs used in the maps_and_stats R script to generate the geminophilia index displayed in Figure 1C in the manuscript and used for regression analysis with twinning rates data.
The JPGs were scraped from Figure 4 in Fenske and Wang (2023). *Tradition and Mortality: Evidence from Twin Infanticide in Africa*. Journal of Development Economics. https://doi.org/10.1016/j.jdeveco.2023.103094, which is distributed under a [CC BY 4.0 DEED](https://creativecommons.org/licenses/by/4.0/) license, allowing adaptation and transformation of the content. The grey-scale shading in Figure 4 in Fenske and Wang (2023) was converted to color, so that the percentage of land-area representing groups with different twinship norms could be automatically calcuated using pixel-counting. We use the same 3-category coding scheme used by Fenske and Wang (2023), but we compute country-level summaries to match twin-rate data released by Smits and Monden (2011).
The original figure is a map representing areas of the African continent mainly inhabited by ethnic groups practicing twin infanticide, with information retrieved from Murdock (1959). Africa: Its People and their Culture History.

### world-administrative-boundaries.zip

Compressed spatial dataset of global administrative boundaries at the country-level. 
Retrieved from [Datasoft](https://public.opendatasoft.com/explore/dataset/world-administrative-boundaries/information/) and distributed under [Open Government License v3.0](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/).
The spatial dataset is in shapefile format and includes 4 files with different extensions that need to be stored in the same directory: .dbf (attributes), .prj (projection), .shx (shapefile index), and .shp (shapefile).

### twin_rate_data.csv

Data on standardized twinning rates of African countries, used to generate the regression results shown in the caption of Figure 1.
The data are openly available in Smits and Monden (2011). *Twinning across the Developing World*. PLoS ONE 6(9): e25239. https://doi.org/10.1371/journal.pone.0025239. 

### world_list_data.xlsx

Data on standardized twinning rates at the global level, used to construct the maps of the distribution of twinning rates at the global level and at the African level, in Figure 1.
The information in twin_rate_data.csv is a subset of the information contained in world_list_data.xlsx.
Data come from Smits and Monden (2011). Twinning across the Developing World. PLoS ONE 6(9): e25239. https://doi.org/10.1371/journal.pone.0025239. 

### maps_and_stats.R

maps_and_stats.R contains the code to generate Figure 1 in the manuscript, as well as the regression analysis included there.
To do so, it needs to import the files world_list_data.xlsx and twin_rate_data.csv, as well as all the JPGs and the spatial data files (shapefile). 

### pregnancy_plot.R

pregnancy_plot.R generates Figure 3, located in Box 3 of the manuscript.
It defines a mathematical function for the probability of ever giving birth to twins conditional on twinning propensity $x$ and number of pregnancies $P$, $\mathrm{Pr}(T|x,P) = 1 - (1-x)^P$, and plots it for different $P$ and $x$ parameter values.




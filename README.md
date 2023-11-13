# Data and code for *The Evolutionary Puzzle of Human Twinship*.

This repository contains the data and code used to generate the plots and maps in *The evolutionary puzzle of human twinship*.

Citation (pre-print): Dalla Ragione, A., Ross C.T., and Redhead, D. (2023). The Evolutionary Puzzle of Human Twinship. DOI: (doi here). EcoEvoRxiv.

Authors, contact, affiliation:
- Augusto Dalla Ragione, augusto_dalla_ragione@eva.mpg.de, Max Planck Institute for Evolutionary Anthropology
- Cody T. Ross, cody_ross@eva.mpg.de, Max Planck Institute for Evolutionary Anthropology
- Daniel Redhead, daniel_redhead@eva.mpg.de, Max Planck Institute for Evolutionary Anthropology

## Files description

The repository contains two R scripts, a series of 40 JPGs representing African countries, a csv file with standardized twinning rates of African countries, an xlsx file with standardized global twinning rates, and a shapefile of [world administrative boundaries](https://public.opendatasoft.com/explore/dataset/world-administrative-boundaries/information/) from Datasoft, distributed under [Open Government License v3.0](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/).

### JPGs

### world_administrative_boundaries

Spatial dataset including global administrative boundaries at the country-level. 
Retrieved from [Datasoft](https://public.opendatasoft.com/explore/dataset/world-administrative-boundaries/information/) and distributed under [Open Government License v3.0](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/).
The spatial dataset is in shapefile format and is composed of 4 files with different extensions that need to be stored in the same directory: dbf (attributes), prj (projection), shx (shapefile index), and shp (shapefile).
{{code|.shp}}

### twin_rate_data.csv and world_list_data.xlsx

Data on standardized twinning rates of African countries (twin_rate_data.csv) and at the global level (world_list_data.xlsx).
The data come from Smits J, Monden C (2011) Twinning across the Developing World. PLoS ONE 6(9): e25239. https://doi.org/10.1371/journal.pone.0025239. 

### maps_and_stats.R

maps_and_stats.R contains the code to generate Figure 1 in the manuscript, as well as the regression analysis included there.
To do so, it needs to import the files world_list_data.xlsx and twin_rate_data.csv, as well as all the JPGs and the spatial data files (shapefile). 

### pregnancy_plot.R

pregnancy_plot.R generates Figure 3, located in Box 3 of the manuscript.





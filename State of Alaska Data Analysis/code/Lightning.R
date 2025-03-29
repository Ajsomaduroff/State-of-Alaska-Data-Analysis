# PURPOSE #####################################################################
# Analyst: Austin Somaduroff
# Project: State of Alaska Data Analysis
# Title: Lightning.R

# README ######################################################################

# Analysis of State of Alaska Lightning data from 2012 through ...

# SETUP #######################################################################

library(tidyverse)
library(sf)
library(jsonlite)

# IMPORT ######################################################################

lightning_sf <- read_sf('data/Lightning/Historical_Lightning_Points_2012_forward_geojson/TOALightningPoints_2012_2024_WGS84.geojson')

# REVIEW ######################################################################

# CLEAN / MUTATE ##############################################################

lightning_sf_clean <- lightning_sf |> 
  janitor::clean_names() |> 
  mutate(utcdatetime = as_datetime(utcdatetime),
         localdatetime = as_datetime(localdatetime))
  

## Add New Fields =============================================================

## Remove Error Records =======================================================

## Replace NA Values ==========================================================

# ANALYZE #####################################################################

## Test Plot ==================================================================

lightning_sf |> 
  filter(STROKETYPE == 'GROUND_STROKE') |> 
  ggplot(geom_)
  

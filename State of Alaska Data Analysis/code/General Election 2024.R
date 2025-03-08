# PURPOSE #####################################################################
# Analyst: Austin Somaduroff
# Project: State of Alaska Data Analysis
# Title: General Election 2024.R

# README ######################################################################

# I'm using this area to learn about the General Election Data available from
# the State of Alaska, Division of Elections website.

# The files are JSON.



# SETUP #######################################################################

library(tidyverse)
library(jsonlite)

# IMPORT ######################################################################

files_and_paths <- tibble(
  filenames = list.files(path = 'data/General Election 2024/CVR_Export_20241130154411/'),
  filepaths = list.files(path = 'data/General Election 2024/CVR_Export_20241130154411/',
                         full.names = TRUE)) |> 
  mutate(cvr = str_detect(filenames, pattern = 'Cvr'))





cvr_test <- fromJSON(txt = 'data/General Election 2024/CVR_Export_20241130154411/CvrExport_100.json')

ballot_type_contest_manifest <- fromJSON('data/General Election 2024/CVR_Export_20241130154411/BallotTypeContestManifest.json') |> 
  as.data.frame()

files_and_paths$filenames
files_and_paths$filepaths

f_json_to_df <- function(x) {
  x$filename <- as.data.frame(fromJSON(txt = toString(x$filepaths)))
}

f_json_to_df_test <- function(x) {
  
  for (item in x) {
    
    x$filenames <- x$filepaths
    
  }
  
}



files_and_paths |>
  filter(!cvr) |> 
  f_json_to_df_test()


files_and_paths |> 
  filter(!cvr) |> 
  slice_head(n = 1) |> 
  select(filepaths) |> 
  toString() |> 
  fromJSON()

files_and_paths |> 
  filter(!cvr) |> 
  f_json_to_df()

# REVIEW ######################################################################

# CLEAN / MUTATE ##############################################################

## Add New Fields =============================================================

## Remove Error Records =======================================================

## Replace NA Values ==========================================================

# ANALYZE #####################################################################

## First Thing ================================================================

## Second Thing ===============================================================

### First part of second thing ------------------------------------------------
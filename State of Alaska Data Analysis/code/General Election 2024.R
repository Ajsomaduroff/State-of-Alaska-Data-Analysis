# PURPOSE #####################################################################
# Analyst: Austin Somaduroff
# Project: State of Alaska Data Analysis
# Title: General Election 2024.R

# README ######################################################################

# I'm using this area to learn about the General Election Data available from
# the State of Alaska, Division of Elections website.

# The files are JSON.

# CVR - Cast Vote Record



# SETUP #######################################################################

library(tidyverse)
library(jsonlite)

# IMPORT ######################################################################

files_and_paths <- tibble(
  filenames = list.files(path = 'data/General Election 2024/CVR_Export_20241130154411/'),
  filepaths = list.files(path = 'data/General Election 2024/CVR_Export_20241130154411/',
                         full.names = TRUE)) |> 
  mutate(cvr = str_detect(filenames, pattern = 'Cvr'))

file_list <- list.files(path = 'data/General Election 2024/CVR_Export_20241130154411/', pattern = 'CvrExport', full.names = TRUE)

small_file_list <- file_list[1]

cvr <- fromJSON(txt = 'data/General Election 2024/CVR_Export_20241130154411/CvrExport_100.json') |> 
  as.data.frame()

df_list <- lapply(small_file_list, function(f) fromJSON(txt = f))

df <- bind_rows(df_list) |> 
  as.data.frame() |> 
  janitor::clean_names() 

df_unnested <- df |> 
  unnest(sessions) |>
  janitor::clean_names() |> 
  unnest(original) |> 
  janitor::clean_names() |> 
  unnest(cards) |> 
  janitor::clean_names() |> 
  unnest(contests) |> 
  janitor::clean_names() |> 
  unnest(marks) |> 
  

cvr_100 <- fromJSON(txt = 'data/General Election 2024/CVR_Export_20241130154411/CvrExport_100.json')

ballot_type_contest_manifest <- fromJSON('data/General Election 2024/CVR_Export_20241130154411/BallotTypeContestManifest.json') |> 
  as.data.frame()

ballot_type_manifest <- fromJSON ('data/General Election 2024/CVR_Export_20241130154411/BallotTypeManifest.json') |> 
  as.data.frame()

candidate_manifest <- fromJSON('data/General Election 2024/CVR_Export_20241130154411/CandidateManifest.json') |>
  as.data.frame()

configuration <- fromJSON('data/General Election 2024/CVR_Export_20241130154411/Configuration.json') |> 
  as.data.frame()

contest_manifest <- fromJSON('data/General Election 2024/CVR_Export_20241130154411/ContestManifest.json') |> 
  as.data.frame()

counting_group_manifest <- fromJSON('data/General Election 2024/CVR_Export_20241130154411/CountingGroupManifest.json') |> 
  as.data.frame()

district_manifest <- fromJSON('data/General Election 2024/CVR_Export_20241130154411/DistrictManifest.json') |> 
  as.data.frame()

district_precinct_portion_manifest <- fromJSON('data/General Election 2024/CVR_Export_20241130154411/DistrictPrecinctPortionManifest.json') |> 
  as.data.frame()

election_event_manifest <- fromJSON('data/General Election 2024/CVR_Export_20241130154411/ElectionEventManifest.json') |> 
  as.data.frame()

outstack_condition_manifest <- fromJSON('data/General Election 2024/CVR_Export_20241130154411/OutstackConditionManifest.json') |> 
  as.data.frame()

party_manifest <- fromJSON('data/General Election 2024/CVR_Export_20241130154411/PartyManifest.json') |> 
  as.data.frame()

precinct_manifest <- fromJSON('data/General Election 2024/CVR_Export_20241130154411/PrecinctManifest.json') |> 
  as.data.frame()

precinct_portion_manifest <- fromJSON('data/General Election 2024/CVR_Export_20241130154411/DistrictPrecinctPortionManifest.json') |> 
  as.data.frame()

tabular_manifest <- fromJSON('data/General Election 2024/CVR_Export_20241130154411/TabulatorManifest.json') |> 
  as.data.frame()

# REVIEW ######################################################################

# CLEAN / MUTATE ##############################################################

## Add New Fields =============================================================

## Remove Error Records =======================================================

## Replace NA Values ==========================================================

# ANALYZE #####################################################################

## First Thing ================================================================

## Second Thing ===============================================================

### First part of second thing ------------------------------------------------
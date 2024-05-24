
# Helper script to run BaleenWhale_Summary_Report.Rmd

# load packages
library(pacman)
pacman::p_load(here, knitr)

################################################################################ 

# SET PARAMETERS

# required:


year_start =            #Start year of interest
year_end =              #End year of interest
filterspecies = 
filterstations =

# if filterspecies TRUE
# Blue whale = Bm   Fin whale = Bp  Sei whale = Bb  Humpback whale = Mn  NA Right whale = Eg   Minke whale = Ba

species = c("")         # use format c("","")
  
#if filterstations TRUE

stations = c("")    # use format c("","")

################################################################################

# don't need to modify anything below

# define function
render_report = function(
    year_start, year_end, filterspecies,filterstations,species,stations) {
  
  rmarkdown::render(here("summary_report","baleenWhale_summary_report.Rmd"), 
                    params = list(
                      year_start = year_start,
                      year_end = year_end,
                      filterspecies = filterspecies,
                      filterstations = filterstations,
                      species = species,
                      stations = stations
                    ),
                    output_file = here(paste0("baleenwhale_summary_report_", Sys.Date(), ".docx")))
}

# render report based on parameters set above
render_report(year_start,year_end, filterspecies,filterstations,species,stations)

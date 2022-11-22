# for data tooling; too lazy to use base R
library(tidyverse)

# read in our moon data
data <- read_tsv("moon_synonyms.tsv") %>%
  select(Name, Month, Sources)
  

fluidPage(
  titlePanel("Moon/lunation Names"),
  htmlOutput(outputId = "desc"),
  
  # Create a new Row in the UI for selectInputs
  fluidRow(
    column(4,
           selectInput("Name",
                       "Moon/lunation name:",
                       c("All",
                         unique(as.character(data$Name))))
    ),
    column(4,
           selectInput("Month",
                       "Gregorian calander month",
                       c("All",
                         unique(as.character(data$Month))))
    ),
    column(4,
           selectInput("Sources",
                       "Source for name",
                       c("All",
                         unique(as.character(data$Sources))))
    )
  ),
  # Create a new row for the table.
  DT::dataTableOutput("table")
)

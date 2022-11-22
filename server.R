# for data tooling; too lazy to use base R
library(tidyverse)

function(input, output) {
  
  # Filter data based on selections
  output$table <- DT::renderDataTable(DT::datatable({
    data <- read_tsv("moon_synonyms.tsv") %>%
      select(Name, Month, Sources)
    # Possible TODO, change exact match here to fuzzy 
    # match to handle typos & near matches (partials
    # should already be handled)
    if (input$Name != "All") {
      data <- data[data$Name == input$Name,]
    }
    if (input$Month != "All") {
      data <- data[data$Month == input$Month,]
    }
    if (input$Sources != "All") {
      data <- data[data$Sources == input$Sources,]
    }
    data
  })
  )
  
  # Pull in description of trend
  output$desc <- renderUI({
    HTML("The sources for the moon/lunation names and months are as follows:  <br/>
    - Beard Wikipedia: Beard 1918 guide for the boy scouts as extracted on the Wikipedia page for the full moon (https://en.wikipedia.org/wiki/Full_moon). <br/>
    - Almanac: Names provided by the Farmer's almanac on their page 'Full Moon Names for 2022' (https://www.almanac.com/full-moon-names). <br/>
    - UCL: names provided by Stephen Boyle at the UCL Observatory (https://www.ucl.ac.uk/~ucapsj0/moon/index.html). <br/> 
    - NOT INCLDUED IN TABLE, but prehaps useful for reference: multi-lingual moon/lunar month names collected by Kevin Finity https://docs.google.com/spreadsheets/d/1RtmPorWmy9_HDS2epfx9dg3-H37IZQ2-EZs9ZCb4znk/edit#gid=0 <br/> <br/>")
  })
  
}
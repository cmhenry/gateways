################################################################################
# Shiny App to Display Data
# <Init> 2/1/2019
# <Rev> 5/30/2019
# <AU> Doyle
# Reactive display: for each variable provide description map and barplot
################################################################################

library(shiny)
library(shinythemes)
library(plotly)
library(leaflet)
library(sf)
library(albersusa)
library(scales)
library(RColorBrewer)
library(tidyverse)

source("./01_gifted_functions.R")
load("../data/maps_data/updated_maps_data.RData")
load("page_links.Rdata")
## Drop state from list of variables
gm_sub <-gm_2015%>%select(-1)
gm_y <- c('2015', '2017') 
gm <- list('2015' = gm_2015, '2017' = gm_2017)
gm_states <- list('2015' = gm_states2015, '2017' = gm_states2017)


shinyApp(
  ui = fluidPage(
    theme = shinytheme("slate"),
    
    navbarPage("Students with Gifts and Talents Across the United States: Access, Equity, and Missing Youth",
      
      tabPanel(
        "Plot",
        
        ## First Section: Variable Selection and Description,
        column(2, offset = 1,
               fluidRow(
                 ## Variable Selection Widget
                 selectInput(inputId = "year", label = "Choose a Year:", choices = gm_y),
                 ## Reactive Text based on variables
                 htmlOutput("year_desc")),
               fluidRow(
                 ## Variable Selection Widget
                 selectInput(inputId = "variable", label = "Choose a Variable:", choices = names(gm_sub)),
                 ## Reactive Text based on variables
                 htmlOutput("description")),
               fluidRow(
                 img(src='Purdue-Sig-Black-Gold-rgb.png', align = "bottom",height=150,width=140),
                 HTML("<br/><br/><br/>"),
                 img(src='vu06br.jpg', align = "bottom",height=150,width=140)
               )),
        # Close First Section
        
        ## Second Section: Plot Output
        column(9,
               ## Map
               fluidRow(leafletOutput("map", width = 700, height = 600)),
               ## Barplot
               fluidRow(plotlyOutput("barplot", width = 600, height = 500))),
        # Close Second Section
        
        ## Background for text description
        #tags$style(type='text/css', '#description {background-color: #FFF; color: black;}'),
        
        ## Background for leaflet
        tags$head(tags$style(
          HTML(".leaflet-container {background-color:rgba(255,0,0,0)}" 
              ))),
        
        helpText(
          "                                        ",
          "                                        ",
          "Notes: Rhode Island, Massachusetts, Vermont and DC have been dropped from all variables
            except Access to Identification and Percent Identified as Gifted/Talented
            as they have fewer than 5% of their students having access to identification."
        )
      ),  #Close tab panel
      
      tabPanel(
        "About",
        
        ## Title Section
        titlePanel(
          "Students with Gifts and Talents Across the United States: Access, Equity, and Missing Youth"
        ),
        
        helpText(
          HTML('Below, please find links to report cards for the nation, states and the District of Columbia  <br/> <br/>'),
          HTML(page_links)
        )
      ) # Close tabset
    ) # Close navbar
  ), # End fluidpage
  
  
  server = function(input, output) {
    ## Select Year
    
    ## Barplot
    output$barplot <- renderPlotly({
      gg_state_plot(
        df_list = gm,
        var = (input$variable),
        groupvar = "State",
        axis_label = (input$variable),
        year = (input$year)
      )
    })
    ## Map
    output$map <- renderLeaflet({
      map_gen(
        v = (input$variable),
        geo_df_list = gm_states,
        legend_label  = (input$variable),
        year = (input$year)
      )
    })
    ## Text output
    output$description <-
      renderText(pull_text(var = input$variable, df = gm_cb))
  }
)

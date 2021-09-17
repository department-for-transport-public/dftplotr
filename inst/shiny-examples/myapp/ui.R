
# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("DfT colour palette picker"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(

      h4("Palette selection"),
      selectizeInput("colour_1",
                   "Pick a base colour:",
                   choices= c("Corporate green" = "#006853",
                              "Green" = "#15B542",
                              "Mint" = "#1DE9B6",
                              "Lime" = "#88EF1B",
                              "Yellow" = "#FFD833",
                              "Navy blue" = "#001A70",
                              "Sky blue" = "#0082CA",
                              "Red" = "#FF0000",
                              "Orange" = "#FF5500")),
      uiOutput("select_2"),
      uiOutput("select_3"),
      uiOutput("select_4"),
      hr(),
      h4("Accessibility options"),

      sliderInput("accessibility",
                  label = "Choose a WCAG accessibility rating",
                   min = 1,
                  max = 6,
                  step = 0.25,
                  value = 3
                  ),

      h4(textOutput("accessibility_text")),
      hr(),

      checkboxGroupInput("colour_blind",
                         label = "Simulate appearance with colour blindness",
                         choices = c("Deuteranopia (R-G)" = "deutan",
                                     "Protanopia (R-G)" = "protan",
                                     "Tritanopia (G-B)" = "tritan")),
      hr(),

      checkboxInput("greyscale",
                    label = "Show me greyscale (print-friendly) appearance",
                    value = 0)

    ),

    # Show a plot of the generated distribution
    mainPanel(
        textOutput("palette_description"),
        hr(),
        plotOutput("bar_chart_example", height = 200),
        hr(),
        plotOutput("line_chart_example", height = 200)
    )
  )
))

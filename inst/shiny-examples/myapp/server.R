##Read in raw palette data
raw_palette <- data.table::as.data.table(readRDS("palette.rds"))

#Create named list of colours
name_lookup <- data.table::as.data.table(readRDS("name_lookup.rds"))
name_list <- as.list(name_lookup$Hex)
names(name_list) <- name_lookup$Hue

##Create dummy dataframe
df <- data.frame(dose=c("D0.5", "D1", "D2", "D3", "D4"),
                 len=c(4.2, 10, 16, 23.4, 27.2))

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {


  ##Create a palette based on inputs

  custom_palette <- reactive({

   palette <- c(input$colour_1, input$colour_2, input$colour_3,
                input$colour_4, input$colour_5)

   #Remove empty values
   palette[palette != ""]

  })

  ##Change appearance of palette to show colour-blindness or greyscale
  final_palette <- reactive({
    ##Choose whether greyscale or not
    if(input$greyscale == 1){
      DescTools::ColToGrey(custom_palette())

    } else if(!is.null(input$colour_blind)){
      dichromat::dichromat(custom_palette(), type = input$colour_blind[1])

    }else{
      custom_palette()
    }
  })


  ##Output text of the colours in the palette
  output$palette_description <- renderText({

    paste0("The hex codes for your palette:\n",
           paste(custom_palette(), collapse = ", "))

  })

  ##Output text saying if it meets WCAG standards
  output$accessibility_text <- renderText({
    if(input$accessibility < 3){
      "This contrast level does not meet WCAG 2.0 AA guidelines"
    }else if(input$accessibility < 4.5){
    paste0("This contrast level meets WCAG 2.0 AA guidelines")
    }else{
    paste("This contrast level meets WCAG 2.0 AAA guidelines")
  }
    })

  ##Dynamic selectise options
  output$select_2 <- renderUI({

    ##Select colours that should be available
    cols <- raw_palette[a_hex == input$colour_1 & ratio >= input$accessibility, b_hex]

    selectInput("colour_2",
                "Pick a secondary colour:",
                choices = c("", name_list[name_list %in% cols]),
                selected = "")
  })

  ##Dynamic selectise options
  output$select_3 <- renderUI({

    ##Select colours that should be available
    cols <- unique(raw_palette[(a_hex == input$colour_2 & ratio >= input$accessibility) & !b_hex %in% c(input$colour_1), b_hex])

    selectInput("colour_3",
                "Pick additional colours:",
                choices = c("", name_list[name_list %in% cols]),
                selected = "")
  })

  ##Dynamic selectise options
  output$select_4 <- renderUI({

    ##Select colours that should be available
    cols <- unique(raw_palette[(a_hex == input$colour_3 & ratio >= input$accessibility) & !b_hex %in% c(input$colour_1, input$colour_2), b_hex])

    selectInput("colour_4",
                "Pick additional colours:",
                choices = c("", name_list[name_list %in% cols]),
                selected = "")
  })

  ##Dynamic selectise options
  output$select_5 <- renderUI({

    ##Select colours that should be available
    cols <- unique(raw_palette[(a_hex == input$colour_4 & ratio >= input$accessibility) & !b_hex %in% c(input$colour_1, input$colour_2, input$colour_3), b_hex])

    selectInput("colour_5",
                "Pick additional colours:",
                choices = c("", name_list[name_list %in% cols]),
                selected = "")
  })

  #Example bar chart
  output$bar_chart_example <- renderPlot({

    df <- head(df, length(custom_palette()))

   ggplot2::ggplot(df, ggplot2::aes(x=dose, y=len, fill=dose)) +
     ggplot2::geom_bar(stat="identity")+
     ggplot2::scale_fill_manual(values = final_palette()) +
     ggplot2::theme_minimal()
  })

  ##Example line chart
  output$line_chart_example <- renderPlot({

    df <- data.frame(supp=rep(c("VC1", "OJ", "VC2", "OJ2"), each=3),
               dose=rep(c("D0.5", "D1", "D2"), 4),
               len=c(6.8, 15, 33, 4.2, 10, 29.5, 3.6, 11, 21, 2, 8, 16))
    df <- tidyr::spread(df, dose, len)
    df <- head(df, length(custom_palette()))
    df <- tidyr::gather(df, dose, len, -supp)

    ggplot2::ggplot(df, ggplot2::aes(x=dose, y=len, colour=supp, group = supp)) +
      ggplot2::geom_line()+
      ggplot2::scale_color_manual(values = final_palette()) +
      ggplot2::theme_minimal()
  })


})

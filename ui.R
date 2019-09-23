library(shiny)
library(shinydashboard)

prizes <- read.csv(file = "./tennis_pay.csv")

shinyUI(dashboardPage(
  dashboardHeader(title = "Grand Slam Prize Money"),
  dashboardSidebar(sidebarMenu(
    sidebarSearchForm("searchText", "buttonSearch", "Search"),
    menuItem(
      "Dashboard",
      tabName = "dashboard",
      icon = icon("dashboard"),
      badgeLabel = "New",
      badgeColor = "green"
    ),
    menuItem("Raw Data", tabName = "rawData", icon = icon("table"))
  )),
  dashboardBody(tabItems(
    tabItem(
      tabName = "dashboard",
      fluidRow(
        infoBox(
          "Grand Slams per year",
          4,
          icon = icon("dice-four"),
          width = 3
        ),
        infoBox(
          "Grand Slams Since",
          1968,
          color = "yellow",
          icon = icon("cogs"),
          width = 3
        ),
        infoBox(
          "Total Grand Slams",
          170,
          color = "green",
          icon = icon("calendar-alt"),
          width = 3
        ),
        infoBox(
          "Highest Prize",
          "$3.3 million",
          color = "red",
          icon = icon("calendar-alt"),
          width = 3
        )
      ),
      fluidRow(br(), br(), br()),
      fluidRow(
        box(
          title = "Dashboard Controls",
          status = "warning",
          solidHeader = T,
          width = 2,
          "Use these controls to fine tune your dashboard",
          br(),
          br(),
          selectizeInput(
            inputId = "slam",
            label = "Grand Slam",
            choices = c(
              "Wimbeldon" = "wimbledon",
              "US Open" = "us_open",
              "AUS Open" = "aus_open",
              "Roland Garros" = "roland_garros"
            )
          ),
          selectizeInput(
            inputId = "gender",
            label = "Gender",
            choices = c(
              "Men" = "men",
              "Women" = "women"
            ))
        ),
        box(
          title = "Grand Slam Prize Money Dashboard",
          status = "primary",
          solidHeader = T,
          width = 10,
          plotOutput("prizeHist")
        )
      )
    ),
    tabItem(tabName = "rawData", h3("Raw Data"))
  ))
))
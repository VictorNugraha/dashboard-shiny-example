# header -------------------------------------------------------------------

# header definition
header <- dashboardHeader(
    title = "Newton IP"
)


# sidebar -----------------------------------------------------------------

# sidebar definition
sidebar <- dashboardSidebar(
    sidebarMenu(
        menuItem(
            text = "Personal",
            tabName = "personal",
            badgeLabel = "demographics", 
            badgeColor = "green",
            icon = icon("gears")
        ),
        
        menuItem(
            text = "Billing",
            tabName = "billing",
            badgeLabel = "rate", 
            badgeColor = "green",
            icon = icon("tasks")
        ),
        
        menuItem(
            text = "Work",
            tabName = "work",
            badgeLabel = "demographics", 
            badgeColor = "green",
            icon = icon("cubes")
        )
    )
)


# body --------------------------------------------------------------------

# body definition
body <- dashboardBody(
    tabItems(
        tabItem(
          tabName = "personal",
          
          fluidRow(
            
            box(
                title = "Overview",
                width = 12, 
                
                radioButtons(inputId = "status", 
                             label = "Attrition status?", 
                             choices = c("yes","no"), inline = TRUE),
                
                valueBoxOutput(
                    outputId = "job_sat", width = 3 
                ),
                
                valueBoxOutput(
                    outputId = "env_sat", width = 3 
                ),
                
                valueBoxOutput(
                    outputId = "tenure", width = 3 
                ),
                
                valueBoxOutput(
                    outputId = "income", width = 3 
                )
            ) 
                
          ),
          
          fluidRow(
              box(
                  title = "Numerical Variable",
                  width = 6, 
                  selectInput(inputId = "persnum", 
                              label = "Select the variable name:", 
                              choices = data_attrition %>% 
                                  select(age, distance_from_home, 
                                         total_working_years, 
                                         num_companies_worked) %>% 
                                  colnames()),
                  plotlyOutput("personalNum")
              ),
              box(
                  title = "Categorical Variable",
                  width = 6,
                  selectInput(inputId = "perscat", 
                              label = "Select the variable name:", 
                              choices = data_attrition %>% 
                                  select(gender, education, 
                                         education_field, 
                                         work_life_balance,
                                         marital_status) %>% 
                                  colnames()),
                  plotlyOutput("personalCat")
              )
          )
        )
    )
)


# full page ---------------------------------------------------------------

# page definition
dashboardPage(
    header = header,
    body = body,
    sidebar = sidebar,
    skin = "black"
)
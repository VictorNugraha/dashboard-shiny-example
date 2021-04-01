dashboardPage(
    skin = "black",
    dashboardHeader(title = "Newton IP"),
    dashboardSidebar(
        sidebarMenu(
            menuItem(
                text = "Personal", #Judul
                tabName = "personal", #Unique ID
                icon = icon("gears") #Design icon shown
            ),
            menuItem(
                text = "Billing", #Judul
                tabName = "billing",#Unique ID
                icon = icon("tasks")
            ),
            menuItem(
                text = "Work", #Judul
                tabName = "work", #Unique ID
                icon = icon("cubes")
            )
        )
    ),
    dashboardBody(
        tabItems(
            tabItem(
                tabName = "personal",
                
                fluidRow( # Utk mengatur row
                    box(
                        title = "Overview",
                        width = 12, 
                        
                        radioButtons(inputId = "status", 
                                     label = "Attrition status?", 
                                     choices = unique(data_attrition$attrition),#menggunakan unique untuk memberikan option
                                     inline = TRUE), # Trueuntuk mengatur tombol pilihan kesamping
                                        
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
                        width = 12,
                        selectInput(inputId = "pers_num",
                                    label =  "Select The Variable",
                                    choices = data_attrition %>% 
                                        select(age, distance_from_home, 
                                               total_working_years, 
                                               num_companies_worked) %>% 
                                        colnames(),
                                    selected = "distance_from_home"
                                    ),
                        plotlyOutput(outputId = "personalnum")
                         )
                    )
                )
                
                )
            )
        )
    

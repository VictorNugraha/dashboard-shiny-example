function(input, output) {
    
    reactive_employee <- reactive({ # shiny akan menyimpan data frame reactive
        
        data_attrition %>% 
            filter(attrition == input$status)
        
    })
    
    output$job_sat <- renderValueBox({
        
        value_job_satisfaction <- reactive_employee() %>%  #penggunakan () untuk menandakan bahwa object tersebut reactive
            pull(job_satisfaction) %>% #tarik value
            mean() %>% 
            round(2)
        
        valueBox(
            value = value_job_satisfaction, 
            subtitle = "Avg Job Satisfaction",
            icon = icon("smile"),
            color = "red", width = 3
        )
        
    })
    
    output$env_sat <- renderValueBox({
        
        value_env_satisfaction <- reactive_employee() %>%  #penggunakan () untuk menandakan bahwa object tersebut reactive
            pull(environment_satisfaction) %>% 
            mean() %>% 
            round(2)
        
        valueBox(
            value = value_env_satisfaction, 
            subtitle = "Avg Environment Satisfaction",
            icon = icon("user-friends"),
            color = "yellow", width = 3
        )
        
    })
    
    output$tenure <- renderValueBox({
        
        value_tenure <- reactive_employee() %>%  #penggunakan () untuk menandakan bahwa object tersebut reactive
            pull(years_at_company) %>% 
            mean() %>% 
            round(2) * 12
        
        valueBox(
            value = paste(value_tenure, "Mths"), 
            subtitle = "Avg Tenure",
            icon = icon("spinner"),
            color = "blue", width = 3
        )
        
    })
    
    output$income <- renderValueBox({
        
        avg_income <- reactive_employee() %>%  #penggunakan () untuk menandakan bahwa object tersebut reactive
            pull(monthly_income) %>% 
            mean() %>% 
            dollar()
        
        valueBox(
            value = avg_income, 
            subtitle = "Avg Income",
            icon = icon("comment-dollar"),
            color = "green", width = 3
        )
        
    })
    
    output$personalnum <- renderPlotly({
        
        # create visualization
        
        title_num <- input$pers_num %>%
            str_replace_all(pattern = "_", replacement = " ") %>%
            str_to_title()
        
        p <- ggplot(data_attrition, aes_string(input$pers_num)) +
            geom_density(aes(fill = attrition), alpha = 0.7) +
            scale_fill_manual(values = c("firebrick", "dodgerblue4")) +
            labs(
                title = title_num,
                x = NULL,
                fill = "Attrition"
            ) +
            theme_bw()
        
        ggplotly(p)
        
    })
        
        
}
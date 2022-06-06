server <- function(input, output, session) {
  
  myvals <- reactiveValues(vals = NULL)

  observeEvent(input$modalButton, {
    showModal(myModalUI("mod1"))
  })
  
  #modrv <- callModule(myModal2, "mod1")
  
  modrv <- myModal1("mod1")
  
  displayAndLoad <- function(modals = NULL) {
    observe({ myvals$vals <- modals$val })
    output$myDT <- renderDataTable({ myvals$vals })
  }
  
  displayAndLoad(modrv)
  
  # modrv <- myModal1("mod1")
  # 
  # observe({
  #   myvals$vals <- modrv$val
  # })
  
  #output$myDT <- renderDataTable({ myvals$vals })

}
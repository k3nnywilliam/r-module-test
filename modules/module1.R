myModalUI <- function(id) {
  ns <- NS(id)
  modalDialog(
    title = "Open File",
    dataTableOutput(ns("excelData")),
    textOutput(ns("mytext")),
    easyClose = TRUE,
    footer = tagList(
      actionButton(ns('myGetButton'),  "Get"),
      actionButton(ns('myOkButton'),  "Ok"),
      modalButton("Cancel"),
    )
  )
}


myModal1 <- function(id) {
  moduleServer(id, function(input, output, session) {
    selectedFile <- reactiveValues(val = NULL)
    
    observeEvent(input$'myGetButton', {
      myfile <- excelFileServer('fileserver')
      myExcelFile <- renderDataTable(myfile())
      output$excelData <- myExcelFile
    })
    
    observeEvent(input$'myOkButton', {
      myfile2 <- excelFileServer('fileserver')
      selectedFile$val <- myfile2()
      removeModal(session = session)
    })
    
    return(selectedFile)
    
  })
}


myModal2 <- function(input, output, session) {
  selectedFile <- reactiveValues(val = NULL)
  
  observeEvent(input$'myGetButton', {
    myfile <- excelFileServer('fileserver')
    myExcelFile <- renderDataTable(myfile())
    output$excelData <- myExcelFile
  })
  
  observeEvent(input$'myOkButton', {
    myfile2 <- excelFileServer('fileserver')
    selectedFile$val <- myfile2()
    removeModal(session = session)
  })
  
  return(selectedFile)
  
}
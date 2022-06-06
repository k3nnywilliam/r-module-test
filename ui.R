ui <- fluidPage(
  actionButton("modalButton", "Open"),
  dataTableOutput("myDT")
)
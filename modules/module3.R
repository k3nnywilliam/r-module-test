excelFileServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      filedata <- reactive({
        openxlsx::read.xlsx("https://data.nal.usda.gov/system/files/GrainDemandProduction.xlsx")
        #readxl::read_xlsx("data/GrainDemandProduction.xlsx")
      })
      filedata
    })

}
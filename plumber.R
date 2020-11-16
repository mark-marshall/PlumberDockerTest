library(openair)

#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg="") {
  list(msg = paste0("The message is: '", msg, "'"))
}

#* Plot a histogram
#* @serializer png
#* @get /polarplot
function() {
  data_mary <- importAURN(site = "my1", year = 2013, verbose = FALSE)
  polarPlot(data_mary, pollutant = "no2", statistic = "mean")
}

#* Plot a histogram
#* @serializer png
#* @get /windrose
function() {
  data_mary <- importAURN(site = "my1", year = 2013, verbose = FALSE)
  windRose(data_mary)
}

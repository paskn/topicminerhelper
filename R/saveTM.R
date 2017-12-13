#' Write data in a topicminer format
#'
#' Write data in a topicminer format.
#' @param texts A character vector with your textual data.
#' @param metadata A data.frame object with your metadata.
#' @param path A string with path to the output directory.
#' @export
#' @examples
#' saveTM(my_df$text, my_df[,c("user", "date", "location")], "./forTM/")

saveTM <- function(texts, metadata, path){
  
  # check if output directory exists, create it otherwise
  if (file.exists(path)){
  } else {
    dir.create(file.path(path))
  }
  
  # write text in the output dir
  print("saving texts...")
  for (i in 1:length(texts)) {
    write(texts[i], file=paste(path, i,".txt", sep=""))
  }
  
  # write metadata in the output dir
  print("saving metadata...")
  if (is.data.frame(metadata) == TRUE){
    write.table(metadata, file = paste(path, "metadata.csv", sep = ""), 
              col.names = FALSE, row.names = TRUE, fileEncoding = "UTF-8", sep = ",")
  } else {
    print("Error: metadata should be a data.frame!")
  }
  
  print("done!")
}

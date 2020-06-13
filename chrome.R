# create session
chromeOpen <- function() {
  suppressMessages(suppressWarnings(
    require(chromote)
  ))
  ChromoteSession$new()
}
# session viewer
chromeView <- function(b) {
  b$view()
  invisible(NULL)
}
# navigate
chromeGo <- function(b,url) {
  b$Page$navigate(url)
  invisible(NULL)
}
# take a screenshot
chromeShot <- function(b,filename="screenshot.png") {
  b$screenshot(filename)
  invisible(NULL)
}
chromeClose <- function(b) {
  b$close()
  invisible(NULL)
}
getHTML <- function(b,query=NA) {
  x <- b$DOM$getDocument()
  if(is.na(query)) {
    x <- b$DOM$getOuterHTML(x$root$nodeId)
  } else {
    x <- b$DOM$querySelector(x$root$nodeId,query)
    x <- b$DOM$getOuterHTML(x$nodeId)
  }
  x$outerHTML  
}
setInput <- function(b,query,value) {
  x <- b$DOM$getDocument()
  x <- b$DOM$querySelector(x$root$nodeId,query)
  b$DOM$setAttributeValue(x$nodeId,"value",value)
  invisible(NULL)
}
getXY <- function(b,query) {
  x <- b$DOM$getDocument()
  x <- b$DOM$querySelector(x$root$nodeId,query)
  x$nodeId
  #x <- b$DOM$getBoxModel(x$nodeId)
  #x
  #c(x=x$model$content[[1]]+10,y=x$model$content[[2]]+10)
}

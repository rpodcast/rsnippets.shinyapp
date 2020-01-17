# Module UI
  
#' @title   mod_welcome_ui and mod_welcome_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_welcome
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_welcome_ui <- function(id, show_description = NULL, host_description = NULL) {
  ns <- NS(id)
  
  if (is.null(show_description)) {
    show_description <- readLines(system.file("app", "show_description.md", package = "rsnippets.app"))
  }
  
  if (is.null(host_description)) {
    host_description <- readLines(system.file("app", "host_description.md", package = "rsnippets.app"))
  }
  
  
  tagList(
    f7ExpandableCard(
      markdown(show_description),
      id = 'home_card',
      img = "www/residual_snippets.png",
      fullBackground = FALSE,
      title = "Click to learn more!"
    ),
    f7Align(
      side = "center",
      h2("Behind the voice")
    ),
    f7SocialCard(
      markdown(host_description),
      author = "Eric Nantz",
      author_img = "www/avatar.jpg"
      #author_img = system.file("app", "www", "avatar.jpg", package = "rsnippets.app")
    )
  )
}
    
# Module Server
    
#' @rdname mod_welcome
#' @export
#' @keywords internal
    
mod_welcome_server <- function(input, output, session) {
  ns <- session$ns
  
  # so far nothing to return
}

## To be copied in the UI
# mod_welcome_ui("welcome_ui_1")
    
## To be copied in the server
# callModule(mod_welcome_server, "welcome_ui_1")
 

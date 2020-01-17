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
mod_welcome_ui <- function(id){
  ns <- NS(id)
  tagList(
    f7ExpandableCard(
      "Residual Snippets is an informal, unedited, and free-flowing audio podcast 
               from Eric Nantz.  If you enjoy hearing quick takes from a data scientist 
               on their journey to blend innovative uses of open-source technology, 
               contributing back to their brilliant communities, and juggling the curveballs 
               life throws at them, this podcast is for you!",
      id = 'home_card',
      img = "www/residual_snippets.png",
      fullBackground = FALSE,
      title = "Click to learn more!"
    ),
    f7SocialCard(
      "Some text here",
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
}

## To be copied in the UI
# mod_welcome_ui("welcome_ui_1")
    
## To be copied in the server
# callModule(mod_welcome_server, "welcome_ui_1")
 

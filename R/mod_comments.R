# Module UI
  
#' @title   mod_comments_ui and mod_comments_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_comments
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_comments_ui <- function(id, episode_df){
  ns <- NS(id)
  
  tagList(
    f7Card(
      title = "Comments",
      #uiOutput(ns("episode_select_placeholder")),
      #uiOutput(ns("utterance_placeholder"))
      HTML(
        "<script src='https://utteranc.es/client.js'
        repo='rpodcast/rsnippets.app'
        issue-term='Episode comment'
        label='comments'
        theme='github-light'
        crossorigin='anonymous'
        async>
</script>"
      )
    )
  )
}
    
# Module Server
    
#' @rdname mod_comments
#' @export
#' @keywords internal
    
mod_comments_server <- function(input, output, session, episode_df){
  ns <- session$ns
  
  # obtain episode IDs
  episode_choices <- sort(episode_df$episode_int)
  
  # output$episode_select_placeholder <- renderUI({
  #   ns <- session$ns
  #   f7Select(
  #     inputId = ns("episode_select"),
  #     label = "Select episode for comment",
  #     choices = episode_choices
  #   )
  # })
  
  # reactive for javascript snippet for episode comment
#   utterance_snippet <- reactive({
#     req(input$episode_select)
#     ep_select <- input$episode_select
#     
#     glue::glue(
#       "<script src='https://utteranc.es/client.js'
#         repo='rpodcast/rsnippets.app'
#         issue-term='Episode {ep_select} comment'
#         label='comments'
#         theme='github-light'
#         crossorigin='anonymous'
#         async>
# </script>"
#     )
#   })
  
  # render the widget  NOT WORKING
  # output$utterance_placeholder <- renderUI({
  #   req(utterance_snippet())
  #   HTML(utterance_snippet())
  # })
  
}
    
## To be copied in the UI
# mod_comments_ui("comments_ui_1")
    
## To be copied in the server
# callModule(mod_comments_server, "comments_ui_1")
 

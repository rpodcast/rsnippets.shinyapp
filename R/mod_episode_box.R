# Module UI
  
#' @title   mod_episode_box_ui and mod_episode_box_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_episode_box
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
#' @import shinyMobile
#' @import wavesurfer
mod_episode_box_ui <- function(id, episode_title, episode_int, episode_df) {
  ns <- NS(id)
  # obtain row with supplied episode_int
  df <- episode_df %>%
    filter(episode_int == !!episode_int)

  tagList(
    f7Card(
      title = df$episode_title,
      #color = "blue",
      fluidRow(
        column(
          width = 12,
          wavesurferOutput(ns("my_ws"))
        )
      ),
      
      fluidRow(
        column(
          width = 12,
          f7Segment(
            shadow = TRUE,
            container = "row",
            f7Button(ns("play"), f7Icon("play")),
            f7Button(ns("pause"), f7Icon("pause")),
            f7Button(ns("stop"), icon("stop")),
            f7Button(ns("skip_backward"), icon("backward")),
            f7Button(ns("skip_forward"), icon("forward")),
            f7Button(ns("mute"), icon("volume-off"))
          )
        )
      ),
      
      fluidRow(
        column(
          width = 12,
          f7Sheet(
            id = ns("transcript_popup"),
            label = "View Transcript",
            title = glue::glue("Episode {episode_int} Transcript"),
            df$episode_summary
          )
        )
      )
    )
    
#     f7Card(
#       title = glue::glue("Episode {episode_int} Comments"),
#       HTML(
#         "<script src='https://utteranc.es/client.js'
#         repo='rpodcast/rsnippets.shinyapp'
#         issue-term='Episode comment'
#         label='comments'
#         theme='github-light'
#         crossorigin='anonymous'
#         async>
# </script>"
#       )
#     )
  )
}
    
# Module Server
    
#' @rdname mod_episode_box
#' @export
#' @keywords internal
    
mod_episode_box_server <- function(input, output, session, episode_int, episode_df){
  ns <- session$ns
  
  # obtain row with supplied episode_int
  df <- episode_df %>%
    filter(episode_int == !!episode_int)
  
  output$my_ws <- renderWavesurfer({
    my_url <- df$episode_url
    wavesurfer(audio = my_url) %>%
      ws_set_wave_color('#5511aa') %>%
      ws_timeline() %>%
      ws_cursor()
  })
  
  # create events for audio playback controllers
  observeEvent(input$play, {ws_play(ns("my_ws"))})
  observeEvent(input$pause, {ws_pause(ns("my_ws"))})
  observeEvent(input$mute, {ws_toggle_mute(ns("my_ws"))})
  observeEvent(input$skip_forward, {ws_skip_forward(ns("my_ws"), 60)})
  observeEvent(input$skip_backward, {ws_skip_backward(ns("my_ws"), 30)})
  observeEvent(input$stop, {ws_stop(ns("my_ws"))})
}
    
## To be copied in the UI
# mod_episode_box_ui("episode_box_ui_1")
    
## To be copied in the server
# callModule(mod_episode_box_server, "episode_box_ui_1")
 

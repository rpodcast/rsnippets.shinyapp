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
#' @import waiter
mod_episode_box_ui <- function(id, episode_title, episode_int, episode_df) {
  ns <- NS(id)
  # obtain row with supplied episode_int
  df <- episode_df %>%
    filter(episode_int == !!episode_int)
  
  # derive time stamp for episode
  date_print <- lubridate::parse_date_time(df$episode_timestamp, "%Y-%m-%d_%H-%M")
  duration_print <- glue::glue("{x} minutes", x = ceiling(episode_df$episode_duration / (60 * 1000)))

  tagList(
    f7Card(
      title = glue::glue("Episode {title} recorded on {date_print} ({duration_print})",
                         title = df$episode_title),
      #color = "blue",
      f7Row(
        f7Col(
          f7Toggle(
            ns("waveform_ind"),
            "Use WaveForm Player",
            checked = FALSE,
            color = "blue"
          ),
          #width = 12,
          conditionalPanel(
            condition = "input.waveform_ind == true",
            ns = ns,
            wavesurferOutput(ns("my_ws"))
          ),
          conditionalPanel(
            condition = "input.waveform_ind == false",
            ns = ns,
            uiOutput(ns("my_audio"))
          )
        )
      ),
      
      conditionalPanel(
        condition = "input.waveform_ind == 'true'",
        ns = ns,
        f7Row(
          f7Col(
            #width = 12,
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
        )
      ),
      
      f7Row(
        f7Col(
          #width = 12,
          f7Toggle(
            ns("transcript_ind"),
            "View Transcript",
            checked = FALSE,
            color = "blue"
          ),
          conditionalPanel(
            condition = "input.transcript_ind == true",
            ns = ns,
            f7Block(
              f7BlockHeader(text = "Episode Transcript"),
              df$episode_summary,
              strong = TRUE,
              inset = TRUE,
              hairlines = FALSE
            )
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
  
  # establish waiter for wavesurferloading
  #w <- Waiter$new(id = ns("my_ws"))
  
  # obtain row with supplied episode_int
  df <- episode_df %>%
    filter(episode_int == !!episode_int)
  
  # reactive for wavesurfer object
  w_player <- reactive({
    req(input$waveform_ind)
    #w$show()
    my_url <- df$episode_url
    res <- wavesurfer(audio = my_url) %>%
      ws_set_wave_color('#5511aa') %>%
      ws_timeline() %>%
      ws_cursor()
    #w$hide()
    return(res)
  })
  
  output$my_ws <- renderWavesurfer({
    w_player()
  })
  
  output$my_audio <- renderUI({
    my_url <- df$episode_url
    html_player(my_url)
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
 

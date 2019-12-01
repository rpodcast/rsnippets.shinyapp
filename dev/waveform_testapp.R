library(wavesurfer)
library(shiny)

ui <- fluidPage(
  wavesurferOutput("my_ws"),
  tags$p("Press spacebar to toggle play/pause."),
  actionButton("mute", "Mute", icon = icon("volume-off"))
)

server <- function(input, output, session) {
  #my_url <- "http://ia902606.us.archive.org/35/items/shortpoetry_047_librivox/song_cjrg_teasdale_64kb.mp3"
  my_url <- "https://s3.amazonaws.com/rsnippets.show/song_cjrg_teasdale_64kb.mp3"
  
  output$my_ws <- renderWavesurfer({
    wavesurfer(audio = my_url) %>%
      ws_set_wave_color('#5511aa') %>%
      ws_cursor()
  })
  
  observeEvent(input$mute, {
    ws_toggle_mute("my_ws")
  })
}

shinyApp(ui = ui, server = server)

#' @import shiny
#' @import dplyr
app_server <- function(input, output,session) {
  
  # obtain the json version of episode database
  db_file <- config::get("db_json", file = system.file("app", "config.yml", package = "rsnippets.app"))
  episode_df <- tibble::as_tibble(jsonlite::fromJSON(db_file))
  
  # List the first level callModules here
  #my_url <- "https://rpodcast-snippets-audio.s3.amazonaws.com/source/rsnippet020_2019-11-17_04-54.mp3"
  #my_url <- "https://s3.amazonaws.com/rsnippets.show/song_cjrg_teasdale_64kb.mp3"
  #my_url <- "https://s3.amazonaws.com/rsnippets.show/source/rsnippet002_2019-11-29_03-44.mp3"
  
  # loop through the available entries in the database
  episode_df <- episode_df %>%
    arrange(desc(episode_int))
  
  for (i in sort(episode_df$episode_int)) {
    insertUI(
      selector = "#add_episodes_here",
      ui = tagList(
        div(
          id = paste0("episode", i),
          mod_episode_box_ui(
            paste0("episode_box_ui_", i),
            episode_int = i,
            episode_df = episode_df
          )
        )
      )
    )
    
    callModule(
      mod_episode_box_server,
      paste0("episode_box_ui_", i),
      episode_int = i,
      episode_df = episode_df
    )
  }
  
  callModule(mod_comments_server, "comments_ui_1", episode_df)
  
  # callModule(mod_episode_box_server, 
  #            "episode_box_ui_1", 
  #            episode_url = my_url)
}

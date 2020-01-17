#' @import shiny
#' @import dplyr
app_server <- function(input, output,session) {
  # import configuration
  config <- config::get(file = system.file("app", "config.yml", package = "rsnippets.app"))
  
  # obtain the json version of episode database
  db_file = config$db_json
  
  episode_df <- tibble::as_tibble(jsonlite::fromJSON(db_file))
  
  # sort by descending episode number
  episode_df <- episode_df %>%
    arrange(desc(episode_int))
  
  # List the first level callModules here
  # launch welcome module
  callModule(mod_welcome_server, "welcome_ui_1")
  
  # loop through the available entries in the database
  # and dynamically execute the episode module
  episode_df <- episode_df %>%
    arrange(desc(episode_int))
  
  for (i in episode_df$episode_int) {
    # launch UI portion of episode module
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
    
    # launch backend portion of episode module
    callModule(
      mod_episode_box_server,
      paste0("episode_box_ui_", i),
      episode_int = i,
      episode_df = episode_df
    )
  }
  
  # launch comments module
  callModule(mod_comments_server, "comments_ui_1", episode_df)
  
}

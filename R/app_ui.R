#' @import shiny
#' @import shinyMobile
app_ui <- function() {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here 
    f7Page(
      title = "Residual Snippets",
      init = f7Init(
        theme = "light"
      ),
      f7SingleLayout(
        navbar = f7Navbar(
          title = "Residual Snippets",
          hairline = TRUE,
          shadow = TRUE
        ),
        toolbar = f7Toolbar(
          position = "bottom",
          f7Link(label = "R-Podcast", src = "https://r-podcast.org")
        ),
        f7Card(
          title = "Test",
          p("hello"),
          footer = tagList(
            f7Button(color = "blue", label = "My button")
          )
        ),
        div(id = "add_episodes_here")
        # mod_episode_box_ui(
        #   "episode_box_ui_1",
        #   episode_title = "R-Podcast Snippet #001",
        #   episode_summary = "what's wrong, that's wrong."
        # )
      )
    )
  )
}

#' @import shiny
golem_add_external_resources <- function(){
  
  addResourcePath(
    'www', system.file('app/www', package = 'rsnippets.site')
  )
 
  tags$head(
    golem::activate_js(),
    golem::favicon()
    # Add here all the external resources
    # If you have a custom.css in the inst/app/www
    # Or for example, you can add shinyalert::useShinyalert() here
    #tags$link(rel="stylesheet", type="text/css", href="www/custom.css")
  )
}

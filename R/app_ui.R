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
        theme = "light",
        skin = "aurora"
      ),
      f7TabLayout(
        panels = NULL,
        navbar = f7Navbar(
          title = "Residual Snippets"
        ),
        f7Tabs(
          animated = TRUE,
          f7Tab(
            tabName = "Episodes",
            icon = f7Icon('volume'),
            active = TRUE,
            div(id = "add_episodes_here")
          ),
          f7Tab(
            tabName = "About",
            icon = f7Icon("home"),
            active = FALSE,
            mod_welcome_ui("welcome_ui_1")
          ),
          f7Tab(
            tabName = "Feedback",
            icon = f7Icon('email'),
            active = FALSE,
            f7Card(
              title = "Share your feedback!",
              p("If you would like to share you feedback on any of the topics discussed in the snippets,
                 you can easily do so using the comments widget powered by ", a("utterances!", href = "https://utteranc.es"),
              "All you need is a GitHub account."),
            ),
            mod_comments_ui("comments_ui_1")
          )
        )
      )
    )
  )
}

#' @import shiny
golem_add_external_resources <- function(){
  
  addResourcePath(
    'www', system.file('app', 'www', package = 'rsnippets.app')
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

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
      f7TabLayout(
        panels = NULL,
        navbar = f7Navbar(
          title = "Residual Snippets"
        ),
        f7Tabs(
          animated = TRUE,
          f7Tab(
            tabName = "Home",
            icon = f7Icon("home"),
            active = TRUE,
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
            )
          ),
          f7Tab(
            tabName = "Episodes",
            icon = f7Icon('volume'),
            active = FALSE,
            div(id = "add_episodes_here")
          ),
          f7Tab(
            tabName = "Feedback",
            icon = f7Icon('mail'),
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

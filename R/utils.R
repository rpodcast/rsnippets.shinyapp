# Convert inline markdown to HTML for use in Shiny app
# Credit: Alan Diepert 
# Source: https://tailrecursion.com/wondr/posts/shiny-inline-markdown.html
markdown <- function(s) {
  s <- gsub("\\n[ \\t]*", "\n", s)
  shiny::HTML(markdown::markdownToHTML(fragment.only = TRUE, text = s))
}

html_player <- function(episode_url) {
  HTML(glue::glue('<audio controls><source src="{episode_url}" type="audio/mpeg"></audio>'))
}

# Convert inline markdown to HTML for use in Shiny app
# Credit: Alan Diepert 
# Source: https://tailrecursion.com/wondr/posts/shiny-inline-markdown.html
markdown <- function(s) {
  s <- gsub("\\n[ \\t]*", "\n", s)
  shiny::HTML(markdown::markdownToHTML(fragment.only = TRUE, text = s))
}

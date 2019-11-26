# Commends to issue to set up Shiny app. Don't really need a file, given that I
# hope to only do this one time. But what if I make a new version of the PDF?
# Then it is handy to recall what to do. Of course, the real purpose here is to
# set a good example for students looking at this code. The rest of this project
# may be sloppy, but this part is high quality!

# Recall that the www directory is a special in a Shiny app. It is the only part
# of the app that is "open" to the internet. In order to acces a file that is
# placed there, you use:

# https://davidkane9.shinyapps.io/nra_conventions/nra.pdf

# Note that you don't need the www. The www justs tells Shiny to place anything
# in that directory so it is accessible from the "top" of the app directory
# structure.


library(fs)
file_copy("nra.pdf", "nra_shiny/www")

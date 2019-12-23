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
library(tidyverse)

dir_create("graphics")

combined_plot <- x %>% 
  group_by(date) %>% 
  summarize(gunshots = sum(gunshot), 
            totals = sum(total), 
            rate = 100000 * gunshots/totals, 
            rate_low = as.numeric(prop.test(gunshots, totals)$conf.int[1] * 100000),
            rate_high = as.numeric(prop.test(gunshots, totals)$conf.int[2] * 100000)
  ) %>% 
  ggplot(aes(date, rate)) + 
  geom_point() +
  geom_errorbar(aes(ymin = rate_low, ymax = rate_high, width = 0.1)) +
  labs(title = "Firearm Injuries among Commercially Insured Persons That Occurred\non Dates of National Rifle Association (NRA) Annual Conventions\nand on Control Dates, 2007-2015.",  
       x = "Weeks Relative to NRA Convention",
       y = "Rate of Firearm Injuries\n(beneficiaries with an injury per 100,000 persons)") +
  ylim(0, 2)
combined_plot %>% write_rds("graphics/combined.rds")

separate_plot <- ggplot(data = x, aes(date, 100000 * gunshot/total)) + 
  geom_point() +
  geom_smooth(method = "loess") + 
  scale_x_discrete(limits = seq(-3, 3, by = 1)) +
  ggtitle("Firearm Injury Rate per 100,000 Hospital Visits Around NRA Conventions") +
  ylab("Firearm Injury Rate per 100,000") +
  xlab("Weeks Around NRA Conventions")
separate_plot %>% write_rds("graphics/separate.rds")

file_copy("graphics/*", "nra_shiny")
file_copy("nra.pdf", "nra_shiny/www")
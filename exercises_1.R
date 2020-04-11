# exercises for the life coding session
library(tidyverse)


# Aesthetics --------------------------------------------------------------

# In our first example, we mapped class to the color aesthetic, 
# but we could have mapped class to the size aesthetic in the same way. 
# In this case, the exact size of each point would reveal its class affiliation. 
# Try to map class to the size aesthetic. Is it a good idea?
###
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = class))
###

# Or you could have mapped class to the alpha aesthetic, 
# which controls the transparency of the points, 
# or to the shape aesthetic, which controls the shape of the points. Try both. What 
# happens to the symbol for SUVs?
###

###

# What happens when you map a level to an aesthetic outside of aes()?
###

###


# Map a continuous variable to color, size, and shape. 
# How do these aesthetics behave differently for categorical vs. continuous variables?
###

###

# What happens if you map an aesthetic to something other than a variable name, 
# like aes(colour = displ < 5)? Note, you'll also need to specify x and y.
###

###

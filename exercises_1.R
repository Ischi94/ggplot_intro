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


# Can you set the aesthetics to a variable not included in the plot
###

###


# Facetting ---------------------------------------------------------------

# What happens if you try to facet by a continuous variable like hwy? 
###

###

# Use facetting to explore the 3-way relationship between fuel economy, engine size, 
# and number of cylinders. 
###

###



# Geometries --------------------------------------------------------------

# An important argument to geom_smooth() is the method, which allows you to choose 
# which type of model is used to fit the smooth curve.
# Look into the documentation and change the method in our plot to a linear model. 
###

###

# Can you overwrite the data argument in a subsequent geom? 
# Filter the mpg dataset for the subcompact cars within geom_smooth to display only a 
# subset of the data. 
###
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()
###

# In the previous plot, can you colour the points based on the y-axis, such as points
# above 30 get a different colour than points below.
# I don't like the legend, can you remove it?
###

###

# What is the problem with the following plot. Use geom_bin2d to solve it.
###
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price))
###

# Take the line plot and place thick wite line below the geom_line at uempmed = 10. 
###
ggplot(economics, aes(x = date, y = uempmed)) + 
  geom_line() 
###

# One challenge with the following plot is that the ordering
# of class is alphabetical, which is not terribly useful. 
# How could you change the factor levels to be more informative?
###
ggplot(mpg, aes(class, hwy)) + geom_boxplot()
###
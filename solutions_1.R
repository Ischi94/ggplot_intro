# exercises for the life coding session
library(tidyverse)


# Aesthetics --------------------------------------------------------------

# Does it matter if you call the data within the ggplot() argument or in the geom
# argument? Do you always need to type 'data = dat', 'mapping = aes()'?
###
ggplot(mpg) + 
  geom_point(aes(displ, hwy))
?geom_point
###


# In our first example, we mapped class to the colour aesthetic, 
# but we could have mapped class to the size aesthetic in the same way. 
# In this case, the exact size of each point would reveal its class affiliation. 
# Try to map class to the size aesthetic. Is it a good idea? 
# Can you improve it?
# Hint: Use alpha and/or stroke. Do we need to set it within the aes() argument?
###
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class), alpha = 1/3)
###


# Can you set both size and colour to class? What happens to the legend?
###
ggplot(mpg) +
  geom_point(aes(x = displ, y = hwy, colour = class, size = class))
###


# Or you could have mapped class to the alpha aesthetic, 
# which controls the transparency of the points, 
# or to the shape aesthetic, which controls the shape of the points. Try both. What 
# happens to the symbol for SUVs? Look at the warnings. 
###
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))
###

# What happens when you map a level to an aesthetic outside of aes()?
###
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy),  colour = class)
###


# Use our first example and colour all points blue. 
# What happens when you set one colour within aes()?
###
ggplot(mpg) +
  geom_point(aes(x = displ, y = hwy), colour = "darkblue")
###


# Map a continuous variable to color, size, and shape. 
# How do these aesthetics behave differently for categorical vs. continuous variables?
###
ggplot(mpg) +
  geom_point(aes(x = displ, y = hwy, shape = cty))
###


# What happens if you map an aesthetic to something other than a variable name, 
# like aes(colour = displ < 5)? Note, you'll also need to specify x and y.
###
ggplot(mpg) +
  geom_point(aes(x = displ, y = hwy, colour = hwy < 30))
###


# Can you set the aesthetics to a variable not included in the plot?
###
ggplot(mpg) +
  geom_point(aes(x = displ, y = hwy, colour = cty))
###


# Facetting ---------------------------------------------------------------


# What happens if you try to facet by a continuous variable like hwy? 
###
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(~ hwy)
###


# Use facetting to explore the 3-way relationship between fuel economy, engine size, 
# and number of cylinders. Can you even visualise the class in your plot?
###
ggplot(mpg, aes(displ, hwy, colour = class)) +
  geom_point() +
  facet_wrap(~ cyl)
###



# Geometries --------------------------------------------------------------


# An important argument to geom_smooth() is the method, which allows you to choose 
# which type of model is used to fit the smooth curve.
# Look into the documentation and change the method in our plot to a linear model. 
###
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(method = "lm")

?geom_smooth

###


# I don't like the grey margin of error. Change it to coral. Change the line to red.
###
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(colour = "darkred", method = "lm", fill = "coral")
###


# What happens when you set aes(group = class) in geom_smooth in the prev. plot?
# Play around with the colour and fill argument. 
###
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(aes(colour = class), method = "lm")
###


# Can you overwrite the data argument in a subsequent geom? 
# Filter the mpg dataset for the subcompact cars within geom_smooth to display only a 
# subset of the data. 
###
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"))
###


# In the previous plot, can you colour the points based on the y-axis, such as points
# above 30 get a different colour than points below.
# I don't like the legend, can you remove it?
###
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = hwy >= 30), show.legend = FALSE)
###


# What is the problem with the following plot. Use geom_bin2d to solve it.
###
ggplot(data = diamonds) +
  geom_hex(mapping = aes(x = carat, y = price))
###


# What is the problem with the following plot. Use geom_jitter to solve it.
# Can you improve the plot? 
# Hint: Use width
###
ggplot(mpg) +
  geom_jitter(aes(class, hwy), width = .2)
###

?geom_jitter
# Take the line plot and place thick wite line below the geom_line at uempmed = 10. 
# Hint: Look for a useful line_geom. 
# Can you add a red line at year 1990?
###
ggplot(economics, aes(date, uempmed)) +
  geom_hline(yintercept = 10, colour = "white", size = 3) +
  geom_line() +
  geom_vline(xintercept = 1990, colour = "red")

###


# One challenge with the following plot is that the ordering
# of class is alphabetical, which is not terribly useful. 
# How could you change the factor levels to be more informative?
# Hint: Use reorder()
# Can you sort it in a descending order?
###
ggplot(mpg, aes(reorder(class, desc(hwy)), hwy)) + geom_boxplot()
###



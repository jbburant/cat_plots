## set working directory
getwd()

# load required packages
pkgs <- c("cats", "ggplot2", "ggthemes", "ggimage")
lapply(pkgs, library, character.only = TRUE)
rm(pkgs)

## set plotting theme
theme_set(theme_few())

## download dataset
cats <- MASS::cats

## plot the relationship between cat body and heart weights
## using cats::add_cat() to add a cat image in the plot background
ggplot(data = cats, 
       mapping = aes(x = Bwt, y = Hwt)) + 
  add_cat(lighten = 0.2) + 
  geom_emoji(mapping = aes(image = ifelse(
    Sex == "F", '2764', '1f499')), 
    size = 0.025) + 
  geom_smooth(mapping = aes(colour = Sex, fill = Sex), 
              method = "lm") + 
  scale_colour_manual(values = c("red3", "steelblue1"), 
                      name = "Sex", 
                      labels = c("Female", "Male")) + 
  scale_fill_manual(values = c("red3", "steelblue1"), 
                    name = "Sex", 
                    labels = c("Female", "Male")) + 
  labs(x = "Body weight (kg)", y = "Heart weight (g)", 
       title = "Kitties and their hearts.")

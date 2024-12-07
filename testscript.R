#This line of code installs the pacman page if you do not have it installed - if you do, it simply loads the package
if(!require(pacman))install.packages("pacman")

pacman::p_load('dplyr', 'tidyr', 'gapminder',
               'ggplot2',  'ggalt',
               'forcats', 'R.utils', 'png', 
               'grid', 'ggpubr', 'scales',
               'bbplot')
install.packages("devtools")
devtools::install_github('bbc/bbplot')

data <-read.csv("C:/Users/sc004/Documents/R/Data/Pb.csv", stringsAsFactors = T, na="NA")

data_avg <- data %>%
  group_by(Year) %>%
  mutate(avg_BonePb = mean(BonePb, na.rm = TRUE)) %>%  # Calculate average BonePb per year
  ungroup()

#Make plot
line <- ggplot(data_avg, aes(x = Year, y = avg_BonePb, col = Age)) +
  geom_line(colour = "#1380A1", size = 1) +
  geom_hline(yintercept = 0, size = 1, colour="#333333") +
  bbc_style() +
  labs(title="Decreasing Iron levels",
       subtitle = "Iron levels in Otters in South-West UK 1992-2004")
line

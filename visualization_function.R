# dv function is to compare fertility and life expetancy of female between two countries
dv <- function(data, country1, country2){
  data1 <- data %>%
    filter(country == country1)
  data2 <- data %>%
    filter(country == country2)
  graph <- rbind(data.frame(country = data1$country, life = data1$life, fertility = data1$fertility),
                 data.frame(country = data2$country, life = data2$life, fertility = data2$fertility))
  ggplot(graph, mapping = aes(x = life, y = fertility, 
                              group = country, color = country, shape = country)) +
    geom_line()
}

# dv2 is to explore the the correlation of life expentancy of female and fertility in the world in these years
dv2 <- function(data){
  # data = fertility_life
  data %>%
    count(life, fertility) %>%
    ggplot(aes(x = life, y = fertility)) + 
    geom_tile(mapping = aes(fill = n))
}
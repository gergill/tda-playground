library(colourvalues)

# the penguins data set comes native in R
clean_penguins = na.omit(penguins)

# only grab numerical columns
penguin_numbers = subset(clean_penguins, select = c(bill_len, bill_dep, flipper_len, body_mass))

# normalize columns
normal_penguin_numbers = scale(penguin_numbers)

# calculate distances
penguin_dists = dist(normal_penguin_numbers, method = "euclidean")

# calculate mds
penguin_mds = cmdscale(penguin_dists)

# check how good our new distances correlate
print(cor(dist(penguin_mds, method = "euclidean"), penguin_dists))

# plot
plot(penguin_mds, pch = 20)

# plot, color by species
plot(penguin_mds, pch = 20, col = colour_values(clean_penguins$species))
plot(penguin_mds, pch = 20, col = colour_values(clean_penguins$island))


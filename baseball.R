library(colourvalues)

# pull data
teams = read.csv("Teams.csv")

# strip irrelevant or bothersome stats
teams = subset(teams, select = -c(lgID, divID, Ghome, DivWin, WCWin, WSWin, SB, CS, HBP, SF, attendance))

# these rows are quasi-duplicates, don't worry about it
teams = teams[-c(3010, 2285, 1810), ]

# clean out teams with missing values
teams = na.omit(teams)

# calculate team winrate
teams$AVG = teams$W/(teams$W + teams$L)

# only grab numeric statistics
numeric_teams = subset(teams, select = c(AVG, R, AB, H, BB, SO, RA, ER, ERA, CG, SHO, SV, IPouts, HA, HRA, BBA, SOA, E, DP, FP, BPF, PPF))

# scale columns
normal_teams = scale(numeric_teams)

# calculate distances
baseball_dist = dist(normal_teams, method = "euclidean")

# calculate mds
baseball_mds = cmdscale(baseball_dist)

# check how good our new distances correlate
print(cor(dist(baseball_mds, method = "euclidean"), baseball_dist))

# plot
plot(baseball_mds, pch = 20)

# plot and color by year
plot(baseball_mds, pch = 20, col = colour_values(teams$yearID))

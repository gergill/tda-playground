library(mappeR)

teams = read.csv("Teams.csv")
teams = subset(teams, select = -c(lgID, divID, Ghome, DivWin, WCWin, WSWin, SB, CS, HBP, SF, attendance))
teams = teams[-c(3010, 2285, 1810), ]
teams = na.omit(teams)
teams$AVG = teams$W/(teams$W + teams$L)
row.names(teams) = paste(teams$yearID, teams$name)

numeric_teams = subset(teams, select = c(AVG, R, AB, H, BB, SO, RA, ER, ERA, CG, SHO, SV, IPouts, HA, HRA, BBA, SOA, E, DP, FP, BPF, PPF))

normal_teams = scale(numeric_teams)

baseball_dist = dist(normal_teams, method = "euclidean")

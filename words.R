library(qdap)
library(usedist)
library(stringdist)
library(colourvalues)

# make data frame of top 100 words in english language
words = data.frame(Top100Words)

# make distance matrix using Levenshtein string distance
words_dist = dist_make(words, function(word1, word2) stringdist(word1, word2, method = "lv"))

# compute mds
words_mds = cmdscale(words_dist)

# check how good our new distances correlate
print(cor(dist(words_mds, method = "euclidean"), words_dist))

# plot mds, label words
plot(words_mds, pch = 20) + text(words_mds[, 1], words_mds[, 2] - .1, labels = words$Top100Words)

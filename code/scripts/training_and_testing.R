#read in the scaled data
scaled_credit <- read.csv("../../data/scaled_credit.csv", stringsAsFactors=FALSE)

#split into training and testing set
set.seed(200)
sample_size = 300
sample = sample(1:dim(scaled_credit)[1], sample_size, replace= FALSE)
training_set <- scaled_credit[sample,]
testing_set <- scaled_credit[-sample,]

save(training_set, testing_set, file = '../../data/training_and_testing.RData')

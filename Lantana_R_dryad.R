# Data from Lantana pollination experiment, Las Cruces Biological Station, Costa Rica, eperiment conducted August, 2010.

# I will now read the data into R and test to see if it was imported correctly
Lantana <- read.csv("/Users/Chris/Desktop/Manuscripts/Lantana/Lantana_data_dryad.csv", header=T)
names(Lantana)
head(Lantana)
tail(Lantana)
summary(Lantana)
sd(Lantana)
#Everything looks good!

#I like to plot data to get a visual representation of the data
L2 = cbind(Lantana[,2], Lantana[,1])
L2
dimnames(L2) =list(c(), c('Covered', 'Exposed'))
boxplot(L2, col='grey', varwidth=T, ylab='# Fertilized Ovules', xlab='Treatment Group')

#The umbels were from the same plant, so I will use a paired t-test to compare the treatment groups
t1 <- t.test(Lantana$exp_fert, Lantana$cov_fert, paired=T)
t1 #With the boxplot above, this p-value is not surprising

#Now I will look at the differences of fluoresent dye transfer for butterflies and hummingbirds

#Dye transfer sign test


#Use Fisher's exact because the expected freq is <4, small values inflate the value of the test statistic

x = as.matrix(c(275,86,313,2))
dim(x) = c(2,2)
dimnames(x) = list(c('Applied', 'Transferred'), c('Control', 'Experimental'))
x
fisher.test(x, simulate.p.value=T, B=10000, alternative='two.sided', conf.level=0.9999)
#So, the p-value is significant but more importantly the 99.99% CI does not overlap with 0. 




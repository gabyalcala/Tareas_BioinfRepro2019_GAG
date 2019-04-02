#This script run DAPC
# Load the library
library("adegenet")

# read file
mydata<- read.structure("../../data/fourpop.stru",  n.ind = 125, n.loc = 16815, onerowperind = FALSE, col.lab = 1, col.pop = 2,
                         row.marknames = 1, NA.char = "-9", ask=FALSE)

# using Kmeans and DAPC in adegenet

# setting a seed for a consistent result
set.seed(20160308) 
# identify clusters
group<- find.clusters(mydata, max.n.clust = 10, n.pca=20, choose.n.clust = FALSE)
names(group)
head(group$grp, 10) # detected 3 groups

# group sizes
table(pop(mydata), group$grp)
table.value(table(pop(mydata), group$grp), col.labels = paste("K", 1:3))

# run dapc
var<-dapc(mydata, group$grp)
dapc1<-dapc(mydata, group$grp, n.pca=20, n.da = 2)

# plot
scatter(dapc1) 

scatter(dapc1, ratio.pca = 0.3, bg="white", pch=20, cell=0, cstar=0, solid=0.3, cex=1,
        clab=0, mstree = FALSE, scree.da = FALSE, posi.pca = "bottomright", leg=TRUE)

compoplot(dapc1, subset=1:125, posi="bottomright", txt.leg=paste("Cluster", 1:3), lab="", ncol=2, xlab="individuals")



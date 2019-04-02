## This script runs 

# Load the libraries  
library("adegenet")
library("hierfstat")
library("pegas")
library("poppr")
library("ape")

# create genind object
mydata<- read.structure("../../data/fourpop.stru",  n.ind = 125, n.loc = 16815, onerowperind = FALSE, col.lab = 1, col.pop = 2,
                                 row.marknames = 1, NA.char = "-9", ask=FALSE)

# converts genind object from adegenet into a hierfstat object
mydata2<-genind2hierfstat(mydata)

# genetic diversity (observed and expected het)
diversity<-summary(mydata)
summary(diversity)

#plot observed heterozygosity per locus
plot(diversity$Hobs, xlab="Loci number", ylab="Observed Heterozygosity", 
     main="Observed heterozygosity per locus")

# calculate observed and expected heterozygosity
basicstats<-basic.stats(mydata2) # Fst following Nei 1987 on genind object
basicstats$overall

# Weir and Cockerham's estimate
W_and_C<-wc(mydata)
W_and_C

# Pairwise Fst
gendist<-genet.dist(mydata, method="WC84")
pairwisefst<-pairwise.fst(mydata)
pairwisefst

# NJ
# make make the distance matrix
mydatanj<-as.matrix(mydata)
stree = nj(dist.gene(mydatanj))

# plot the NJ tree
plot(stree, type="phylogram",cex=0.2,show.tip.label = T,direction = "rightwards",
     tip.color = "blue", plot = TRUE) 

title ("NJ tree of four populations of mexcollection data")





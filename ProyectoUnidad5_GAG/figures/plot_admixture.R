## This script make a graphic for admixture

# load the libraries
library(ggplot2)
library(tidyr)
library(dplyr)
library(readr)
library(ggpubr)


# estimate optimal K
kerror<- read.delim("../../data/admixture/CV_error.txt", header = FALSE, sep = ":")
rownames(kerror)<- c("k=1", "k=2", "k=3", "k=4", "k=5")

# plot K 
plot<- ggplot(data=kerror, aes(x=3:7, y=V2)) + geom_point() + geom_line()
plot + xlab("K") + ylab("Cross validation error")

# add samples name file
samples_name<-read.delim("../../data/admixture/fourp_names.txt", header=F)



## Plot Q for K 3
# read Q file
fileQ3=read.table("../../data/admixture/fourp.3.Q")
names(fileQ3)<-paste0("K", 1:ncol(fileQ3))

# add sample names to fileQ
fileQ3<-cbind(INDIV=samples_name$V1, fileQ3)

# transform to long format
fileQ3long<-gather(fileQ3, key=kgroup, value=Qadmixture, 2:ncol(fileQ3))

# make plot
plotad<-ggplot(fileQ3long, aes(x=INDIV, y=Qadmixture, fill=kgroup)) + geom_col() +
  theme(axis.text.x= element_blank())
plotad
## By population
# add sample names to fileQ
fileQ3.1<-cbind(POP=samples_name$V2, fileQ3)

# transform to long format
fileQlong3.1<-gather(fileQ3.1, key=kgroup, value=Qadmixture, 3:ncol(fileQ3.1))

# make plot
plotad<-ggplot(fileQlong3.1, aes(x=INDIV, y=Qadmixture, fill=kgroup)) + geom_col() +
  theme(axis.text.x= element_blank())
plotad

# order by levels 
fileQlong3.1$INDIV<-factor(fileQlong3.1$INDIV,
                           levels = fileQlong3.1$INDIV[order(fileQ3.1$POP)])
# plot
plotpop3<-ggplot(fileQlong3.1, aes(x=INDIV, y=Qadmixture, fill=kgroup)) + geom_col() +
  theme(axis.text.x= element_blank())
plotpop3


## Plot Q for K 4.
# read samples name
samples_name<-read.delim("../../data/admixture/fourp_names.txt", header=F)

# read Q file
fileQ4=read.table("../../data/admixture/fourp.4.Q")
names(fileQ4)<-paste0("K", 1:ncol(fileQ4))

# add sample names to fileQ
fileQ4<-cbind(INDIV=samples_name$V1, fileQ4)

# transform to long format
fileQ4long<-gather(fileQ4, key=kgroup, value=Qadmixture, 2:ncol(fileQ4))

# make plot
plotad<-ggplot(fileQ4long, aes(x=INDIV, y=Qadmixture, fill=kgroup)) + geom_col() +
  theme(axis.text.x= element_blank())
plotad

## By population
# add sample names to fileQ
fileQ4.1<-cbind(POP=samples_name$V2, fileQ4)

# transform to long format
fileQlong4.1<-gather(fileQ4.1, key=kgroup, value=Qadmixture, 3:ncol(fileQ4.1))

# make plot
plotad<-ggplot(fileQlong4.1, aes(x=INDIV, y=Qadmixture, fill=kgroup)) + geom_col() +
  theme(axis.text.x= element_blank())
plotad

# order by levels 
fileQlong4.1$INDIV<-factor(fileQlong4.1$INDIV,
                        levels = fileQlong4.1$INDIV[order(fileQ4.1$POP)])
# plot
plotpop4<-ggplot(fileQlong4.1, aes(x=INDIV, y=Qadmixture, fill=kgroup)) + geom_col() +
  theme(axis.text.x= element_blank())
plotpop4


## Plot Q for K 5
# read Q file
fileQ5=read.table("../../data/admixture/fourp.5.Q")
names(fileQ5)<-paste0("K", 1:ncol(fileQ5))

# add sample names to fileQ
fileQ5<-cbind(INDIV=samples_name$V1, fileQ5)

# transform to long format
fileQ5long<-gather(fileQ5, key=kgroup, value=Qadmixture, 2:ncol(fileQ5))

# make plot
plotad<-ggplot(fileQ5long, aes(x=INDIV, y=Qadmixture, fill=kgroup)) + geom_col() +
  theme(axis.text.x= element_blank())
plotad

## By population
# add sample names to fileQ
fileQ5.1<-cbind(POP=samples_name$V2, fileQ5)

# transform to long format
fileQlong5.1<-gather(fileQ5.1, key=kgroup, value=Qadmixture, 3:ncol(fileQ5.1))

# make plot
plotad<-ggplot(fileQlong5.1, aes(x=INDIV, y=Qadmixture, fill=kgroup)) + geom_col() +
  theme(axis.text.x= element_blank())
plotad

# order by levels 
fileQlong5.1$INDIV<-factor(fileQlong5.1$INDIV,
                           levels = fileQlong5.1$INDIV[order(fileQ5.1$POP)])
# plot
plotpop5<-ggplot(fileQlong5.1, aes(x=INDIV, y=Qadmixture, fill=kgroup)) + geom_col() +
  theme(axis.text.x= element_blank())
plotpop5

# make multipanel plot
allplots<-ggarrange(plotpop3, plotpop4, plotpop5, nrow=3)
allplots








dat<-read.csv("Occupancy.csv")
head(dat)

colnames(dat)
#######for loop for all species across all sites
#part 1 the container
ave.occ<-NULL

#number of loops
spp<-unique(dat$Species)
num<-length(unique(spp))

#part 2: the call
for (i in 1:num){
  #part 3: the routine
  tmp<-dat[dat$Species==spp[i],]
  ave.occ[i]<-mean(tmp$Occupancy,na.rm=TRUE)
}
names(ave.occ)<-spp


###for loop within site by species
ave.occ.site<-list(NULL)


sites<-unique(dat$Site)
s.num<-length(sites)

for (j in 1:s.num){
  s.tmp<-dat[dat$Site==sites[j],]
  spp<-unique(s.tmp$Species)
  num<-length(unique(spp))
  
  ave.occ2<-NULL
  
  for (i in 1:num){
    
    tmp<-s.tmp[s.tmp$Species==spp[i],]
    ave.occ2[i]<-mean(tmp$Occupancy,na.rm=TRUE)
  }
  names(ave.occ2)<-spp
  
  ave.occ.site[[j]]<-ave.occ2
}
names(ave.occ.site)<-sites

###pull out data for a site from this list
ave.occ.site[[1]]

#first apply function
lapply(ave.occ.site,mean,na.rm=TRUE)

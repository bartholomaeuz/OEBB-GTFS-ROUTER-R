library(gtfsrouter)
#Download Data from https://data.oebb.at/
gtfs<-extract_gtfs("GFTS_Fahrplan_OEBB.zip")
#Select date (today)
gtfs2 <- gtfs_timetable(gtfs,date="20220509")
#Get traveltimes between 12 and 13 
bm<-gtfs_traveltimes(gtfs2,
from="Bruck/Mur Bahnhof",
start_time_limits=c(12,16)*3600,
max_traveltime=90*60)
write.csv(bm,"bm.csv")
plot(bm$stop_lon,bm$stop_lat)
text(bm$stop_lon,bm$stop_lat,bm$stop_name,cex=0.6,pos=4,col="red")

#Get Route at 12:35
fn_kb<-gtfs_route(gtfs2,
from="Frohnleiten Bahnhof",
to="Kapfenberg Bahnhof",
start_time=12*3600+35*60)
write.csv(fn_kb,"fn_kb.csv")

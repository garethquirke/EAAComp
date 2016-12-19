 # Ui vs N
 # Di vs N
 # X0 vs N
 # R vs N

 # 
  # setwd('~/Documents/College/CA2/EAAComp/CA2/')

 # results.dat is a file with the results stored inside
 # read.table() reads this file in table format and the additional parameter here notes that the first line contains the names of the variables 
  results <- read.table('results.dat', header=TRUE)

 # pTime represents how long each process ran for: 10 seconds
  pTime <- 10

 # CO N Idle values will be taken from this file

 # number of completed tasks
  completedTransactions <- results$CO

 # total number of concurrent users which ranges from 1 -> 50
  totalUsers <- results$N

 # total idle time
  idle <- results$Idle


 # GRAPH 1
 # Utilization: (total time busy) / (total time observed)
 # idle gives us the resources not being used by the system, lets use this to find total time busy
 # busy give us 0.00 -> 100.00 result. This represents a percentage of the busy time
 # dividing the total time observing the process by 10 gives us the result /100
  busy <- (100 - idle) * (pTime/10)

 # summary function gives us min, max, median (in particular) based on our data
  summary(busy)

 # exporting the plot data as a jpeg
  jpeg(filename="ui-VS-n.jpg")

 # as the number of users increase in the y-axis we expect a rise in the levels of utilization of the system
  plot(busy,totalUsers,xlab="Ui(cpu)", ylab="N(users)", main="ui vs n")

 # finish exporting to an image file
  dev.off()

 # The other graphs rely on throughput to be calculated prior
   tPut <- completedTransactions / pTime

 # GRAPH 2
 # Di: service demand: (Utilization / throughput)
 # dividing by the time slice to view per second
   serviceDemand <- (busy / tPut)
   
   summary(serviceDemand)
   jpeg(filename="Di-VS-N.jpg")
   plot(totalUsers,serviceDemand,xlab="N(users)", ylab="Di(Service Demand)",main="Di vs n")
   dev.off()

 # GRAPH 3
 # X0: Throughput: (Completed tasks / time)
   summary(tPut)
   jpeg(filename="X0-VS-N.jpg")
   plot(totalUsers,tPut,xlab="N(users)",ylab="X0(Throughput)",main="X0 vs N")
   dev.off()

 # GRAPH 4
 # R: Response time: (Number of users / Throughput)
   responseTime <- totalUsers / tPut

   summary(responseTime)
   jpeg(filename="R-VS-N.jpg")
   plot(totalUsers,responseTime ,xlab="N(users)",ylab="R(Response Time)",main="R vs N")
   dev.off()

 

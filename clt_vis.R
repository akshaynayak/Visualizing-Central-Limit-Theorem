clt_vis_func<-function(dist_type="N",sample.size=100,no.of.samples=400,lambda=4)
{
x=matrix(nrow=1,ncol=no.of.samples)
library(grDevices)

if(dist_type=="N")
{
  #drawing "no.of.samples" samples each of size "sample.size" from a normal distribution
x[1,]=apply(matrix(replicate(no.of.samples, rnorm(sample.size)), sample.size), 2, mean)

#limiting the x axis to 3 quantiles of the sampling distribution
xlim=quantile(x[1,],c(0.005,0.995))

hist(x[1,],freq = FALSE,xlab="xbar",main = "",xlim=xlim)
#plotting the density function of the sampling distribution in the line below
lines(density(x[1,]), col = "blue")

#rnorm by default draws samples from distribution with mean 0 and sd 1
  pop_mean=0
  pop_sd=1

  #plotting the normal distribution whose mean whose mean=population mean and standard deviation is pop_sd/sqrt(samplesize)
  curve(dnorm(x, pop_mean, pop_sd/sqrt(sample.size)), col = "red", lty = 2, 
        add = TRUE)
}
 else if(dist_type=="E")
   {
    #drawing samples from exponential distribution and storing the mean of each of those samples in x
    x[1,]=apply(matrix(replicate(no.of.samples, rexp(sample.size)), sample.size), 2, mean)
    library(grDevices)
    xlim=quantile(x[1,],c(0.005,0.995))

    hist(x[1,],freq = FALSE,xlab="xbar",main="",xlim=xlim)
    lines(density(x[1,]), col = "blue")
    
    #rexp() by default draws samples from exponential function whose rate=1, mean=sd=1/rate
    pop_mean=1
    pop_sd=1
    curve(dnorm(x, pop_mean, pop_sd/sqrt(sample.size)), col = "red", lty = 2, 
          add = TRUE)
    
     }
else if(dist_type=="U")
{
  #drawing samples from a uniform distribution
  x[1,]=apply(matrix(replicate(no.of.samples, runif(sample.size)), sample.size), 2, mean)
  
  xlim=quantile(x[1,],c(0.005,0.995))
  
  #plotting the histogram of means of the samples and the density function
  hist(x[1,],freq = FALSE,xlab="xbar",main="",xlim = xlim)
  lines(density(x[1,]), col = "blue")
  
  #by default a=0 and b=1 for runif. so the mean=1/b-a and sd=abs(b-a)/sqrt(12)
  pop_mean=0.5
  pop_sd=1/sqrt(12)
  
   curve(dnorm(x, pop_mean, pop_sd/sqrt(sample.size)), col = "red", lty = 2, 
        add = TRUE)
  
}
else if(dist_type=="P")
{
  #drawing samples from a uniform distribution
  x[1,]=apply(matrix(replicate(no.of.samples, rpois(sample.size,lambda)), sample.size), 2, mean)
  
  xlim=quantile(x[1,],c(0.005,0.995))
  
  #plotting the histogram of means of the samples and the density function
  hist(x[1,],freq = FALSE,xlab="xbar",main="",xlim = xlim)
  lines(density(x[1,]), col = "blue")
  
  #the mean and the sd of the poisson distribution is lambda 
  pop_mean=lambda
  pop_sd=sqrt(lambda)
  
  curve(dnorm(x, pop_mean, pop_sd/sqrt(sample.size)), col = "red", lty = 2, 
        add = TRUE)
  
}
  
}
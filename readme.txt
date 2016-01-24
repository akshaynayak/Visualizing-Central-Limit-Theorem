Open the clt_vis.R file into RStudio
Press source button so that the following command gets executed
source('C:/pathto the file/clt_vis.R')
The clt_vis_func() should appear in the environment 

The function takes the following arguments:
1. dist_type
It can take the following parameters
	.default argument is "N" for normal dist
	"E" for exponential distribution
	"U" for uniform dist
	"P" poisson dist
2. sample.size- for the size of the samples to be drawn from the population dist
default is 100
3. no.of.samples
the no of samples to be drawn from the population distribution
default is set to 400
4. lambda
default 4 
required only for poisson distribution

sample exectuions:Execute as a regular function call
clt_vis_func("N",100,400)
clt_vis_func("U",150,500)
clt_vis_func("E",70,250)
clt_vis_func("P",60,300,16)			#Tip:take values of lambda that are perfect squares as its easier to evaluate population_sd(sqrt(lambda)) and hence sd of sampling distribution which is:pop_sd/sqrt(sample.size) 

Output:
The histogram of the means of the samples drawn is plotted.
The blue line is the density function
the red line is the density function of the normal distribution with mean=pop mean and sd=pop_sd/sqrt(sample.size)
so as sample size increases the blue line and red line start overlaping.
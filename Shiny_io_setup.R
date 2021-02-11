#Install rsconnect
install.packages('rsconnect')

#Authorise account
rsconnect::setAccountInfo(name='markwarren', 
                          token='28F44D298B0C2C4CF57574918AB94FC9', 
                          secret='tr4Nw/vc07b+hSpW5ifgMPUaB/MzchxIbywAjlDU')

#Deploy
library(rsconnect)
rsconnect::deployApp('Users/Mark/Rcode/RShiny_Learn/shiny.rstudio.com-tutorial/First_slider_code')

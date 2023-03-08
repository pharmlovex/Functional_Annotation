
# Package Management  -----------------------------------------------------

list.of.packages <- c("VennDiagram", "stringr", "tidyr", "SPARQL", "RCurl", 
                      "igraph", "ggplot2","reshape2")
new.packages <- 
  list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)>0) install.packages(new.packages)

#Install disgenet2r by typing in R:
  
library(devtools)

install_bitbucket("ibi_group/disgenet2r")

#To load the package:
library(disgenet2r)


password =.rs.askForPassword("Password:")

api<-get_disgenet_api_key("ifedayoo.ojo@gmail.com", password = password)

# Retrieving disease association  -----------------------------------------

hub_genes = c("EGR1","ZEP36","JUNB","CCNL1","SOCS3","NAMPT","NEAT1",
              "EOS","MCL1","BTG2")
results <- gene2disease(gene = hub_genes, verbose = T,
                        api_key = api)

View(results@qresult)

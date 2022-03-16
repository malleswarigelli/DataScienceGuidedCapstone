getwd()
setwd('C:/Users/gellima/Desktop/Springboard_DScience/CAPSTONE_3/Soybase/SNP Density Plot')

## Seyi's edit
library(dplyr)
library(reshape2)
library(ggplot2)
##Data with only chromosomes
snps = read.csv("SNPS_CHR.csv", header = T)
unique(snps$CHROM)
max(snps$POS)
head(snps)
snps$CHROM = as.factor(snps$CHROM)

##Creating data to count number of snps for each group
snps = snps%>% mutate(vals = case_when(0 < POS & POS< 1000000 ~ 1,
                                       1000001 < POS & POS < 2000000 ~ 2,
                                       2000001 < POS & POS < 3000000 ~ 3,
                                       3000001 < POS & POS < 4000000 ~ 4,
                                       4000001 < POS & POS < 5000000 ~ 5,
                                       5000001 < POS & POS < 6000000 ~ 6,
                                       6000001 < POS & POS < 7000000 ~ 7,
                                       7000001 < POS & POS < 8000000 ~ 8,
                                       8000001 < POS & POS < 9000000 ~ 9,
                                       9000001 < POS & POS < 10000000 ~ 10,
                                       10000001 < POS & POS < 11000000 ~ 11,
                                       11000001 < POS & POS < 12000000 ~ 12,
                                       12000001 < POS & POS < 13000000 ~ 13,
                                       13000001 < POS & POS < 14000000 ~ 14,
                                       14000001 < POS & POS < 15000000 ~ 15,
                                       15000001 < POS & POS < 16000000 ~ 16,
                                       16000001 < POS & POS < 17000000 ~ 17,
                                       17000001 < POS & POS < 18000000 ~ 18,
                                       18000001 < POS & POS < 19000000 ~ 19,
                                       19000001 < POS & POS < 20000000 ~ 20,
                                       20000001 < POS & POS < 21000000 ~ 21,
                                       21000001 < POS & POS < 22000000 ~ 22,
                                       22000001 < POS & POS < 23000000 ~ 23,
                                       23000001 < POS & POS < 24000000 ~ 24,
                                       24000001 < POS & POS < 25000000 ~ 25,
                                       25000001 < POS & POS < 26000000 ~ 26,
                                       26000001 < POS & POS < 27000000 ~ 27,
                                       27000001 < POS & POS < 28000000 ~ 28,
                                       28000001 < POS & POS < 29000000 ~ 29,
                                       29000001 < POS & POS < 30000000 ~ 30,
                                       30000001 < POS & POS < 31000000 ~ 31,
                                       31000001 < POS & POS < 32000000 ~ 32,
                                       32000001 < POS & POS < 33000000 ~ 33,
                                       33000001 < POS & POS < 34000000 ~ 34,
                                       34000001 < POS & POS < 35000000 ~ 35,
                                       35000001 < POS & POS < 36000000 ~ 36,
                                       36000001 < POS & POS < 37000000 ~ 37,
                                       37000001 < POS & POS < 38000000 ~ 38,
                                       38000001 < POS & POS < 39000000 ~ 39,
                                       39000001 < POS & POS < 40000000 ~ 40,
                                       40000001 < POS & POS < 41000000 ~ 41,
                                       41000001 < POS & POS < 42000000 ~ 42,
                                       42000001 < POS & POS < 43000000 ~ 43,
                                       43000001 < POS & POS < 44000000 ~ 44,
                                       44000001 < POS & POS < 45000000 ~ 45,
                                       45000001 < POS & POS < 46000000 ~ 46,
                                       46000001 < POS & POS < 47000000 ~ 47,
                                       47000001 < POS & POS < 48000000 ~ 48,
                                       48000001 < POS & POS < 49000000 ~ 49,
                                       49000001 < POS & POS < 50000000 ~ 50,
                                       50000001 < POS & POS < 51000000 ~ 51,
                                       51000001 < POS & POS < 52000000 ~ 52,
                                       52000001 < POS & POS < 53000000 ~ 53,
                                       53000001 < POS & POS < 54000000 ~ 54,
                                       54000001 < POS & POS < 55000000 ~ 55,
                                       55000001 < POS & POS < 56000000 ~ 56,
                                       56000001 < POS & POS < 57000000 ~ 57,
                                       57000001 < POS & POS < 58000000 ~ 58,
                                       58000001 < POS & POS < 59000000 ~ 59,
                                       59000001 < POS & POS < 60000000 ~ 60))

head(snps)

##Counting the number of snps in each group
snps_1 = snps %>%  count(CHROM, vals)
unique(snps_1$CHROM)
colnames(snps_1) = c("CHR", "Megabase", "POS")
head(snps_1)


##Plot of the snps
P = ggplot(snps_1, aes(x = CHR, y =1 , fill = POS)) +
  geom_bar(stat = "identity") +
  scale_fill_gradientn(colours=rainbow(100)) +
  labs(y = "Megabases", x = "Chromosome")+
  theme_classic()
P + coord_flip()




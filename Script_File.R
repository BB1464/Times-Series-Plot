## loading of my library ####
library(tidyverse)
library(readxl)
library(patchwork)
#data<-read_excel(file.choose(),sheet ='Sheet2' )
data<-read.csv('data.csv')
data$Month<-factor(data$Month,levels = c('2020 Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec','2021 Jan','.Feb','.Mar','.Apr'))

theme_set(theme_classic())
p1<-ggplot(data,aes(Month,Rainfall))+geom_col(fill='blue')+
  labs(x='Month',y='Rainfall (mm)')+
  theme(axis.title = element_text(size=12,face='bold',family = 'serif'),
        axis.text = element_text(size=12,face='bold',family='serif'),
        axis.line = element_line(size = 1,colour='black'),
        axis.ticks = element_line(size=1,colour = 'black'))+
  scale_y_continuous(expand = c(0,0))


p2<-ggplot(data,aes(Month,Min.T,group=1))+geom_point(colour='red',size=2)+geom_line(colour='red',size=1.5)+geom_point(colour='black',size=2,aes(Month,MaxT))+geom_line(colour='black',size=1.5,aes(Month,MaxT))+
  scale_y_continuous(name='Minimum Temperature (°C)',sec.axis = sec_axis(trans = ~./0.9,name = 'Maximum Temperature (°C)'))+
  theme(axis.title.y.right =  element_text(vjust=3,size=12,face = 'bold',family = 'serif'),axis.text.y.right = element_text(size=12,face='bold',family = 'serif'),
        axis.line.y.right = element_line(size=1.3,colour='black'),
        axis.ticks.y.right = element_line(size=1,colour = 'black'),
        axis.title.y.left = element_text(vjust=3,size=12,face='bold',family = 'serif',colour='red'),
        axis.text.y.left = element_text(size=12,face = 'bold',family = 'serif',colour='red'),
        axis.line.y.left = element_line(size=1,colour = 'red'),
        axis.ticks.y.left=element_line(size=1,colour='red'),
        axis.title.x = element_text(size=12,face='bold',family = 'serif'),
        axis.text.x = element_text(size=12,face='bold',family = 'serif'),
        axis.ticks.x = element_line(size=1),
        axis.line.x = element_line(size=1))
p1/p2

ggsave('plot.tiff',height = 5,width = 6,dpi = 300)        
        
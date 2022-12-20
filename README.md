# OWID Climate Change CO2 Data Analysis

## Main Questions:
1. What industry is creating the most CO2?
2. Which countries emit the most CO2 per emmission type?
3. How much CO2 is the world emitting? 

## Technical Goals
1. Create a Pie Chart
2. Learn how to use reorder function in bar charts

## What Industry is creating the most CO2?

The main emission types found in the data set are: oil, gas, coal, cement, flaring, and other. One thing to understand is that the data measures is calculated in million tonnes. So a small amount is actually a lot in the grand scheme of things. 

This is the emission type spread for the most recent year in the US


![Rplot](https://user-images.githubusercontent.com/77668770/207967868-e74edb83-5fe3-4980-8853-1cb75d72c31c.png)

It is clear that oil, gas, and coal are the main emission types that emit the most CO2 by a large margin. This doesn't mean that the other emission types blow signficantly less amounts of CO2 in the air, they respectively stil emit plenty of CO2. The data for the recent year show that cement had 41.203 million tonnes of CO2, flaring had 67.684 million tonnes, and other had 25.332 million tonnes. That is still a lot, it's just that the big 3 create so much more it makes those numbers look miniscule. 

This is the emissiontype spread for the most recent year in the world

![Rplot](https://user-images.githubusercontent.com/77668770/207968053-2068bd60-fab3-4313-99bd-16714348a40f.png)

It has pretty much the same spread as the US. 

## Which country emit the most CO2 per emission type?

So looking at the top 3 instigators for CO2 we have: coal, gas, and oil. One of the things that I was really interested in was who were the top 10 for each emission type. I was also specifically looking at how the US ranks in each category. 

Staring off with gas, this is the top 10 countries that have emitted the most CO2 in the gas industry. 

![Rplot03](https://user-images.githubusercontent.com/77668770/207968444-be795865-e736-4f20-896f-62966f2a60ca.png)

The US is leading by a huge margine in terms of gas with Russia not even half of what the US has emitted in the past year. 

Up next is the coal industry, this is the top 10 countries that have emitted the most CO2 in the coal industry. 

![coal_bar](https://user-images.githubusercontent.com/77668770/207968745-b6be1670-a9b7-4899-8f3a-56686b2e00a2.png)

China lead's by an extreme amount. The gap between China and the next country is significantly larger than what the US had over russia in the gas industry. One thing to note is that the US is third in this category. 

Finally is the oil industry, this is the top 10 countries that have emitted the most CO2 in the oil industry. 

![oil_bar](https://user-images.githubusercontent.com/77668770/207969063-899f4a36-f08d-406a-bc85-9bf4baf57617.png)

The gap between one and two is not as large as before in terms of the oil industry. The US is leading in terms of the oil industry and have now lead in two categories and is top 3 in all categories. 

## How much CO2 is the world emitting?
So looking at the top 3 categories in the US and over the world, I wanted to look at a line graph of how has it changed over time.

![us_line](https://user-images.githubusercontent.com/77668770/207969317-5785dd89-0d3a-4571-8c0c-92f6684acfac.png)

So this is the US change over time in terms of the top 3 industries that emit CO2. What we can see here is that oil is the leading cause of CO2 in the US in the most recent years. The first big boom really came from the gas industry from the early 1900's. I was expecting coal to be more of a bigger culprit but it only recently did it increase in emission. Coal is the only increasing industry in the recent years. While has has been on a sharp decline in the pasy few years. 

Now I want to look at the differences between the world and the US, to see if there is any difference at all.

![world_line](https://user-images.githubusercontent.com/77668770/207970208-474ca116-537a-46ca-8c76-7b179100f36f.png)

So looking at the world, it has been steadily increasing for most of the industries. One thing to take note is that instead of oil being the number one cuplrit in the US, for the world it is actually gas. The whole world is emitting more CO2 from gas than CO2. One thingthat is steady with the US is that coal is the lowest out of the 3 but is increasing in the recent years. For the most part the biggest difference is gas topping oil, the main indicator in my mind would be the amount of cars that the US use especially compared to the whole world. 



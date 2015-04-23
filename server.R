# Loading the dataset corresponding to historical housing prices
setwd("./mydata")
housingdata <- read.csv("ex1data2.txt")

# Building a Linear Regression Model
names(housingdata) <- c("sqfeet","num_bedrooms","price")
model <- lm(price ~ .,data=housingdata)

# Server side processing
shinyServer(
	function(input, output)	{
	# Code wrapped in a reactive function as input parameters are utilized
	predicted_price <- reactive({topredict <- data.frame(input$sqfeet,input$nbedrooms)
		names(topredict) <- c("sqfeet","num_bedrooms")
		predicted_price <- predict(model, newdata=topredict) # Predicting the house prices for user input
	})
	output$prediction <- renderPrint({as.integer(predicted_price())}) # Output variable to store the predicted price
	}
)


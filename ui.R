# Load the shiny package
library(shiny)

# Build the User Interface

shinyUI(pageWithSidebar(
	# Application title
	headerPanel("Housing Prices Prediction"),
	sidebarPanel(
		numericInput('sqfeet','Square Feet',1500,min=1000,max=5000,step=5), # Enter Square Feet of the house
		numericInput('nbedrooms','Number of Bedrooms',3,min=1,max=8,step=1), # Enter Number of Bedrooms in the house
		submitButton('Submit')
	),
	mainPanel(
		p('This application predicts the house prices based on historical data available in a particular locality. The features used are Square Feet and number of bedrooms. This application can be utilized by Real Estate Agents to find suitable buyers for homes'),
		h3('Results of prediction'),
		h4('Price of the house '),
		verbatimTextOutput("prediction") # Predicted value of the house
	)
  )
)
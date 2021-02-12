## data_mid_bootcamp_project_classification
## Table of contents
* General information
* Technologies
* Business analytic approach
* Recommendations

## General information
#### Situation: 
- The bank wants to understand the  demographics and other characteristics of its customers that accept a credit card offer and that do not accept a credit card. 
- The bank designs a focused marketing study, with 18,000 current bank customers and use existing demographic data that is already available on each customer. 

#### Objectives: 
- Build a model that will provide insight into why some bank customers accept credit card offers. 
- There are also other potential areas of opportunities that the bank wants to understand from the data. 
- Help the senior management to understand their customers better. 

## Technologies
- MySQL
- Python
- Tableau

## Business analytics approach 
#### Data wrangling:

- We removed the null values in Average Balance
- We kept the outliers, because there was no significant difference on the performance of the model
- We clustered columns: Household Size, #Credit Cards Held, #Bank Accounts Open, #Homes Owned

#### Data exploration:
- There was class imballance in Offer Accepted, in Overdraft Protection, #Homes Owned, #Bank Accounts Open
- The Average Balance was really skewed
- There was no multicollinearity between the features
- The related feautures to the target are all categorical features
- The Average Balance has no effect on the customer to accept the credit card or not

#### Data pre-prossing:
- We converted all categoricals, ordinals and numericals
- We used different scalers to reduce the data between two values, the range 0 and 1. The different scalers we use are Normalizer, StandardScaler, MinMaxScaler and PowerTransformer
- To deal with the class imbalance we used different sampling technics. these are Under Sampling, Up Sampling and Tomek Links

#### Data prediction:
- For our classification model we used Logistic Regression, K-Neighbors Classifier and Decision Tree
- We choose the model with the MinMaxScaler, Under Sampling and Logistic Regression
- We focused on an as much as high possible value for the recall, the accuracy and the Kappa score

#### Data visualization:
- We compared the objectives of the bank managers with our target feature
- We find most of the objectives has a positive outcome for credit card acceptance, except for Credit Rating
- We did some more analysis on the Credit Rating, especially the Low value
- We looked at other demographics to get an understanding of relationship between features

https://public.tableau.com/profile/sheila.brugman#!/vizhome/project_classification_final/ProjectClassification

## Recommendations
- We recommend to gather more data concerning transactional behavior of the customers, to be able to do a better prediction on one of the objectives, the credit rating, since from the current data the customers which have a low credit rating are most likely to accept the offer 
- We recommend to focus on the customers that have a high probability to accept the credit card offer with the characteristics of owning their home, have a larger household of 3 and got less than two credit cards held
- Based on the current data the best way to offer the credit card is by postcard, but since there might be better options at this moment, ie email (newsletters) and social media something to consider as well
- Another interesting criteria to focus on would be customers with no overdraft protection, who are most likely to accept the offer 


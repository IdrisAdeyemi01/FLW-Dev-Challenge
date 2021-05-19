# FLUTTERWAVE DEVELOPERS CHALLENGE

### By **Idris Idris** and **Musa AbdulKareem**

### Problem Statement
A group of business owners want to create an e-commerce market place (Codename: Jumga). Something like Jumia or Konga. They hope to set up their services in Nigeria, Ghana, Kenya and the UK for starters. You have been tapped as one of the possible dev candidates to handle setting up the payments side of things for the marketplace.

### Technologies:
Flutter, Figma, Draw.io, Flutterwave API, Firebase

The problem isn’t much: it’s to create a payment solution for a group of business owners who want to create an e-commerce marketplace. In building this, we read and explored the well-documented Flutterwave v3 solution and explored the different payment methods available to make online transaction easy and accessible to the customers, irrespective of the means or currency.

Our solution is a mobile application that merchants can set-up and sell products in and customers can find and buy the products. To do this, we started with an intention of making the next order of our users available to them without stress. This is made possible by creating a platform where selling products is as easy as uploading display picture on their regular social network and the payment method is as fast as retweeting a tweet, thanks to Flutterwave.

The payment solutions for different countries were different as Nigerian solutions were to use Nigerian banks, Ghana uses mobile money and the likes.

The sharing of the money based on percentage was done using the split-payment portion of the API whereby it was easy to split payment as every registered merchant's account details was added to the list of sub-accounts using the Flutterwave API

The structure of the application was mapped out using ‘Draw.io’ and every experience the user would feel was carefully designed using Figma, with a design system that prioritize clarity and easy navigation. The application was built using Flutter and the payment was powered by Flutterwave v3 with Firebase hosting the back end. 

### ![The Structure](./JUMGA-Structure.jpg)

### User Privilege:
There are three hierarchy of users for this application:
1.	The Unregistered User
2.	The Registered User
3.	The Merchant

#### The Unregistered User:
The application is designed for an unregistered user to buy products with ease using the different payment methods provided by Flutterwave. An unregistered user can add as many products as he wants to buy and use any of the payment methods based on convenient. 
![The payment path](./JUMGA-Payment.jpg)

#### The Registered User:
A registered user can perform all the functions an unregistered user can with an extra privilege. A registered user can seamlessly populate their data at checkout to avoid the little time spent entering the data. A registered user can decide to create an easier way of inputting their payment details anytime they want to buy a new product. A registered user can create a virtual card which can be used to make payment on the application and also on other payment solutions and this is done using one of the features of Flutterwave API.

#### The Merchant:

Only a registered user can become a merchant. An unregistered user who wishes to own a store on the application would have to register before doing so. A registered user can become a merchant by creating a store and paying a token of $20 which after the payment’s confirmation, the store is assigned a dispatch rider and can be populated with products. With the Flutterwave v3 API, the payment can be done using different methods and in different currencies.

Sub-account is created for each one of the merchants and dispatch riders. And an assigned percentage of their fee gets to the Jumga – 2.5% for merchant and 2% for riders - and this is done with the good features that comes with Flutterwave v3. When someone buys different products from different merchants in the market. We wrote a model to classify the products based on the shops and calculate their amount accordingly and used Flutterwave v3 API to pay the merchants based on the amount of product the user has bought from them. 
The payments are authorized and everyone is happy. 
![The merchant's path](./JUMGA-Merchant.jpg)

#### [This is the link to the apk file](https://drive.google.com/drive/folders/1sUUf2xBqQBe81ANW0H_WkK828ooXx0Cp?usp=sharing)

### Challenges
1. It was not quite easy to navigate through the API, we got the whole process late after thorough reading of both the documentation and the reference. We used POSTMAN to test the APIs too
2. We encountered a problem when using the API on Flutter as their are no dart specific guides in the API doc, we solved one of those problems though by adding 'Content-Type': 'application/json' to our http POST header.
3. We are both junior developers at the time of taking the challenge but then, we took it up.

### Recommendation to the Flutterwave team
1. Inclusion of dart specific walkthrough in the API doc
2. Provision of Flutterwave's Flutter SDK to make integration easier

**Thanks to Flutterwave.**

**NOTE: More work is ongoing for the completion of this project at the moment**



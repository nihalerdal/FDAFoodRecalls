# FDAFoodRecalls

## Overview
An iOS app to allows users to see the firms and their products that have been actively recalled as class-I(reasonable probability that the use of, or exposure to, a violative product will cause serious adverse health consequences or death) by the FDA in the US. By tapping on the firm name on the map view, the user would be able to see details of the recall including the distributed quantity, entire product name and the reason of the recall. 

Please see screenshots below for the functionality of the app

<kbd><img src="https://user-images.githubusercontent.com/61894386/153771577-75831804-2ab4-48ac-9715-d50cd78ed90e.png" width="320" height="700"><kbd>
 
<kbd><img src="https://user-images.githubusercontent.com/61894386/153772594-05a0b25c-6991-41da-9238-b57674b16552.png" width="320" height="700"><kbd>
 
<kbd><img src="https://user-images.githubusercontent.com/61894386/153771581-9bbfebf7-b451-4c56-826c-d1c8ba309cc3.png" width="320" height="700"><kbd>

This app was completed as the final project for Udacity course - Become an iOS Developer - and uses fundamental princinples of iOS development such as:
 
• UIKit & Generics\
• URLSessions to interact with a public restful API\
• Network Requests\
• Core Data for local persistence of an object structure

Language: Swift\
Final Project for: Udacity - Become an iOS Developer
 
 ## Implementation
 
The main view of the app displays the firms with the recalled product by their addresses on the map. This feature of the app connects to the FDA API to receive product details.  This view uses Core Data and fetchedResultsController for local persistence. If the user taps on any pin, the app segues to the recallDescriptionVC where provides some details like the distributed quantity of the product. If user taps on a row in recallDescriptionVC, the app navigates to the detailReportVC and user can see more details including reason of the recall from the recall report. 
 
FDA API: <https://www.accessdata.fda.gov/scripts/ires/apidocs/> 

## Contributing
Please feel free to contribute to **FDAFoodRecalls**. Fork and clone this repository, then make a pull request once you have pushed your changes.
 
 ## How to build
This project can run without any additional setup. 
 
 ## Requirements
Xcode 13 or above\
Swift 4 or above
 
 ## Maintainers
@nihalerdal
 
 

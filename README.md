# *¡Por Vida! Mobile*

## Table of Contents

## Overview

# Description #

**¡Por Vida! Mobile** is the mobile version of the City of San Antonio's "¡Por Vida!" website, which indicates retaurants located around the city of San Antonio, Texas, that cook healthier, affordable meals.

# App Evaluation #

- Category: Lifestyle

- Mobile: This app offers easier to use controls for updating restaurant data, and will possess or more user friendly map of restaurant locations.

- Story: Allows users to locate restaurants that offer healthier foods, giving people better options to stay healthy and still eat out.

- Market: The city of San Antonio are encouraged to use this app at any time; Por vida is a San Antonio organization and is meant to offer anyone better, healthier food options.

- Habit: An average user would use this app at any time they choose to go out to eat. The app will show various menu items for any restaurant, including general menus and kids menus.

- Scope: The bare-bones of this app will allow users to see menus of participating restuarants, so long as the admins of the app continue to update the database with restaurants that are part of Por Vida.


# Product Spec

## 1. User Stories

The following user stories are complete:

- [x] List of restaurants participating in Por Vida, including their contact information and address
- [x] The menus of the participating restaurants (including kid and adult menus)
- [x] Admin sign in to allow updates to changes in restaurant information, including loction and menus
- [x] An easy-to-use map of all participating restaurants


The following **additional** user stories are implemented:
- [ ] The ability to tap on a restaurant on the map to view its menu
- [ ] Link to download Healthy Trail PDF in multiple languages
- [ ] Links to extraneous information included on the website (such as business partner information)
- [ ] Settings to control (ie language settings)

## 2. Navigation

## Flow Navigation (Screen to screen)
- ### Menus ###
   - Restaurant button connects to list of restaurants, which each restaurant cell bringing up tje detailed view of the restaurant meals
- ### Kids ###
   - Pulls up restaurants with kids menus
- ### Map ###
   - Opens a map that displays the locations of all restaurants
- ### Admin Page ###
   - Top right button brings admin to add new restaurants and restaurant information
   
## Wireframe (brought to you by Figma)
<img src='https://i.imgur.com/xeRksFY.png' title='Por Vida Wireframe' width='' alt='Por Vida Wireframe' />

## Schema

## Model (in progress)
| Property | Type | Description |
|----------|------|-------------|
| currentLocation | PFGeoPoint | The current location of the user |
| restaurant | String | The restaurant a user wants to find |
|restaurantLocation |PFGeoPoint|Current coordinates of restaurant|
|address|String| Address of restaurant
|phone|String| Phone number of resturant
|website|String| Website of resturants
|hours|String| Restaurants business hours|
|menu|String| Por vida approve menu items
|restaurantLogo|String| The restraurant's logo|

## Networking

* Main Menu:

* Restaurants
    * (Read/GET) - Query all restaurants in the database

* Kids' Menu
    * (Read/GET) - Query all restaurants that have a kids menu

* Restaurant Menu
    * (Read/GET) - Query the menu information about the selected restraurant

* Restaurant Locations
    * (Read/GET) - Query all restraurant locations
    ```swift
        let query = PFQuery(className:"Restaurant")
        query.whereKey("restaurantLocation", equalTo:"restaurant")
        query.findObjectsInBackground { (restaurants: [PFObject]?, error: Error?) in
        if let error = error {
            // Log details of the failure
            print(error.localizedDescription)
        } else if let restaurants = restaurants {
            // The find succeeded.
            print("Successfully retrieved \(restaurants.count) locations.")
            // Display the address/locations of restaurants
            for restaurant in restaurants {
                print(restaurant.objectId as Any)
            }
        }}
    ```
    
* Business Partners
    * (No Queries)

* Restraurant Details
    * (Read/GET) - Query the details about the selected restraurant

* Settings
    * (No Queries)

* Login Screen
    * (Update/PUT?) - Query to login?

## Notes

Describe any challenges encountered while building the app.

## License 



    Copyright 2020 Team TAMUSA

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

[Click here to see the Apache License page](https://www.apache.org/licenses/LICENSE-2.0). doodly doot. 


## Video Walkthrough

A walkthrough of the current layout for the Por Vida Mobile app:

<img src='https://raw.githubusercontent.com/TempSchoolAcct/TotallyRealMathSolutions/master/test.gif' title='Por Vida Walkthrough' width='' alt='Por Vida Walkthrough' />

A walkthrough of the layout for Por Vida Mobile using Figma:

<img src='https://recordit.co/ljDTeQkJDs.gif' title='Por Vida Walkthrough' width='' alt='Por Vida Walkthrough' />

# *¡Por Vida! Mobile*

**¡Por Vida! Mobile** is the mobile version of the City of San Antonio's "¡Por Vida!" website, which indicates retaurants located around the city of San Antonio, Texas, that cook healthier, affordable meals.

Time spent: **4** hours spent in total

## Video Walkthrough

A walkthrough of the layout for Por Vida Mobile using Figma:

<img src='https://recordit.co/ljDTeQkJDs.gif' title='Por Vida Walkthrough' width='' alt='Por Vida Walkthrough' />

## User Stories

The following user stories are complete:

- [ ] List of restaurants participating in Por Vida, including their contact information and address
- [ ] The menus of the participating restaurants (including kid and adult menus)
- [ ] An easy-to-use map of all participating restaurants
- [ ] Settings to control (ie language settings)

The following **additional** user stories are implemented:

- [ ] Admin sign in to allow updates to changes in restaurant information, including loction and menus
- [ ] Link to download Healthy Trail PDF in multiple languages
- [ ] Links to extraneous information included on the website (such as business partner information)

## Wireframe
<img src='https://i.imgur.com/xeRksFY.png' title='Por Vida Wireframe' width='' alt='Por Vida Wireframe' />

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

# Market Money

This repo is meant to practice building an API. You will be building an API that exposes information about Farmer's Market's in the United States. Your API will have the ability to show all farmers markets, search for markets based on particular criteria, and find ATM's near the Farmer's Market's (since a lot of market's use cash).

## Setup

You will need to seed your database to have Farmers Market's to work with. Follow the below directions to get your repository set up for development: 

1. `git clone <repo ssh>`
2. `cd market_money`
3. `bundle install`
4. `rails db:{create,migrate,seed}`

Run `rails c` and check that you have 8675 markets.
If so, you're ready to get started!

## Directions

You will be building out 4 endpoints:
1. Get All Markets
2. Get One Market by Id
3. Get All Markets by name, city, state, or zip
4. Get closest ATMs near the Farmer's Market.

Below is a breakdown of each endpoint.

### Get All Markets 

Request:
```
/api/v0/markets
```

Example Response: 
```json
{
    "data": [
        {
            "id": "1",
            "type": "market",
            "attributes": {
                "fmid": 1012063,
                "name": " Caledonia Farmers Market Association - Danville",
                "street": null,
                "city": "Danville ",
                "county": "Caledonia",
                "state": "Vermont",
                "zip": "05828"
            }
        },
        {
            "id": "2",
            "type": "market",
            "attributes": {
                "fmid": 1011871,
                "name": " Stearns Homestead Farmers' Market",
                "street": "6975 Ridge Road",
                "city": "Parma ",
                "county": "Cuyahoga",
                "state": "Ohio",
                "zip": "44130"
            }
        },
        {...},
        {...},
        ...
        ...
    ]
}
```

### Get One Market by Id

Request:
```
/api/v0/markets/1012063
```

Example Response:

```json
{
    "data": {
        "id": "26027",
        "type": "market",
        "attributes": {
            "fmid": 1012063,
            "name": " Caledonia Farmers Market Association - Danville",
            "street": null,
            "city": "Danville ",
            "county": "Caledonia",
            "state": "Vermont",
            "zip": "05828"
        }
    }
}
```

Notes: 
* The market id that is send in the url should be the Farmer's Market Id, NOT the id from our database.
* If an invalid FMID is given, render a 404 error with a descriptive message.


### Get All Markets by name, city, state, or zip

Request:
```
api/v0/markets?name=Pearl
```

Example Response:
```json
{
    "data": [
        {
            "id": "31883",
            "type": "market",
            "attributes": {
                "fmid": 1001938,
                "name": "Pearl Farmers Market",
                "street": "303 Pearl Parkway",
                "city": "San Antonio",
                "county": "Bexar",
                "state": "Texas",
                "zip": "78215"
            }
        },
        {
            "id": "31884",
            "type": "market",
            "attributes": {
                "fmid": 1007427,
                "name": "Pearl Farmers Market",
                "street": "6th Street and Peoria Avenue",
                "city": "Tulsa",
                "county": "Tulsa",
                "state": "Oklahoma",
                "zip": "74120"
            }
        },
        {...},
        {...},
        ...
        ...
    ]
}
```

Request:
```
api/v0/markets/search?name=Pearl&city=Denver
```

Example Response:
```json
{
    "data": [
        {
            "id": "33048",
            "type": "market",
            "attributes": {
                "fmid": 1002313,
                "name": "South Pearl Street Farmers' Market",
                "street": "1500 S. Pearl Street",
                "city": "Denver",
                "county": "Denver",
                "state": "Colorado",
                "zip": "80210"
            }
        }
    ]
}
```

Notes: 
* This endpoint can take in query parameters for `name`,`city`,`state`, or `zip`. Any combination of them can be sent at any time.
* If no query parameters are sent back, a messages should get sent back that notifies the user that they must supply 1 of 4 possible query parameters.
* The search is case insensitive. So, if I had a parameter for `"city"=>"Denver"`, this would give me back the same response as the parameter `"city"=>"denver"`
* City and State should both be case insensitive 
* Zip must match what is passed in
* Name should be a case insensitive fragment search
* If no markets match the search criteria given, an empty array should be returned for the `data` value.



### Get closest ATMs near the Farmer's Market.

Request: 
```
api/v0/markets/1002313/nearest_atm
```

Example Response: 

```json
{
    "data": [
        {
            "id": null,
            "type": "atm",
            "attributes": {
                "name": "Metabank",
                "address": "1518 South Pearl Street, Denver, CO 80210",
                "lat": 39.689,
                "lon": -104.98011,
                "distance": 0.042179981516042665
            }
        },
        {
            "id": null,
            "type": "atm",
            "attributes": {
                "name": "Lynk Systems",
                "address": "1500 South Pearl Street, Denver, CO 80210",
                "lat": 39.68922,
                "lon": -104.98011,
                "distance": 0.056150646536912215
            }
        },
        {
            "id": null,
            "type": "atm",
            "attributes": {
                "name": "Atm",
                "address": "1477 South Pearl Street, Denver, CO 80210",
                "lat": 39.6897,
                "lon": -104.98076,
                "distance": 0.08732449203259186
            }
        },
        {
            "id": null,
            "type": "atm",
            "attributes": {
                "name": "Metabank",
                "address": "1475 South Pearl Street, Denver, CO 80210",
                "lat": 39.68985,
                "lon": -104.98057,
                "distance": 0.0964631149452528
            }
        },
        {...},
        ...
        ...
    ]
}
```

Notes: 
* You will need to utilize the [TomTom API](https://developer.tomtom.com/) for this. Specifically, the category search endpoint. Find a category that would work for ATM's, and use the API to find ATM's near the location of the Farmer's Market. 
* Similar to finding a market by id, this market id in the URI should be the Farmer's Market Id. 
* If an invalid FMID is given, render a 404 error with a descriptive message.

![rails-badge](https://img.shields.io/badge/Rails-5.2.6-informational?style=flat-square) ![ruby-badge](https://img.shields.io/badge/Ruby-2.7.2-informational?style=flat-square)

# Sweater Weather

This repository is a fully functional/callable API that aggregates various outside APIs and combines them into useful endpoints ready to be called. These Endpoint are set up to be used in a weather app with current, hourly, and daily weather data. Another useful endpoint that will make the weather app stand out from the rest is the ability to pick an origin and a destination and automatically get the weather of the destination when you are scheduled to arrive.

# Learning Goals
- Combine multiple outside APIs into my own API
- Make an API that would be useful to others
- Get a better understanding of API consumptions and exposures
- Get a better understanding of fully testing APIs (both ones I consume and expose)
- Become better at structuring my API responses and triming out the data that is not useful

# Readme Content
- [Sweater Weather Endpoints](#sweater-weather-endpoints)
- [Stack](#stack)
- [Local Setup](#local-setup)
- [Contributors](#contributors)

#### Sweater Weather Endpoints
  - `GET /api/v1/forecast?location=location`
    - This endpoint lets you get the current, hourly, and daily weather at the given location
  - `GET /api/v1/backgrounds?location=location`
    - This enpoint gives you a background image to use from the given location
  - `POST /api/v1/road_trip`
    - This endpoint allows you to enter an origin and destination and gives you the travel time and weather information based on the time you would get to the destination
    - This API need a JSON payload with an origin, destination and api key

#### Stack
- Ruby on Rails, RSpec, PostgreSQL
- Some of the gems: jsonapi-serializer, pry, simplecov, vcr, webmock, figaro, bcrypt


# Local Setup
- Versions
  - Rails 5.2.6
  - Ruby 2.7.2
- Fork and clone the [repository](https://github.com/michab17/sweater_weather)
- `cd` in your local repo version and run the following commands
  - To install gems:
    -  `bundle` (if this fails, try to `bundle update` and then retry)
  - This API uses a few [external APIs](#external-apis)
    - Add a local application.yml file at the root (this will be ignored in gitcoverage)
    - Sign up for a free [Mapquest](https://developer.mapquest.com/plan_purchase/steps/business_edition/business_edition_free/register) account to get a key for both the Geolocation and a Direction apis
    - Get an API key for [OpenWeather](https://openweathermap.org/api/one-call-api) 
    - Get an API key for [Unsplash](https://unsplash.com/documentation) 
    - Add to your application.yml config: 
    ```
      mapquest_api_key: your_key_here
      OpenWeather_api_key: your_key_here
      Unsplash_api_key: your_key_here

    ```
  - To setup database:
    - `rails db:create`
    - `rails db:migrate`
    - `rails db:seed`
- Run your own development server:
  - `rails s`
  - Local server address is:  "http://localhost:3000" 

# External APIs
This API consumes the following APIs:
- [Twilio](https://www.twilio.com/docs/sms/api) to send text messages
- [MapQuest Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/) to provide map image


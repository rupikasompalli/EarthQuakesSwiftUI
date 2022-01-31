# EarthQuakesSwiftUI

![Simulator Screen Shot - iPod touch (7th generation) - 2022-01-31 at 12 59 16](https://user-images.githubusercontent.com/47827901/151847619-b475c60c-2c98-4c41-8a42-f876702f16b7.png)
![Simulator Screen Shot - iPod touch (7th generation) - 2022-01-31 at 12 59 53](https://user-images.githubusercontent.com/47827901/151847691-0f105741-6bab-4fc6-80e4-5d2bb0f9b0de.png)
![Simulator Screen Shot - iPod touch (7th generation) - 2022-01-31 at 13 00 12](https://user-images.githubusercontent.com/47827901/151847746-a3a8427c-319d-4b60-a11d-112e45cdaf07.png)
![Simulator Screen Shot - iPod touch (7th generation) - 2022-01-31 at 13 00 02](https://user-images.githubusercontent.com/47827901/151847709-3cea3bcc-5743-41a7-9aea-4010b8e6f91e.png)

### Architecture

## MVVM

## Features


- EarthQuakeListings:

This view shows a list of earth quake listings fetching from a sample json. 
The view model uses Combine publisher subscribe mechansim to let view know about the data fetch events and update view when data is downloaded

- FilterView:

This view has two basic filter types
1- Filter by Magnitude
2- Filter by Depth

When one of type is selected, this view sends out a notification with the type selected, and the previous view model listens to the notification and updates the earth quake list based on the filter selected


## Services

- EarthQuakeService

This is responsible for fetching earth quake data


## AppEnvironment

This implements two protocols. 
1- Environment

A single point of access for shared services like EarthQuakeService 

2- AppFactory

This implements a factory pattern to build views for the app.

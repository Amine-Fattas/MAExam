# MAExam

## Overview:
- Deployment Target : **iOS 15.4**
- The projet follows a modular design inspired from VIPER architecture
- The projet contains 2 independant modules (Users, Tasks) that both depend on a Shared Module arranged verticaly (by feature).
- Each module module contains layers that are arranged horizontaly (by dependency level).
- The most recent update is in the _main_ branch.
- The project is accompagned with anAutomated Acceptance Test Suit (IHM) that conform to the most of the **Stories** (explained below).
- Comment: For time constraints, The Caching implemntation is done with NSCache. Contrary to CoreData, It is not persistent (The cache is deleted when app terminates). It can be upgraded to CoreData easily in the future by changing just the implementation of the protocol _CacheStore_.

## Story 1 (Customer requests to see the list of users)

#### Narrative #1
As an online customer 
I want the app to automatically load my user list

***Scenarios (Acceptance criteria)***
Given the customer has connectivity 
When the customer requests to see the user list
Then the app should display the list of users from remote
And replace the cache with the new list

#### Narrative #2
As an offline customer
I want the app to show the latest saved version of my list of users

***Scenarios (Acceptance criteria)***
Given the customer doesn’t have connectivity 
And there is a cached version of the user list
When the customer requests to see the user list
Then the app should display the last saved list of users from cache

Given the customer doesn’t have connectivity 
And the cache is empty
When the customer requests to see the user list
Then the app should display an error message

## Story 2 (Customer Clicks on an user item)

#### Narrative #1
As an online customer 
I want the app to automatically load tasks list of the selected user

###### Scenarios (Acceptance criteria)
Given the customer has connectivity 
When the customer selects an user element in the user list
Then the app should display the list of tasks of that user from remote
And replace the cache with the new list

#### Narrative #2
As an offline customer
I want the app to show the latest saved version of my list of tasks

###### Scenarios (Acceptance criteria)
Given the customer doesn’t have connectivity 
And there is a cached version of the task list
When the customer select an user element in the task list
Then the app should display the last saved list of tasks from cache

Given the customer doesn’t have connectivity 
And the cache is empty
When the customer requests to see the tasks list
Then the app should display an error message

## Dependecy graph:
The dependecy levels are such as : 
- UIComposer -> UI -> Presentation -> InteractorInterface -> Domain
- RemoteInteractor -> InteractorInterface && LocalInteractor -> InteractorInterface -> Domain
- API Infra (URLSession) -> InteractorInterface -> Domain
- Cache Infra (NSCache)  -> InteractorInterface -> Domain

## Room to futher improve the projet (if there was time):
- Isolated Unit Tests.
- Snapshot Tests.
- Upgrade NSCache to CoreData.
- iPadView (Devided double screen).
- Extract feature folders to their own Framworks.

# User List App

## Overview
Completed Task to render users list from provided API. 

## UserList App

The user list app is a small app that:

- Renders a list of users
- Fetches data from the public API:
    **https://jsonplaceholder.typicode.com/users**
- Shows loading, success, and error states

## Approach

- Created Reusable APIClient that can be used for different kind of end points.
- Used MVVM Architecture to make code clean, redable and testable.
- Dependency injection via protocol based implementation.
- API layer uses asyn/await to for structured concurrency. 
- Created Declarative UI implementation using swift UI using ViewState Enum.
- Implemented Unit test using swift testing to cover multiple test cases 


##Tasks

### 1. Fix the Existing Bugs

- Found the bug is on UserAPIClient where response expect objects containting user key which is incorrect and decoder throws typemismatched.
- To fix this issue, I need to use array of users for decoding as [User] directly.
- Loading and error states behave properly

### 2. Implement the Refresh feature
Implemented refresh features as refresh is tapped it will trigger the API which also showing loading screen before populating API response on the screen. 
Adding delying to make proper loading screen visible as users will know that new data is fetching from API.

### 3. Add Unit Tests
- Unit testing has been added. 
- Mock data has been created and which has been compare to verify the functionality is working correctly.

View model functionality has been cover with the proper unit testing with the mock data provided. 


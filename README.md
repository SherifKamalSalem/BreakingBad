# Breaking Bad

Breaking Bad is an application for showing the breaking bad TV series characters' information using MVVM design pattern, dependency injection, Combine, and SwiftUI Framework.

## Installation

Clone the project and open it by Xcode directly I didn't use any third-party libraries and here is a video for the task.

## Features

- Characters list
- Search for a character by the name
- Select a character row to show its details
- Character Details view
- Unit testing for CharactersListViewModel


## Architecture

- SwiftUI
- MVVM An important point in MVVM is that it uses a binder as communication tool between View and ViewModel layers. A technique named Data Binding is used.
- Combine
- Dependency injection

## Networking

I've created the network module using combine framework and tried to apply separation of concerns and make network module decoupled from any business logic and implementation details so it can be testable and resuable 

## Video


https://user-images.githubusercontent.com/11644741/187509922-189093da-a2a3-4db4-a6b0-5d77cb6495ae.mp4





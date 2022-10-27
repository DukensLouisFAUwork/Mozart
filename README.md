Original App Design Project - README Template
===

# Mozart


## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
This is application is going to be a music app that is inspired by spotify. It will sync the users playlist from sptofiy. It will also allow the user to find new music. 

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Music/Streaming
- **Mobile:** The application will be displayed.
- **Story:** Allows to acess spotify playlist. Create and add music to playlist. Sync playlist to spotify. The user will be able to search up artist. 
- **Market:** Anyone that likes to stream music. 
- **Habit:** Users can listen to as many songs as they like, ad-free, from their playlist or from a selected artist. Users can create new playlists and add as many songs as they want to them. 
- **Scope:** This app will aim to be focused on streaming music, adding songs to playlists and viewing artists discography.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* click on artist/username to be taken to their profile page
* sync spotify profile playlist
* can listen to songs on spotify
* user can add songs to playlists
* login / logout
* stay signed in between sessions
* pull spotify recommended playlists 
* ...

**Optional Nice-to-have Stories**

* genre labels for songs & album
* ability to see album that the song appears on
* search songs from spotify database/api
* search albums from spotify database/api
* ...

### 2. Screen Archetypes

* Register Screen
    * sets users infomation to database
* Login Screen
    * login / logout
    * stay signed in between sessions

* Discover Music/Playlists
    * Disover Music is Playlsit that is recommend by Spotify
* Your Playlists
    * sync spotify profile playlist
    * user can add songs to playlists
* Playlists
    * playlist is list of the songs
    * contains artist names and songs
* Artist
    * list of songs 

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Your Playlists
* Discover new playlists (populated from Spotify API)
* logOut

**Flow Navigation** (Screen to Screen)

* Login/Register
   * Login has register button <-> Register has login button
   * once logged in, it takes you to -> Your Playlists
   * text box for user name and password
   * date of birth is add for registor
* Your Playlists 
   * Is connected to a tab navagation bar to acess -> Discover
   * logout button takes to -> login screen
  
* Discover
   * Is connecte to a tab navagation bar to acess discover
   * Once a playlist is tapped it takes it to -> playlist screen
   * logout button takes to -> login screen

* Playlist
   * Playlist opens up the list of songs contain.
   * If you click on name it takes you to -> Artist
   * logout button takes to -> login screen
* Artist
   * logout button takes to -> login screen


## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
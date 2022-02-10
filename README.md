# Bluepad-Frontend-Assignment
In this assignment, I have designed a flutter application with two screens: one for authentication and another for displaying an infinite scroll of images with pagination of 10 at a time to users. I utilised shared preferences to save the user's username and password so he wouldn't have to log in again the next time he opened the programme. The home page has an Appbar with a title and a logout button, as well as a card that displays the user credentials. The photographs are fetched via api from https://picsum.photos/ and loaded ten at a time using listview builder.

# Pics online
You can download the app-release.apk file, install it and run pics_online on your android mobile straight away!

****Page 1: Login Page****


<img src="https://user-images.githubusercontent.com/45164745/153407360-6a24410c-cab2-41f1-92eb-39a910e8fe78.png" height="300">

_Username: admin
Password: admin123_
As mentioned in the assignment I have checked the user credentials against a hardcoded value. If a wrong username and password is entered then an error message will be displayed.


 <img src="https://user-images.githubusercontent.com/45164745/153407806-61adc949-1e88-46c9-a252-dd78de3419b5.png" height="300">
 <img src="https://user-images.githubusercontent.com/45164745/153407818-93908e99-088c-49e6-914f-158ce033d958.png" height="300">
 ****Page 2: Home Page****
 
  <img src="https://user-images.githubusercontent.com/45164745/153407927-1f0ab05f-a2fc-4453-a59a-31be9d78b507.png" height="300">
 
The Home page has an appbar with the app name and a logout button. Initially, the picsum api returns 10 photos. When the user scrolls to the bottom of the page, the event listener retrieves 10 more images from the API, achieving an endless scroll with a pagination of 10 images at a time.

 <img src="https://user-images.githubusercontent.com/45164745/153408687-e4a4a02e-e276-4616-87ad-315bd62a5973.png" height="300">

Clicking the logout button in the appbar returns you to the login page and displays a snack bar informing you that you have logged out.

 <img src="https://user-images.githubusercontent.com/45164745/153408898-a0a7c515-f291-478d-b75d-54ebd95ff291.png" height="300">

![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)

# Assignment 1: Intro to Storyboards

### PROMPT

**Goal**: Build a simple app that displays a login scene and segues into a short bio and goals for yourself.

For this first assignment you will build a simple app with a Scene that simulates a login process and a Scene that contains a short personal bio.

You'll learn how to navigate Xcode and Interface Builder and quickly prototype **multi-scene apps**.

**VIDEO:** We've outlined the steps to help you build your first assignment. Before you jump in, watch [this video](https://youtu.be/zrlmYGrtx3w) to understand how your application should function.

**You will be working individually for this project**, but we'll be guiding you along the process and helping as you go.

---

### DELIVERABLES

Your app must:

* use a storyboard,
* start with a login scene with email and password text fields,
* have a login button that when tapped shows a scene with a picture,
* have buttons labeled "Info" and "Goals" that each push a new scene, and
* follow the specific requirements and constraints below.


#### View Controller 1: Login Scene

**Part 1**: Create a login scene by adding two text fields and a button that says "Submit" to the initial view controller. (Not the navigation controller.)

* Configure the first text field such that when the user taps it, the keyboard that pops up is an email-entry keyboard. The second text field should obscure the typed text (i.e. be a password field).
* Hint: When creating the second text field for the user's password, make sure you select the "Secure Text Entry" property of the `UITextField`.


#### View Controller 2: Images and Text Fields

**Part 2**: When the user taps on the "Submit" button on the login scene, the app should segue to a new view controller. 

* Create a new view controller
* When the user clicks on the "SUbmit" button, we want to start a "push segue" to the new view controller
* To set it up, control + mouse click from the "Submit" button and drag the blue line into the new scene. Let go. When the context menu appears, select "Show".
* Add a label to display your name
* Add an image
* Add two buttons, one called "Info" and one called "Goals"


#### View Controller 3: Segues

**Part 3**: When tapped, the "Info" button in the scene should display a view controller via a modal segue (animated from bottom to top). That view controller should contain a short bio of you.

* Create a new view controller and drag it into the storyboard canvas and connect a new modal segue from the "Info" button to it.
* Add a text view to the view controller and place your bio there.

**Part 4**: When tapped, the "Goals" button of the app should push segue to a new view controller. This page contains text that describes a short blurb about what you’re hoping to get out of this class. The text should be red and bold. Below the text should be an image of one of your favorite things.

* Create a new view controller and drag it into the storyboard canvas and connect a new push segue from the "Goals" button to it.
* Add a image view containing an image of a cat or a dog.
* Add a text view below the image and write a short blurb explaining your goals for the course.


#### Advanced

**Part 5**: The top righthand side of the navigation bar on the "Goals" scene should have another button called "Info." When the user taps it, another scene should appear via a push segue.

* From the "Goals" view controller, add a bar button item to the right side of the navigation bar at the top.
* When tapped, the "Info" button should push the info view controller on onto the scene stack

---
### SUBMISSION

* Send a zipped copy of your completed project to David in a private Slack message.

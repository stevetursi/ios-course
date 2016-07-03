![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)

# Assignment 2: IBOutlets and IBActions

### Prompt
Build an app with four screens (scenes). The main (root) screen should have three buttons called: "Age Verification", "Bill Splitter", and "Guess the Number". Each button should segue (show) a new view controller on the navigation stack. (You should be using a navigation controller!)

The first view controller (Age Verification) will have a input for text. The user should be able to input the year they were born. It should also have a "Verify" button. When tapped the app should display a result to the user. The result should follow these rules: if the user is over 21, the result should say: "You can drink, vote and drive." If the user is over 18, the result should say: "You can vote and drive." If the user is over 16, the result should say: "You can drive." Otherwise, the result should say something about the user being a baby.

The second view controller (Bill Splotter) should have a few input fields. One should be for a number, the amound of a bill we want to split. The next should be for a number, the tip percentage the group wants to leave. Finally, there should be input for the number of times to split the bill. There should also be a result that tells everyone how much each person owes. For example: Bill = $100, tip percent = 20%, number of people = 5, the result should be: $24.00. And lastly there should be a button to calculate this number.

The third view controller (Guess the Number) should have one input from the user, a number. It should be the users guess of what the computer will pick. For example, let the user pick a number between 1 and 10. There should be a result that says if the user guessed correctly or not. And finally, there should be a button that allows the computer to guess a number. Hint: Look into using arc4random_uniform() to generate a random number.

### Layout Example
![](https://github.com/ga-students/IOS-NYC-9/blob/master/Assignments/Assignment02/layout_example.png)

### Submission
Submit your project using Github. David will share a getting started guide!

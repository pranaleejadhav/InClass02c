# InClass02c


## Part 1 : Home View Controller

The interface should be created to match the UI presented in Figure 1(a). The
requirements are as follows:

1. The home view controller should be embedded in a navigation controller to provide
the transition to the Profile View Controller.

2. Upon clicking “Submit”

  - If any of the user missed any of the profile fields display an alert dialog indicating
the missing field.
  - If all the fields are provided correctly, then store the provided data in a User
Object. Then pass the User object to the Profile View Controller and then display
the Profile View Controller


## Part 2 : Profile View Controller

The interface should be created to match the UI presented in Figure 1(b). The
requirements are as follows:

1. Upon loading the Profile View Controller, it should display the content of the User
object as shown in Figure 1(b).

2. Note that the Password Label is displayed as “****”, the number of stars should match
the number of characters in the password field.

3. If the “Show” button is clicked the Password Label should show the actual password
field. Then the “Show” button text should be changed to “Hide”, upon clicking “Hide”
the password field should be hidden using the “*****” as done when loading the View
Controller, and then the “Hide” button text should be changed to “Show”.

4. Clicking the “Edit” button beside each field should open the corresponding Edit View
Controller using a “Present Modally” Segue.

## Part 3 : Edit View Controllers

The interface should be created to match the UI presented in Figure 2. Feel free to
create multiple view controllers to provide the different functionality required for this part.
The requirements are as follows:

1. The view controller should populate the Text View with the passed current value of
the parameter to be changed. For example, if the user name is “Bob Smith” the view
controller should show “Bob Smith” which can be edited by the user. When the user
clicks the “Update” button, the view controller should pass the updated value to the
Profile View Controller, and should dismiss the Edit View Controller.

2. Note that the Edit View controller is displayed using “Present Modally”, you should
consider using “Unwind Segues” to pass data back to the Profile View Controller.

3. Upon returning to the Profile View Controller, the updated value should be updated
and displayed in the Profile View Controller.

# GARAGE

GARAGE will save you from having to keep your cars' service dates in your head, remind you about insurance, and keep your cars' service history.

Features
=====================
- user authorisation
- password recovery 
- car information storage
- service scheduling
- reminder receipt
- service history storage
- data deletion and modification
- deadline visualisation
---
Installation 
=====================
Download the source code and compile it yourself using Xcode. If you want to run it on your device, you will also need an Apple developer account.

Registration
-----------------------------------
Launch the application and register. If you need to recover your password, please click the "Forgot password" link.

Settings
-----------------------------------
To make full use of the app, in the device settings, turn on notifications.

Adding cars 
-----------------------------------
Create cars using the "Add" button. Use the scroll left to view your car fleet. The car becomes active when you click on a cell.
It is possible to change information about a car using the button in the upper right corner.
To create a maintenance notification, use the "Add" button after selecting a specific car.

Notifications
-----------------------------------
When creating a maintenance service, you need to specify the due date or mileage at which you want to notify about the service.
The application will request to update the car mileage at each login (necessary for correct operation of the notification service, if the scheduled maintenance depends on the actual car mileage).

History
-----------------------------------
Mark a scheduled service as completed to move it to History. The page stores all performed services for each car.

Instruments
=====================
Firebase: Authentication, Realtime Database

---
UIKit

---
SwiftUI

---
Localize_swift








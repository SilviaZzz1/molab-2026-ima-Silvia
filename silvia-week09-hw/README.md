Week 09 — Firebase MakeItSo

Progress

This week, I chose Option 1 and worked with the MakeItSo tutorial from the class repository.

I created my own Firebase project and connected it to the MakeItSo Xcode project using my app’s Bundle Identifier. I also created a Cloud Firestore database in test mode and replaced the original Firebase configuration with my own GoogleService-Info.plist.

After setting everything up, I was able to run the app, create reminders, and confirm that the data was successfully saved to my Firestore database.

Problems

One problem I encountered was that the app initially could not find ContentView, so I changed the starting view to RemindersListView.

I also had an issue with the Firebase configuration file. My downloaded file was named GoogleService-Info 2.plist, while Firebase requires it to be named exactly GoogleService-Info.plist. After removing the old configuration file and renaming my new one, Firebase connected successfully.

I also added GoogleService-Info.plist to .gitignore so that my Firebase configuration file would not be uploaded to GitHub.

Plans

For my final project, I want to continue exploring Firebase and use what I learned this week for PawHome, a shared pet-care app. I am interested in using Firebase to allow multiple people to access and update information about the same pet.

Questions

How can I structure Firestore data when multiple users need access to the same shared information?

How can I manage different users and permissions within one shared space?

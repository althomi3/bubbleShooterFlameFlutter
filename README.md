
# Game: Brick Breaker meets Bubble Shooter
This is a mobile game developed with Flutter and Flame. The idea is to give the good old Bubble Shooter game a revival and merge it with game mechanics from the famous Brick Breaker Game. 

## How to Run the Game 

### Access

For a human-friendly formatted ReadMe and the source code, open the Github project: https://github.com/althomi3/bubbleShooterFlameFlutter

The app is available in the browser under the following URL: https://bubble-shooter-revival.web.app

It is recommended to open the app on a smartphone for best look and feel. The app is optimized for dimensions 390 x 844 which represents an iPhone 12 Pro. For testing app responsiveness, it is recommended to use the dev tools in a browser.

!!!!!!!!!!!!
If you want to run the app via your local IDE, navigate to the root folder. Rename the "src" folder to "lib". Then, start the app with "flutter run". If dependencies need to be updated, run "flutter pub get" and try restarting the app with "flutter run".
!!!!!!!!!!!!


If you miss a specific platform support, e.g., web, you can add support for all platforms by running "flutter create ." You can also add a specific platform support via "flutter create --platforms=web ." . Then retry opening the app with "flutter run". 


### How the Game Works
- start the game by tapping the start button
- select the first enabled level
- the game starts automatically
- Loose: let the ball drop through the floor, which navigates you to the result screen
- Win: the shooting ball changes its color randomly every time it collides with a target ball. You can destroy a target ball by hitting it with the shooting ball if it has the same color. Destroy all target balls. The game will automatically detect the win and navigate you to the level screen, where you can choose the next level that is now enabled.

# Assignment Requirements
## Clear Idea and Purpose 
As the introduction above describes, the game idea is clear and based on legacy games using foundational game mechanics.
In the game, the user has the goal to break free into the galaxy. The purpose of the game focuses on coordination and fun.

## Screen Architecture and Navigation
The game has a start screen, a level selection screen, a game screen, and a result screen. The navigation between the screens is intuitive. For the navigation, the natural gaming flow was anticipated and additional navigation elements were added to allow the user to move between finite states. Example: the game screen has an action to end the game, or the level screen contains an action to return to the start screen.
Smart navigation was enabled that navigates the user based on game state. Example: if the user won and unlocked a new level, the user is automatically navigated to the level screen to see the newly unlocked level as an incentive.

## Responsiveness
- The screens are responsive, and there is at least one breakpoint that influences the layout. The breakpoint causes the layout to change for medium-sized screens, such as tablets and changes the button layout of the level screen to fit the wider width.

- In addition to the breakpoint, the application features a maximum width that is used to limit the width of the shown content on devices with a high resolution. 

- The game itself uses the CameraComponent’s withFixedResolution constructor. However, due to the old-school design, the game components maintain a fixed scale. This is also due to the fact that the game is rather static compared to a jump-and-run game.

### Responsive Graphics
The background graphic was selected with a high resolution so that it provides an immersive and high quality experience for different screen sizes.

## Levels
The game has three levels that the player can complete. The difficulty increases throughout the levels by an increase in the number of balls the user needs to shoot off. Example: level 1: 2 rows, level 2: 4 rows.

## Persistent Data 
The player's progress is stored persistently between app starts by using Hive storage.

## Tocuh Optimized 
Playing the game does not require a keyboard or a mouse (i.e., it could be played with a touchscreen device).
Game elements were specifically optimized for touch interaction. E.g., the bat behaviour was adjusted to simulate a feeling of "sticking" to the finger instead of quickly jumping around horizontally. In addition, the bat was increased in height so that players have a visually relatable touch area and can maintain visual control while holding pressing their finger on the bat. Of course, this could be improved for different hand sizes.
Still, keyboard control is enabled to make the game accessible via a laptop.

## Deployment
The game is deployed with Firebase and accessible online via the link provided above.

## Some improvement ideas
- using a timer as an additional game mechanism to increase game excitement
- using visually appealing assets for the game balls that fit the galactic theme
- adding info to the game screen, such as level
- storing a score history to show progress on cracking the current level
- improving experience when winning a game through animations



Credentials: Project in scope of the course Device-Agnostic Design at Aalto University, 2025, by Alischa Thomas

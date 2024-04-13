# Witches' Vroom
<div align="center">

# > [PLAY NOW IN YOUR BROWSER](https://playatdark.itch.io/witches-vroom) <
  

![image](https://github.com/KeithEvansK/Witches-Vroom/assets/99915276/a83b119a-7314-4d10-a053-da9b073f0646)
</div>


https://github.com/KeithEvansK/Witches-Vroom/assets/99915276/45a0fd29-4a80-415b-8ec8-27b70e0c7de6


## About
Witches' Vroom is a fast paced mobile game where the purpose is to avoid obstacles and collect the coins in the level. 

This is a mobile game I created. 
Collect the gems and beat your high score! 
It originally started as a project for the Bigmode game jam and was inspired by other great mobile games like Flappy Bird.

The game features several gameplay mechanics such as:
 - Endless levels
 - Save data between playing
 - Player controls and key input
 - Creative GUI menu navigation
 - Player customization shop (not available on the Play Now link)

And several backend development mechanics such as: 
 - Continuous level generation with garbage collection to ensure machine performance in long games
 - Custom player animations
 - Data collection for saving coins between games to spend in customizations shop
 - And much more

### The Project
Originally the project was designed for the Bigmode game jam contest hosted by Bigmode on itch.io. But after completing the project I continued working on it. 
After finishing the game jam I had a very unpolished game. The version I submitted is still available on my itch.io page if you'd like to see the state in which it was in. It had no title screen, no menu for when you died, no data saving, and a lot more. 
So after the contest of 2 and 1/2 weeks, I spent about another 2 weeks polishing and fixing any bugs in the game. 

### Shortfalls
While the project was a great experience and I learned a lot from learning Python, project management, and time management. I will say that the project isn't ready and will likely never be released. 

There are still several things required for this game to fully be ready. 
Music, audio, sounds, UI improvements, ect.

And truthfully the game isn't the type of game people are playing on mobile these days. The gameplay style is similar to "Flappy Bird" style games just isn't popular in the Android Play Store or the Apple App Store. At least not in 2024. 

But the project served its purpose of learning some new game design techniques and pushing my software development skills. And maybe oneday I'll return to it. 

For now I'm continuing work on my next game. 

### Development
Witches' Vroom is made in the Godot game engine and coded completely with their own GDScript. 
GDScript is modeled after the Python programming language and is very similar to use. 

### Game Design
![image](https://github.com/KeithEvansK/Witches-Vroom/assets/99915276/a28b87ba-0956-403f-912e-d18a81e0d795)

The main aspects of the game's design come from player controls, level generation, data read/write, and objects to avoid. 

### Player Controls
Player controls in Witches' Vroom are handled by the physics engine within Godot 4.0. 

Because of this choice, the player is represented within a 2D physical space with gravity. So to move the player we apply force by making changes to the players X and Y velocity. 

The Y velocity of the player always has a constant force being applied to it each frame which is applying the gravity to it. We only alter this when the player jumps so it is mostly pretty simple. 

The X velocity of the player is messed around with quite a bit more. 
The first important bit being that if the player ever stops (hits 0 X velocity) they "die" or end the game. This is a quick and easy way to check if the player ever hits a wall or object. The player should always be moving and progressing in this game. 

The X velocity is also slightly increased the more coins the player collects so that the game becomes ever so slightly harder as the game goes on. But there is a cap to this amount so that the player could potentially go on forever. 

The other big component of movement in this game is the dash button. The player gets a quick boost in the forward direction. Allowing them to break through objects and sometimes get themselves out of a point in which the game may end. 
Most importantly at the start of making this function, you need to check a lot of things. Has the player used the dash too recently? Also checking if they are currently dashing, as they can't do it twice at the same time. 
Also when using the dash I want the player to move straight in the direction they are headed so I make the Y velocity 0 temporarily to give this effect. 

The player movement is the core of this entire game and required hours of adjustments to get it right and working smoothly. 

### Level Generation
The level generation method for this game I learned a long time ago when I created a Flappy Bird game clone. 

Because the level is designed to never end you have a few important things you need. 
The player obviously to have a position reference point. 
Then I attach a world generation object to the player and place it a level's length ahead the players position. 
Anytime the players Y coordinate passes the Y of the world generation object. It will move up the length of one level and create that part of the level.

Doing world generation this way gives the player the illusion of a very large level but actuall there is only a small bit being created as the player moves along. 
I also take this a step further by randmizing the levels placement so it randomly pulls from a few premade level sections so that it isn't just the same part over and over. 

This method of level generation also can become stressful on the machine running the game because of all the created assets. 
To avoid this, we also create a garbage collector that trails behind the player as a wall, anything that passes the wall (which is far out of sight) is removed from the game. Ensuring less usage of ram and stress on cpu/gpu. 

Here is a special zoomed out view of the level being generated live as the player is playing for you to better visualize how it is happening. 
![level_gen](https://github.com/KeithEvansK/Witches-Vroom/assets/99915276/b177ff1e-f672-40ae-a022-91d9c7486b9f)

### Data Read/Write
Data within the game within the game is primarily used for: 
 - Saving the amount of coins collected each game run
 - Saving / Loading the players currently selected skin/broom each time the game starts.
 - Storing additional data such as how many rocks have been broken or how many coins have the player every collected. This is mainly for an undeveloped idea of achievements or game stats.

Data within Witches' Vroom is stored using a secure object storage system provided by the Godot engine. 
Allowing me to store a variable like an object and save it to a file. 

The process of saving and loading data is as follows: 
If there is no save file, I create one. 
Then I have an object like the one here:
![image](https://github.com/KeithEvansK/Witches-Vroom/assets/99915276/bdcf4ffb-b9c5-4771-ba31-36b52eee5067)

This object represents a new player who has never played before. 
Note it has coins collected information, the currently selected skin, and skins owned by the player. 

Using this small amount of data we can customize the experience each time when loading the game to the player that has previously been playing on that save file. 

When the game is started, we load that save file and fill in all of those variable values. 

Then anytime a change is made such as ending a game, we add the coins and save the file. 
Or the player changes their skin, we save the file. 

Then the rest of the game can reference that object any time it is needed and can ensure the correct data is shown. 

### Objects

There are a couple of interactive objects coded within the game. These include the cracked rocks player dash through and the coins collected. 

Both of these objects are made with very similar code. 

![image](https://github.com/KeithEvansK/Witches-Vroom/assets/99915276/8b15e284-e41f-4be4-bc63-a6aaf8dc41c6)

The cracked rock is made from a rigidbody that has an area2D collison shape around it (in blue) that is checking upon another object entering its zone. 
When detected, it checks if that object is labeled as a "Player". 
If so, it allows the player to pass through it and plays its animaiton of being broken until it finishes the animation in which it calls queue_free() and removes the rock from the game. 
Data is also stored that the player has broken the rock just to keep track for future possible additions like achievements added into the game. 
This is a really great simple code for these kinds of object within a game and the code can be reused so you can check it out here: scenes/levels/Rock.gd 

![image](https://github.com/KeithEvansK/Witches-Vroom/assets/99915276/c7fccffc-aece-43f2-98ed-a0bcd8730ebd)

The coin or gem is very similar to the rock design and works almost the same way. Except we call the players coin_collected() method in which we update the players on screen coin collection amount. 



## Graphics
You will see a number of different graphics being used throughout the game. 

The majority of the assets are a combination of premade assets and my own basic image editing skills. 
The player sprite and the levels come from a great asset pack available on itch.io by [this creator](https://maxence-jacquot.itch.io/) 
Then I edited things as needed adding:
 - Several new tiles to the tile sheet for the level design
 - Several new frames for objects animation such as the rocks smashing as you pass through them
 - Player animation frames

![Witch_Tiles](https://github.com/KeithEvansK/Witches-Vroom/assets/99915276/b123c5ad-a182-476c-b004-67b537c4c0b8)


I also added several skins to the game (Not available on the itch.io Play Now link) that are available to buy using the in game shop with the coins you collect by playing. 
These include simple skins for the witch and different skins for the broom. Which were originally one sprite but I split them into two to achieve this effect. 

The popup menu is designed by me with the intention of being similar to the used game assets. 

And the main screen and logo are developed using AI and edited by me to achieve the final visual result of the game. 

## Animations
All animations seen on the game are made by me. 

Most notable are the witch swaying as if flying a broom. 
This is achieved by moving the sprite of the witch and broom both up on one frame of the animation, and down on the next frame. 

Other animations include:
 - Rock smashing

### Background

The background is mostly just a black background with a particle effect on it giving a mystical feel to the game. 
If I pick up development of the game again this would be one of the first things I would work on. Adding some kind of subtle trees background. 

The particle effect is actually being kept from the original idea for the game which was more of a dark puzzle game idea.

### Particle Effects
The particle effect both on the players trail and background are both simple particles that follow the player. 
To keep them low cost to the machine running the game, because particles can get out of hand if not handled correctly, I make it so the particles only exist for a short time and follow the player. 
Even the background is actually following the player and only spawn within a distance of the player at any given time. 

## Gameplay
Throughout development the gameplay of the project changed several times. 

At first the player was going to be able to move both left and right and it was going to be more of a puzzle game. But as details of the project came up, changes were made and I had to pivot directions to stay within the 2 and 1/2 week strict timeframe. 





![witches_vroom_gameplay](https://github.com/KeithEvansK/Witches-Vroom/assets/99915276/e21f4723-17c2-4490-aaf0-0a1e4b5555a4)




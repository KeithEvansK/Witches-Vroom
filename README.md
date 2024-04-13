# Witches' Vroom
<div align="center">

# > [PLAY NOW IN YOUR BROWSER](https://playatdark.itch.io/witches-vroom) <
  
![witches_vroom_gameplay](https://github.com/KeithEvansK/Witches-Vroom/assets/99915276/e21f4723-17c2-4490-aaf0-0a1e4b5555a4)

</div>

![image](https://github.com/KeithEvansK/Witches-Vroom/assets/99915276/a83b119a-7314-4d10-a053-da9b073f0646)








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

### Level Generation

### Data Read/Write


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










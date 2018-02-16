# Game of Life

In which I create the Game of Life in ~30 minutes from scratch using Pico-8.

[See the Code](/01-game-of-life/life.p8)

In the video I had a problem with oscillating patterns: namely, they didn't work. After digging a little more I discovered that it was because Pico-8's update function isn't _necessarily_ called once per frame, sometimes it's called multiple times per frame, and that's where the error was.

So I created my own update function, called `updatecells`, and called that from the draw function, so the cells are only changed once per frame. This fixed the issue. Here is the improved code:

[Improved Code (changed post video)](/01-game-of-life/life-improved.p8)

[![Game of Life video on YouTube](/01-game-of-life/thumbnail.png)](https://youtu.be/hh8ZprKn11o)
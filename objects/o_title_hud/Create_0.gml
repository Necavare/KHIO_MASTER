// General highlighting
playHighlighted = false;
exitHighlighted = false;
optionsHighlighted = false;
creditsHighlighted = false;
backHighlighted = false;

// PLAY highlighting
nameExistsAlready = 0;
newOption = false;
newHighlighted = false;

tutorialModeHighlighted = false;
tutorialMode = false;

createHighlighted = false;

// LOAD highlighting
deleteHighlighted = false;

fileHighlighted = "";
fileSelected = "";

nameHighlighted = false;
load = false;
loadHighlighted = false;
editHighlighted = false;
editSelected = false;
startHighlighted = false;

typer = false;
alarm[4] = 10;

// OPTIONS highlighting
settings = false;
controls = false;
settingsHighlighted = false;
controlsHighlighted = false;

// SETTINGS
windowHighlighted = false;
currentResolution = global.display_width;
resolution[0] = 3840;
resolution[1] = 3440;
resolution[2] = 2560;
resolution[3] = 1920;
resolution[4] = 1600;
resolution[5] = 1366;
resolution[6] = 1280;
resolution[7] = 1024;

censorHighlighted = false;
hintsHighlighted = false;

// Adding resolution to list if new
var isIn = false;
for(var i = 0; i < array_length_1d(resolution); i++) {
	if(resolution[i] == currentResolution)
		isIn = true;
}

if(!isIn)
	resolution[8] = currentResolution;

resolutionHighlighted = false;
fxHighlighted = false;
musicHighlighted = false;

// CONTROLS
controlSelected = -1;
primaryHighlighted = false;
secondaryHighlighted = false;
walkHighlighted = false;
runHighlighted = false;
sitHighlighted = false;
dodgeHighlighted = false;
reloadHighlighted = false;
inventoryHighlighted = false;
mapHighlighted = false;
pauseHighlighted = false;
centerHighlighted = false;
rotateLeftHighlighted = false;
rotateRightHighlighted = false;

// Intro out/Menu in
introFadeOut = false;
menuFadeIn = false;
newGameFade = false;

logoAlpha = 0;
backgroundAlpha = 1;

alarm[0] = room_speed * 2;
alarm[1] = room_speed * 7;
alarm[2] = room_speed * 9;

// Menu alpha
menuAlpha = 0;

// Mouse
mx = 0;
my = 0;

cursor_sprite = s_mouse_cursor;

// Menu music
playMusic = true;

// CONFIRM menu
confirm = false;
exitMessage = true;
noHighlighted = false;
yesHighlighted = false;
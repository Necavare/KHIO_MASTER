// Tips/tooltips
tips[0] = "Use 'ALT' to freely rotate the camera";
tips[1] = "It is wise to cook certain foods before eating";
tips[2] = "Crushed grass is easier to pickup";
tips[3] = "Sitting down helps you regain stamina";
tips[4] = "Keep your loot secure by building walls around your camp";
tips[5] = "Rare loot can be found in the camps of raiders";
tips[6] = "Use right-click to quick move items in the inventory";
tips[7] = "Use 'G' to quickly open and view the map";
tips[8] = "Crafting items makes time go by faster";
tips[9] = "Armor can protect you from breaking bones";
tips[10] = "Chop logs or stumps for planks";

tipNumber = irandom_range(0, array_length(tips)-1);

alarm[9] = 60*5;

global.enemyMap = false;
enemyMapTime = 0;

global.journalKey = false;
global.journalKeyFound = false;
global.journalGate = false;
global.journalGateFound = false;

global.compoundEntered = false;

journalKeyTime = 0;
journalGateTime = 0;
journalBunkerTime = 0;

// Checking for rotting food
alarm[8] = 60;

newGamePlus = false;
isGameover = false;
isWon = false;

showHud = true;

#region Pause Menu

global.pausedBackground = 0;

exitPressed = false;
instanceActivated = false;
resumeHighlighted = false;
optionsHighlighted = false;
exitHighlighted = false;
backHighlighted = false;

buttonAlpha = 0;

goToMenu = false;

mx = 0;
my = 0;

// OPTIONS highlighting
settingsHighlighted = false;
controlsHighlighted = false;
settings = false;
controls = false;

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
for(var i = 0; i < array_length(resolution); i++) {
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

// CONFIRM menu
confirm = false;
exitMessage = true;
ngPlusHighlighted = false;
menuHighlighted = false;
desktopHighlighted = false;

#endregion

// Used in drawing the inventory slots
angle = 0;
z = 28;
if(!global.loadingWorld){
	x = o_player.x;
	y = o_player.y;
}

#region items

equippedDurability = -1;

enum item {
	none = 0,
	highlighted = 1,
	stick = 2,
	grass = 3,
	berry = 4,
	fungi = 5,
	lilly = 6,
	poison = 7,
	rock = 8,
	flint = 9,
	compound = 10,
	metal = 11,
	sulfur = 12,
	charcoal = 13,
	planks = 14,
	meat = 15,
	cookedmeat = 16,
	furpelt = 17,
	bones = 18,
	rope = 19,
	gunpowder = 20,
	stoneaxeS = 21,
	stoneaxeB = 22,
	stonepicS = 23,
	stonepicB = 24,
	rifle = 25,
	rifleammo = 26,
	shotgun = 27,
	buckshot = 28,
	crossbow = 29,
	bolt = 30,
	poisonbolt = 31,
	flamebolt = 32,
	torch = 33,
	lantern = 34,
	sword = 35,
	poisonsword = 36,
	knife = 37,
	poisonknife = 38,
	snaretrap = 39,
	wall = 40,
	door = 41,
	woodspikes = 42,
	metalspikes = 43,
	bedroll = 44,
	firepit = 45,
	marker = 46,
	anvil = 47,
	smallcrate = 48,
	largecrate = 49,
	flare = 50,
	human = 51,
	cookedhuman = 52,
	woodenchest = 53,
	woodenhead = 54,
	metalchest = 55,
	metalhead = 56,
	splint = 57,
	bandage = 58,
	metalaxeS = 59,
	metalaxeB = 60,
	metalpicS = 61,
	metalpicB = 62,
	sack = 63,
	boneaxeS = 64,
	boneaxeB = 65,
	bonepicS = 66,
	bonepicB = 67,
	boneclubS = 68,
	boneclubB = 69,
	bonebolt = 70,
	flintbolt = 71,
	metalbolt = 72,
	cookedfungi = 73,
	rottenfood = 74,
	medkit = 75,
	poisonbonebolt = 76,
	poisonflintbolt = 77,
	poisonmetalbolt = 78,
	enemymap = 79,
	leatherchest = 80,
	leatherhead = 81,
	keycard = 82,
	journal = 83,
	guide = 84,
	grenade = 85,
	soup = 86,
	clueone = 87,
	cluetwo = 88,
	cluethree = 89,
	cluefour = 90,
	stoneShovelS = 91,
	stoneShovelB = 92,
	metalShovelS = 93,
	metalShovelB = 94,
	treasureMap = 95,
	snowball = 96
}

birchOrSpruce = false; // Used for randomizing which version is crafted. Birch = false; Spruce = true;

// Used for knowing which items are non stackable
global.singleItems[0] = item.stoneaxeS;
global.singleItems[1] = item.stoneaxeB;
global.singleItems[2] = item.stonepicS;
global.singleItems[3] = item.stonepicB;
global.singleItems[4] = item.rifle;
global.singleItems[5] = item.shotgun;
global.singleItems[6] = item.crossbow;
global.singleItems[7] = item.lantern;
global.singleItems[8] = item.sword;
global.singleItems[9] = item.poisonsword;
global.singleItems[10] = item.door;
global.singleItems[11] = item.bedroll;
global.singleItems[12] = item.firepit;
global.singleItems[13] = item.anvil;
global.singleItems[14] = item.smallcrate;
global.singleItems[15] = item.largecrate;
global.singleItems[16] = item.woodenchest;
global.singleItems[17] = item.woodenhead;
global.singleItems[18] = item.metalchest;
global.singleItems[19] = item.metalhead;
global.singleItems[20] = item.sack;
global.singleItems[21] = item.metalaxeS;
global.singleItems[22] = item.metalaxeB;
global.singleItems[23] = item.boneaxeS;
global.singleItems[24] = item.boneaxeB;
global.singleItems[25] = item.bonepicS;
global.singleItems[26] = item.bonepicB;
global.singleItems[27] = item.boneclubS;
global.singleItems[28] = item.boneclubB;
global.singleItems[29] = item.splint;
global.singleItems[30] = item.torch;
global.singleItems[31] = item.flare;
global.singleItems[32] = item.enemymap;
global.singleItems[33] = item.medkit;
global.singleItems[34] = item.knife;
global.singleItems[35] = item.poisonknife;
global.singleItems[36] = item.leatherhead;
global.singleItems[37] = item.leatherchest;
global.singleItems[38] = item.keycard;
global.singleItems[39] = item.guide;
global.singleItems[40] = item.treasureMap;
global.singleItems[41] = item.stoneShovelS;
global.singleItems[42] = item.stoneShovelB;
global.singleItems[43] = item.metalShovelS;
global.singleItems[44] = item.metalShovelB;

global.durabilityItems[0] = item.stoneaxeB;
global.durabilityItems[1] = item.stoneaxeS;
global.durabilityItems[2] = item.stonepicS;
global.durabilityItems[3] = item.stonepicB;
global.durabilityItems[4] = item.rifle;
global.durabilityItems[5] = item.shotgun;
global.durabilityItems[6] = item.crossbow;
global.durabilityItems[7] = item.torch;
global.durabilityItems[8] = item.lantern;
global.durabilityItems[9] = item.sword;
global.durabilityItems[10] = item.poisonsword;
global.durabilityItems[11] = item.poisonknife;
global.durabilityItems[12] = item.woodenchest;
global.durabilityItems[13] = item.woodenhead;
global.durabilityItems[14] = item.metalchest;
global.durabilityItems[15] = item.metalhead;
global.durabilityItems[16] = item.meat;
global.durabilityItems[17] = item.human;
global.durabilityItems[18] = item.cookedmeat;
global.durabilityItems[19] = item.cookedhuman;
global.durabilityItems[20] = item.metalaxeS;
global.durabilityItems[21] = item.metalaxeB;
global.durabilityItems[22] = item.metalpicS;
global.durabilityItems[23] = item.metalpicB;
global.durabilityItems[24] = item.boneaxeS;
global.durabilityItems[25] = item.boneaxeB;
global.durabilityItems[26] = item.bonepicS;
global.durabilityItems[27] = item.bonepicB;
global.durabilityItems[28] = item.boneclubS;
global.durabilityItems[29] = item.boneclubB;
global.durabilityItems[30] = item.berry;
global.durabilityItems[31] = item.fungi;
global.durabilityItems[32] = item.cookedfungi;
global.durabilityItems[33] = item.flare;
global.durabilityItems[34] = item.knife;
global.durabilityItems[35] = item.leatherhead;
global.durabilityItems[36] = item.leatherchest;
global.durabilityItems[37] = item.stoneShovelS;
global.durabilityItems[38] = item.stoneShovelB;
global.durabilityItems[39] = item.metalShovelS;
global.durabilityItems[40] = item.metalShovelB;

global.buildableItems[0] = item.snaretrap;
global.buildableItems[1] = item.wall;
global.buildableItems[2] = item.door;
global.buildableItems[4] = item.woodspikes;
global.buildableItems[5] = item.metalspikes;
global.buildableItems[7] = item.bedroll;
global.buildableItems[8] = item.firepit;
global.buildableItems[9] = item.marker;
global.buildableItems[10] = item.anvil;
global.buildableItems[11] = item.smallcrate;
global.buildableItems[12] = item.largecrate;
global.buildableItems[13] = item.lilly;

global.bodyItems[0] = item.woodenchest;
global.bodyItems[1] = item.metalchest;
global.bodyItems[2] = item.leatherchest;
global.headItems[0] = item.woodenhead;
global.headItems[1] = item.metalhead;
global.headItems[2] = item.leatherhead;
#endregion

#region Crafting/Recipes

isAnvil = false;

// Crafting slots
crafting = ds_grid_create(1, 1);
ds_grid_clear(crafting, false);

for(var ix = 0; ix < 1; ix++)
	for(var iy = 0; iy < 1; iy++){
		var inst = instance_create_depth(x, y, 0, o_hud_slot);
		inst.ix = ix;
		inst.iy = iy;
		crafting[# ix, iy] = inst;
	}
	
craftingItems = ds_grid_create(1, 1);
ds_grid_clear(craftingItems, false);

craftingCount = ds_grid_create(1, 1);
ds_grid_clear(craftingCount, false);

craftingDurability = ds_grid_create(1, 1);
ds_grid_clear(craftingDurability, -1);

// Recipe slots
recipe = ds_grid_create(10, 3);
ds_grid_clear(recipe, false);

for(var ix = 0; ix < 10; ix++){
	for(var iy = 0; iy < 3; iy++) {
		var inst = instance_create_depth(x, y, 0, o_hud_slot);
		inst.ix = ix;
		inst.iy = iy;
		recipe[# ix, iy] = inst;
	}
}

// Recipe items
recipeItems = ds_grid_create(10, 3);
ds_grid_clear(recipeItems, 0);

#endregion

#region Equipment

// Equip slots
equip = ds_grid_create(1, 2);
ds_grid_clear(equip, false);

for(var ix = 0; ix < 1; ix++)
	for(var iy = 0; iy < 2; iy++) {
		var inst = instance_create_depth(x, y, 0, o_hud_slot);
		inst.ix = ix;
		inst.iy = iy;
		equip[# ix, iy] = inst;
	}

equipItems = ds_grid_create(1, 2);
ds_grid_clear(equipItems, false);

equipDurability = ds_grid_create(1, 2);
ds_grid_clear(equipDurability, -1);

#endregion

#region Journal

// Journal slot
journal = ds_grid_create(1, 1);
ds_grid_clear(journal, false);

var inst = instance_create_depth(x, y, 0, o_hud_slot);
inst.ix = 0;
inst.iy = 0;
journal[# 0, 0] = inst;

journalItems = ds_grid_create(1, 1);
ds_grid_clear(journalItems, false);

journalItems[# 0, 0] = item.journal;

#endregion

#region Inventory

inventoryclosing = false;
mouseMoving = false;
gx = device_mouse_x_to_gui(0);
gy = device_mouse_y_to_gui(0);

width = 4;
height = 3;

// Creating slot instances for highlighting
slots = ds_grid_create(width, height);
ds_grid_clear(slots, false);

for(var ix = 0; ix < width; ix++){
	for(var iy = 0; iy < height; iy++) {
		var inst = instance_create_depth(x, y, 0, o_hud_slot);
		inst.ix = ix;
		inst.iy = iy;
		slots[# ix, iy] = inst;
	}
}

items = ds_grid_create(width, height);
ds_grid_clear(items, false);

durability = ds_grid_create(width, height);
ds_grid_clear(durability, -1);

count = ds_grid_create(width, height);
ds_grid_clear(count, false);

showDescription = false;

// Hotbar stuff
hotbarSlots = ds_grid_create(1, 3);
ds_grid_clear(hotbarSlots, false);

for(var iy = 0; iy < 3; iy++) {
	var inst = instance_create_depth(x, y, 0, o_hud_slot);
	inst.ix = 0;
	inst.iy = iy;
	hotbarSlots[# 0, iy] = inst;
}

hotbarItems = ds_grid_create(1, 3);
ds_grid_clear(hotbarItems, false);

hotbarCount = ds_grid_create(1, 3);
ds_grid_clear(hotbarCount, false);

hotbarDurability = ds_grid_create(1, 3);
ds_grid_clear(hotbarDurability, -1);

showHotbar = false;
hotbarSlot = -1;
hotbarAlpha = 1;
hotbarOut = false;
alarm[1] = 120;

// Used for hovering slots
animateSlot = false;
slotAnimated = -1;
holdSlot = false;

quickMove = false;
quickMoveLoad = -1;
quickMoveItem = -1;
quickMoveCount = -1;
quickMoveDurability = -1;
quickMoveX = -1;
quickMoveY = -1;

fromHotbar = false;

global.swapX = -1;
global.swapY = -1;
global.swapItemGrid = -1;
global.swapCountGrid = -1;
global.swapDurabilityGrid = -1;

#endregion

#region Stats

// Stamina slots
stamina = ds_grid_create(6, 1);
ds_grid_clear(stamina, false);

for(var ix = 0; ix < 6; ix++)
	for(var iy = 0; iy < 1; iy++) {
		var inst = instance_create_depth(x, y, 0, o_hud_slot);
		inst.sprite_index = s_stats;
		inst.image_xscale = 1.5;
		inst.ix = ix;
		inst.iy = iy;
		stamina[# ix, iy] = inst;
	}
	
// Health slots
health_ = ds_grid_create(11, 1);
ds_grid_clear(health_, false);

for(var ix = 0; ix < 11; ix++)
	for(var iy = 0; iy < 1; iy++) {
		var inst = instance_create_depth(x, y, 0, o_hud_slot);
		inst.sprite_index = s_stats;
		inst.image_xscale = 1.5;
		inst.ix = ix;
		inst.iy = iy;
		health_[# ix, iy] = inst;
	}
	
// Hunger slots
hunger = ds_grid_create(11, 1);
ds_grid_clear(hunger, false);

for(var ix = 0; ix < 11; ix++)
	for(var iy = 0; iy < 1; iy++) {
		var inst = instance_create_depth(x, y, 0, o_hud_slot);
		inst.sprite_index = s_stats;
		inst.image_xscale = 1.5;
		inst.ix = ix;
		inst.iy = iy;
		hunger[# ix, iy] = inst;
	}
	
#endregion

// Sack variables
global.sack = false;
sackInst = -1;

// Lantern variables
global.lantern = false;
global.lanternX = -1;
global.lanternY = -1;
lanternInst = -1;

//since the inventory is saved this would add them on top and be weird
if(!global.loadingWorld && global.isDev){
// Test pickup stuff
pickup_item(o_hud, item.metalShovelB, 1, 11);
pickup_item(o_hud, item.stoneaxeB, 1, 11);
pickup_item(o_hud, item.metalaxeB, 1, 11);

}

#region minimap pre variables

//mx and my
mx = 0;
my = 0;

//for text editing
//WARNING: might be messing up code with alarm0

//need to be pre declared
editNameSelected = false; //wether or not text editor is active
selectedMarkerIndex = -1; //index of currently selected marker (-1 = false)

//for the "|" part of name editing
typer = false;
alarm[4] = 10;

//NOTE: max number to be in an array is assumed at 10
//initializing arrays for storing marker values
//markerName[0] = item.none;
//markerX[0] = item.none; 
//markerY[0] = item.none;
//markerCol[0] = item.none;

//needs to be set here due to ordering to make other things dissapear when in fullscreen
//if(fullscreenSelected)
fullscreenSelected = false;//wether or not it is in fullscreen mode

mapOpen = false;
mapInventory = false;

//campNameList = ds_list_create();
//campXList = ds_list_create();
//campYList = ds_list_create();
//campIdList = ds_list_create();
//campCol = ds_list_create();//0 is undiscovered, 1 is discovered, 2 is conquered

//setting default values for the arrays
for(var i = 0; i < 10; i++){
	markerName[i] = string(i+1);
	markerX[i] = -1;
	markerY[i] = -1;
	//markerCol[i] = c_black;
	markerCol[i] = 4;// 4 is red, 6 is blue, 8 is green
}

zoom = 4;
fullscreenZoom = 1;
minimizedZoom = 4;

markerLibrarySelected = false;//wasnt their befoer and had to be added to a bugged thing
markerLibrarySelectedIndex = -1;
xp = 0;
yp = 0;

xPrevious = 0;
yPrevious = 0;

mmHeight = 480;
mmWidth = 480;

//save fullscreenoffset
fullscreen_mmXoffset = 0;
fullscreen_mmYoffset = 0;
minimap_mmXoffset = 0;
minimap_mmYoffset = 0;

mmXoffset = 0;
mmYoffset = 0;

mmXoldoffset = 0;
mmYoldoffset = 0;

centerX = 0;
centerY = 0;

markerSelected = false;

//height and width of sprite created for background

mapHeight = 6000;
mapWidth = 6000;

savingWorld = false;
autoSave = false;
saveAlarm = false;

drawSave = false;
alarm[10] = 60*60*5; // Save every 5 minutes
//alarm[10] = 60*30; //30 seconds

//surface to use for clipping
//clip_surface = -1;

//global variables to not do other things in other objects when the minimap is active
global.minimapHighlighted = false;
global.minimapFullscreen = false;
global.minimapUpdated = true; // used to not have to merge maps when not necessary

global.surfmm = surface_create(mapWidth, mapHeight);
	
#endregion

quickMapOpen = false;

initialLoadSave = false;
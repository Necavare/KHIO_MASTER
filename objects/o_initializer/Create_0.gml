		//IMPORTANT DEV ONLY 
//set this to true to draw map at the start of a world, not draw overhead, and any other dev only things
global.isDev = false;
global.minimapActive = true;
global.isDev = true;
global.minimapActive = false;

#region o_input set up stuff
global.wind = random(pi*2);
value = 0.027 + random(0.005);

// Define global input values
//this is now in initializer
globalvar M_LEFT, M_RIGHT, M_TARGET, K_DODGE, K_RELOAD, K_CENTER, K_ROTATERIGHT, K_ROTATELEFT, K_INVENTORY, K_MAP, K_PAUSE, K_UP, K_DOWN, K_LEFT, K_RIGHT, K_SIT, K_RUN, K_ONE, K_TWO, K_THREE;
globalvar S_FULLSCREEN, S_BRIGHTNESS, S_MUSIC, S_FX, S_LANG;

// Set the keybinds for input
M_LEFT = mb_left;
M_RIGHT = mb_right;
M_TARGET = mb_middle;
K_DODGE = vk_space;
K_RELOAD = ord("R");
K_CENTER = ord("C");
K_ROTATERIGHT = ord("E");
K_ROTATELEFT = ord("Q");
K_INVENTORY = vk_tab;
K_MAP = ord("G");
K_PAUSE = vk_escape;
K_UP = ord("W");
K_DOWN = ord("S");
K_RIGHT = ord("D");
K_LEFT = ord("A");
K_SIT = ord("X");
K_RUN = vk_shift;
K_ONE = ord("1");
K_TWO = ord("2");
K_THREE = ord("3");

// Sound stuff
globalvar SN_FX, SN_MUSIC;

SN_FX = 1;
SN_MUSIC = .2;

#endregion

global.loadingIndex = 0;

// Tutorial variables
global.isTutorial = true;
global.tutorialDodge = false;
global.tutorialParry = false;
global.tutorialAttack = false;

global.censoring = false;
global.hints = true;

global.drawLoad = false;

// Display dimensions
global.display_width = display_get_width();
global.display_height = display_get_height();

// Ideal dimensions
ideal_height = 243;
ideal_width = 432;

save_loadSettingsHub();

// Setting the gui size
display_set_gui_size(1920, 1080);

// Setting surface and window size
surface_resize(application_surface,1920,1080);
//persistant
//if(room != r_title && room != r_display_init)
	//persistent = true;

window_set_size(global.display_width,global.display_height);

// Going to the next room
room_goto_next();

#region Global Vars

global.clue1 = "I was traveling __ of the water tower...";
global.clue2 = "I came across a large rock and moved __...";
global.clue3 = "I came across a relic of the old war and searched the area __";
global.clue4 = "hidden inside a hollowed out tree stump I found it.";

global.inOptions = false;

global.playMusic = true;

global.viewBorderX = camera_get_view_border_x(view_camera[0]);
global.viewBorderY = camera_get_view_border_y(view_camera[0]);

global.food[0] = item.berry;
global.food[1] = item.fungi;
global.food[2] = item.meat;
global.food[3] = item.cookedmeat;
global.food[4] = item.human;
global.food[5] = item.cookedhuman;
global.food[6] = item.cookedfungi;

// HUD/INFO 
global.temperature = 0;
global.hour = 12;
global.minute = 30;

// Saves and loads
global.saves = -1;
global.saveRooms[0] = -1;
global.saveFileNames = ds_list_create();

global.currentFile = "SAVEFILE_1";
//global.currentFile = "saveFile_1";
global.saveFileMax = 0;
global.loadingWorld = false;
save_loadNameHub(); //<-load the save names right away

// Loading transition
global.demoRoom = false;
global.loading = false;
global.loadingMove = false;
global.menuAlpha = 1;

//global.cameraSetupDone = true;

// Menus
global.mainMenu = false;
global.play = false;
global.options = false;
//save_settingsHub();
global.credits = false;
global.draw_cursor = true;

// Inventory
global.newGamePlusItemList = ds_stack_create();
global.newGamePlusDurList = ds_stack_create();
global.newGamePlusCountList = ds_stack_create();
global.isInventoryOpen = false;
global.isItemPicked = false;
global.picked_quantity = 0;
global.picked_durability = -1;
global.last_item = 0;
global.notifications = 0;

global.weaponAmmo = ds_map_create();

global.slotHighlighted = false;

global.crafted = false;

global.isInventoryOpening = false;

global.headEquipped = -1;
global.bodyEquipped = -1;

//gun stuff
global.fireAngle = 0;
global.wepX = 0;
global.wepY = 0;
global.wepAngle = 0;
global.barrelLen = 0;

// Used for loading bar when interacting
global.interactingObject = -1;
global.interactingLoad = -1;

// Crates
global.keySpawned = false;
global.clueSpawned = 0;
global.isCrateOpen = false;
global.crate = undefined;
global.buildangle = -1;
global.playerInBuilding = false;

// Pause screen
global.isPaused = false;

// Camera
global.camera_angle = 0;
global.no_angle = false;

// Player
global.watchTower = false;
global.canMove = true;
global.dir = 0;
global.isHolding = false;
global.isHoldingFood = false;
global.rifleHolding = false;
global.grabbed = -1;
global.itemEquipped = -1;
global.duraEquipped = -1;
global.isAiming = false;

global.target = false;
global.targetAngle = -1;

global.days = 1;

global.noSleep = 0;

//wall cycles
global.wallCycleIndex = 1;


// offsets for "real" movement position 
global.xoffset = 0;
global.yoffset = 0;

//minimap
//list of all active minmap symbols

/*
//variables for size of blocks 
global.blockXNum = 20000/1000; //  <- NEED TO MANUALLY CHANGE WHEN ROOM SIZE CHANGES
global.blockYNum = 20000/1000;

global.chunkLoaded = array_create(global.blockXNum*global.blockYNum, false);
global.blockUpdateArr = array_create(global.blockXNum*global.blockYNum, false);
global.activemm = ds_list_create();
global.blockArr = array_create(global.blockXNum*global.blockYNum);
*/

global.mmOverheadSprite = pointer_null; //set the overhead sprite to null
global.mmSprite = pointer_null; //set the map sprite to null
global.generatingEnvironment =  true; //change to false if turned off generator
global.finishedLoading = false;
global.generatingGrass = false; //keep it from doing un necessary stuff
global.grass_angle = 0;
global.biomeArray[0,0] = 0; //2d array for storing what biome every block is
//initiate the overheadArr for use 
//uses 8x8 blocks

global.overheadXList = ds_list_create();
global.overheadYList = ds_list_create();
global.overheadXIndex = 0;

global.bigLakeIDQ = ds_queue_create();
//global.bigLakePointer = -1;

//global.surfmm = surface_create(2000, 2000);//map height and width if those are changed

//enemies and lists to keep track
global.enemyInstList = ds_list_create();
global.enemyXList = ds_list_create();
global.enemyYList = ds_list_create();

global.campNameList = ds_list_create();
global.campXList = ds_list_create();
global.campYList = ds_list_create();
global.campIdList = ds_list_create();
global.campCol = ds_list_create();

//mounds and lists to keep track
global.moundTypeList = ds_list_create(); //0 normal, 1 treasure, 2, uncovered
global.moundXList = ds_list_create();
global.moundYList = ds_list_create();
global.moundPointerList = ds_list_create();

global.reLoad = false;
global.caveLoadList = ds_list_create();
global.caveList = ds_list_create();
global.caveX = -1;
global.caveY = -1;

//ds_list_add(o_hud.campNameList, "Enemy Camp");
//ds_list_add(o_hud.campXList, x-500);
//ds_list_add(o_hud.campYList, y);
//ds_list_add(o_hud.campIdList, currentCampId);
//ds_list_add(o_hud.campCol, 1); //0 is invisible, 1 is visible, 2 is conquered

/*
generatorWallAngle = 0;

//variables for size of blocks 
global.blockXNum = room_width/1000; //  <- NEED TO MANUALLY CHANGE WHEN ROOM SIZE CHANGES
global.blockYNum = room_height/1000;
		
global.minimapVar = ds_map_create();//map which will be filled with 1d arrays for every object 
global.chunkLoaded = array_create(global.blockXNum*global.blockYNum, false);
global.blockUpdateArr = array_create(global.blockXNum*global.blockYNum, false);
global.activemm = ds_list_create();
global.blockArr = array_create(global.blockXNum*global.blockYNum);
*/		
		
global.worldShift = false;
global.worldShifted = false;
#endregion
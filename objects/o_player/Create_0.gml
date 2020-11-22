//persistant
if(room != r_title && room != r_display_init)
	persistent = true;

isCave = false;

player_surf = -1;

player_scale = .6;

isSpawning = false;

checkNearestShed = true;

//create his hitbox
if(room == r_new || room == r_testing || room == r_cave)
	instance_create_depth(x,y,1,o_player_hitBox);

// Player movements
acceleration = 1;
p_speed = 1;
xdir = 0;
ydir = 0;


initialize_movement();

// Player animations/drawing
spr_index = s_player;

// Direction
img_index = 0;
dir_ref = 0;

// Alarm used for adjusting framerate
alarm[0] = 7;
img_frame = 0;

// Variables for which mode the player is in
isIdle = true;
isWalking = false;
isRunning = false;

isRolling = false;
rollDirection = 1; // 0 = up_right, 1 = up_left, 2 = down_right, 3 = down_left
lastVert = 0; // 0 = up, 1 = down
lastHorz = 0; // 0 = right, 1 = left

isSitting = false;
if(room == r_title) {
	isSitting = true;
	img_frame = 0;
}
isSleeping = false;
isHarvesting = false;
isHarvestingIdle = false;
isStanding = true;

isHoldingTool = false;
isSwinging = false;
isStabbing = false;
isBlocking = false;
isHoldingBlock = false;
isReloadingWeapon = false;
isHoldingWeapon = false;
isAimingWeapon = false;

isDying = false;
isDead = false;

// Damaged stuff
isCold = false;
isWarm = false;
slightlyWarm = false;
nearWarmth = false;
isInjured = false;
isBleeding = false;
alarm[4] = 60;

healthKick = false;
kickBack = false;
kick = 0;

isHit = false;
lastDirX = xdir;
lastDirY = ydir;

rotationAngle = global.camera_angle;
alarmRotationAngle = global.camera_angle;

bob = false;

// Creating new footprints
newFootprint = true;

// Player stats
stealth = 0;
timeBled = 0;
armor = 1;
maxStamina = 100;
stamina = 100;
maxHealth = 100;
health_ = 100;
hunger_ = 100;
alarm[1] = 60; // Stamina

alarm[8] = 60;



//update overhead do once
overheadDoOnce = true;

objectHitting = -1;

// Audio stuff
audio_listener_orientation(0, 0, 1, dsin(global.camera_angle), -dcos(global.camera_angle), 0);

lastNoise = 0;
lastGrassNoise = 0;
lastHit = 0;

flap = 0;
pack = 0;

bagSound = false;

boneBreak = false;

// Music
nearCamp = false;
nearSword = false;
nearBow = false;
campDynamic = false;
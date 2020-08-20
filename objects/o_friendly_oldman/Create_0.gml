// Player movements
acceleration = 1;
p_speed = .35;
xdir = 0;
ydir = 0;
move_dir = 0;
move_dis = 0;
set_move_dir = 90;
move_var = 1;

initialize_movement();

// Player animations/drawing
spr_index = s_idle_sword_down;

// Direction
img_index = 0;
dir_ref = 0;

// Alarm used for adjusting framerate
alarm[0] = 7;
img_frame = 0;

// Variables for which mode the player is in
startedMoving = false;
positiveFellow = choose(true, false);
chaseDelay = 0;
heavyAttack = false;
heavyAttackChance = false;

playerBlockingBlue = false;
playerDetected = false;
playerInRange = false;
hasSwung = false;

isIdle = true;
isWalking = false;
isRunning = false;
isHoldingWeapon = false;
isDying = false;
isDead = false;
freakOut = false;

// Creating new footprints
newFootprint = true;

//setting movement alarm
alarm[1] = 180;

//setting damage tick/flame check
alarm[11]= 60;

//stuff from other enemy
// Chopping tree
damageTick = false;
damageTickStatus = 0; //0 nothing, 1 poison, 2 fire
bleedingTimer = 0;
chopped = false;
enemy_health = 7;
healthMax = 7;
canHit = true;
hitCount = -1;

spawnCount = 0;

z = 12;

// Minigame
isGame = false;
targetAngle = 0;
targetX = -1;
targetY = -1;
goodHit = false;

// Chopping particles
chopFrame = 0;

//add it to the global lists
ds_list_add(global.enemyInstList, id);
ds_list_add(global.enemyXList, x);
ds_list_add(global.enemyYList, y);

//unstuck timer
unstuckTimer = 120;

// Text prompts
stringCat = 0;
alarm[6] = 60*5;

switchStatement = true;
noString = false;

final_string = "";
last_string = "";

playerHello = false;

string1_1 = "..the key"
string1_2 = "they took it from me..."
string1_3 = "foolish, greedy bastards..."

string2_1 = "fortress of a world long dead.."
string2_2 = "protecting a secret long forgotten..."
string2_3 = "..we must find a way.."

string3_1 = "the sisters..."
string3_2 = "..where have my brothers gone?"
string3_3 = "where have the fallen run..."

string4_1 = "find it..."
string4_2 = "..forbidden gate.."
string4_3 = "..salvation of the pure"

string5_1 = "Oh praise be, a welcome sight!"

string6_1 = "I think that thing works..."
string6_2 = "..it may assist you.."
string6_3 = "..beware, this place is dangerous"

// Audio
oldMan = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(oldMan, 25, 50, 1);

lastNoise = 0;
lastGrassNoise = 0;
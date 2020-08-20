blockTimer = 0;

playerAction = false;

//room_speed = 15;

//torial variables
rolledCur = false;
parriedCur = false;
hasDodged = false;
hasParried = false;
hasBlocked = false;

// Player movements
acceleration = 1;
p_speed = 1;
xdir = 0;
ydir = 0;
move_dir = 0;
move_dis = 0;

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
cowardlyFellow = false;
chaseDelay = 0;
heavyAttack = false;
heavyAttackChance = false;

playerBlockingBlue = false;
playerDetected = false;
playerInRange = false;
playerFlee = false;
fleeTick = 0;
hasSwung = false;

startingEnemy = false;
isIdle = false;
isWalking = false;
isRunning = false;
isHoldingWeapon = false;
isDying = false;
isDead = false;
isStunned = false;
isStumbled = false;
freakOut = false;

//used to delay the attack
delayAttack = true;


canParry = false;
parried = false;
isAttacking = false;

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

angle = 0;
playerNear = false;

//knife list
knife_count = 0;

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

//stolen items
item1 = -1;
item1Dur = -1;
item1Count = -1;
item2 = -1;
item2Dur = -1;
item2Count = -1;
item3 = -1;
item3Dur = -1;
item3Count = -1;

// Text prompts
stringCat = -1;
alarm[6] = 60*5;

switchStatement = true;
noString = false;
last_string = "";
final_string = "";

if(global.censoring) {
	// Cowardly
	string1_1 = "Ahhhh"
	string1_2 = "Leave me alone!"
	string1_3 = "@%$# off!"
	string1_4 = "I dont wanna die!"
	string1_5 = "I am too young to die!"
	string1_6 = "Please dont kill me!"

	// Chasing Player
	string2_1 = "Get back here!"
	string2_2 = "Little @%*$#!"
	string2_3 = "Quit running!"
	string2_4 = "I'll spit on your grave!"
	string2_5 = "Shoot at him!"

	// Freak out
	string3_1 = "Ahhh!"
	string3_2 = "@%$#!"
	string3_3 = "Put it out!"
	string3_4 = "Someone get the water!"

	// Gets hit
	string4_1 = "Mother@#%*$#!"
	string4_2 = "I'll get you for that!"
	string4_3 = "@#%*$#%!"
	string4_4 = "Tis but a scratch!"
	string4_5 = "Ouch"
} else if(!global.censoring) {
	// Cowardly
	string1_1 = "Ahhhh"
	string1_2 = "Leave me alone!"
	string1_3 = "Fuck off!"
	string1_4 = "I dont wanna die!"
	string1_5 = "I am too young to die!"
	string1_6 = "Please dont kill me!"

	// Chasing Player
	string2_1 = "Get back here!"
	string2_2 = "Little bitch!"
	string2_3 = "Quit running!"
	string2_4 = "I'll spit on your grave!"
	string2_5 = "Shoot at him!"

	// Freak out
	string3_1 = "Ahhh!"
	string3_2 = "Fuck!"
	string3_3 = "Put it out!"
	string3_4 = "Someone get the water!"

	// Gets hit
	string4_1 = "Motherfucker!"
	string4_2 = "I'll get you for that!"
	string4_3 = "Dammit!"
	string4_4 = "Tis but a scratch!"
	string4_5 = "Ouch"
}

censor = false;

// Audio
enemy = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance); 
audio_emitter_falloff(enemy, 25, 50, 1);

lastNoise = 0;
lastGrassNoise = 0;


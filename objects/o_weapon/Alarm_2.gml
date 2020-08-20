var loadSuccess = false;
//load a bullet into the gun
var width = o_hud.width;
var height = o_hud.height;
for(var yy = 0; yy < height; yy++){
		for(var xx = 0; xx < width; xx++){
			if(!loadSuccess){
				if(weaponMode == 0){
					if(o_hud.items[# xx, yy] == item.rifleammo && o_hud.count[# xx, yy] >= 1){
						//if(ammo == 0)
						if(firstLoad){
							audio_play_sound(sn_rifle_bolt_open, 0, 0);
							firstLoad = false;
						}
						remove_item(o_hud, xx, yy, 1);
						//o_hud.count[# xx, yy]--;
						ammo++;
						audio_play_sound(sn_rifle_reload,0,0);
						loadSuccess = true;
					}
				}
				else if(weaponMode == 1){
					if(o_hud.items[# xx, yy] == item.buckshot && o_hud.count[# xx, yy] >= 1){
						//if(ammo == 0)
						if(firstLoad){
							audio_play_sound(sn_shotgun_cock_open, 0, 0);
							firstLoad = false;	
						}
						remove_item(o_hud, xx, yy, 1);
						//o_hud.count[# xx, yy]--;
						ammo++;
						audio_play_sound(sn_shotgun_reload,0,0);
						loadSuccess = true;
					}
				}
				else if(weaponMode == 2){
					if(boltLoad == 0){
						if(o_hud.items[# xx, yy] == item.bolt && o_hud.count[# xx, yy] >= 1){
							wBoltP = false;
							
							remove_item(o_hud, xx, yy, 1);
							//o_hud.count[# xx, yy]--;
							ammo++;
							audio_play_sound(sn_crossbow_reload,0,0);
							loadSuccess = true;
						}
					}
					else if(boltLoad == 1){
						if(o_hud.items[# xx, yy] == item.poisonbolt && o_hud.count[# xx, yy] >= 1){
							wPoisBoltP = false;
							
							remove_item(o_hud, xx, yy, 1);
							//o_hud.count[# xx, yy]--;
							ammo++;
							audio_play_sound(sn_crossbow_reload,0,0);
							loadSuccess = true;
						}
					}
					else if(boltLoad == 2){
						if(o_hud.items[# xx, yy] == item.flamebolt && o_hud.count[# xx, yy] >= 1){
							fBoltP = false;
							
							remove_item(o_hud, xx, yy, 1);
							//o_hud.count[# xx, yy]--;
							ammo++;
							audio_play_sound(sn_crossbow_reload,0,0);
							loadSuccess = true;
						}
					}
					else if(boltLoad == 3){
						if(o_hud.items[# xx, yy] == item.bonebolt && o_hud.count[# xx, yy] >= 1){
							bBoltP = false;
							
							remove_item(o_hud, xx, yy, 1);
							//o_hud.count[# xx, yy]--;
							ammo++;
							audio_play_sound(sn_crossbow_reload,0,0);
							loadSuccess = true;
						}
					}
					else if(boltLoad == 4){
						if(o_hud.items[# xx, yy] == item.poisonbonebolt && o_hud.count[# xx, yy] >= 1){
							bPoisBoltP = false;
							
							remove_item(o_hud, xx, yy, 1);
							//o_hud.count[# xx, yy]--;
							ammo++;
							audio_play_sound(sn_crossbow_reload,0,0);
							loadSuccess = true;
						}
					}
					else if(boltLoad == 5){
						if(o_hud.items[# xx, yy] == item.flintbolt && o_hud.count[# xx, yy] >= 1){
							flBoltP = false;
							
							remove_item(o_hud, xx, yy, 1);
							//o_hud.count[# xx, yy]--;
							ammo++;
							audio_play_sound(sn_crossbow_reload,0,0);
							loadSuccess = true;
						}
					}
					else if(boltLoad == 6){
						if(o_hud.items[# xx, yy] == item.poisonflintbolt && o_hud.count[# xx, yy] >= 1){
							flPoisBoltP = false;
							
							remove_item(o_hud, xx, yy, 1);
							//o_hud.count[# xx, yy]--;
							ammo++;
							audio_play_sound(sn_crossbow_reload,0,0);
							loadSuccess = true;
						}
					}else if(boltLoad == 7){
						if(o_hud.items[# xx, yy] == item.metalbolt && o_hud.count[# xx, yy] >= 1){
							mBoltP = false;
							
							remove_item(o_hud, xx, yy, 1);
							//o_hud.count[# xx, yy]--;
							ammo++;
							audio_play_sound(sn_crossbow_reload,0,0);
							loadSuccess = true;
						}
					}
					else if(boltLoad == 8){
						if(o_hud.items[# xx, yy] == item.poisonmetalbolt && o_hud.count[# xx, yy] >= 1){
							mPoisBoltP = false;
							
							remove_item(o_hud, xx, yy, 1);
							//o_hud.count[# xx, yy]--;
							ammo++;
							audio_play_sound(sn_crossbow_reload,0,0);
							loadSuccess = true;
						}
					}
				}
			}
		}
}

//height is three
for (var i = 0; i < 3; i++){
	if(!loadSuccess){
			if(weaponMode == 0){
				if(o_hud.hotbarItems[# 0, i] == item.rifleammo && o_hud.hotbarCount[# 0, i] >= 1){
					//if(ammo == 0)
					if(firstLoad){
						audio_play_sound(sn_rifle_bolt_open, 0, 0);
						firstLoad = false;	
					}
					o_hud.hotbarCount[# 0, i]--;
					ammo++;
					audio_play_sound(sn_rifle_reload,0,0);
					loadSuccess = true;
				}
			}
			else if(weaponMode == 1){
				if(o_hud.hotbarItems[# 0, i] == item.buckshot && o_hud.hotbarCount[# 0, i] >= 1){
					//if(ammo == 0)
					if(firstLoad){
						audio_play_sound(sn_shotgun_cock_open, 0, 0);
						firstLoad = false;		
					}
					o_hud.hotbarCount[# 0, i]--;
					ammo++;
					audio_play_sound(sn_shotgun_reload,0,0);
					loadSuccess = true;
				}
			}
			else if(weaponMode == 2){
				if(boltLoad == 0){
					if(o_hud.hotbarItems[# 0, i] == item.bolt && o_hud.hotbarCount[# 0, i] >= 1){
						wBoltP = false;
						o_hud.hotbarCount[# 0, i]--;
						ammo++;
						audio_play_sound(sn_crossbow_reload,0,0);
						loadSuccess = true;
					}
				}
				else if(boltLoad == 1){
					if(o_hud.hotbarItems[# 0, i] == item.poisonbolt && o_hud.hotbarCount[# 0, i] >= 1){
						wPoisBoltP = false;
						o_hud.hotbarCount[# 0, i]--;
						ammo++;
						audio_play_sound(sn_crossbow_reload,0,0);
						loadSuccess = true;
					}
				}
				else if(boltLoad == 2){
					if(o_hud.hotbarItems[# 0, i] == item.flamebolt && o_hud.hotbarCount[# 0, i] >= 1){
						fBoltP = false;
						o_hud.hotbarCount[# 0, i]--;
						ammo++;
						audio_play_sound(sn_crossbow_reload,0,0);
						loadSuccess = true;
					}
				}
				else if(boltLoad == 3){
					if(o_hud.hotbarItems[# 0, i] == item.bonebolt && o_hud.hotbarCount[# 0, i] >= 1){
						bBoltP = false;
						o_hud.hotbarCount[# 0, i]--;
						ammo++;
						audio_play_sound(sn_crossbow_reload,0,0);
						loadSuccess = true;
					}
				}
				else if(boltLoad == 4){
					if(o_hud.hotbarItems[# 0, i] == item.poisonbonebolt && o_hud.hotbarCount[# 0, i] >= 1){
						bPoisBoltP = false;
						o_hud.hotbarCount[# 0, i]--;
						ammo++;
						audio_play_sound(sn_crossbow_reload,0,0);
						loadSuccess = true;
					}
				}
				else if(boltLoad == 5){
					if(o_hud.hotbarItems[# 0, i] == item.flintbolt && o_hud.hotbarCount[# 0, i] >= 1){
						flBoltP = false;
						o_hud.hotbarCount[# 0, i]--;
						ammo++;
						audio_play_sound(sn_crossbow_reload,0,0);
						loadSuccess = true;
					}
				}
				else if(boltLoad == 6){
					if(o_hud.hotbarItems[# 0, i] == item.poisonflintbolt && o_hud.hotbarCount[# 0, i] >= 1){
						flPoisBoltP = false;
						o_hud.hotbarCount[# 0, i]--;
						ammo++;
						audio_play_sound(sn_crossbow_reload,0,0);
						loadSuccess = true;
					}
				}else if(boltLoad == 7){
					if(o_hud.hotbarItems[# 0, i] == item.metalbolt && o_hud.hotbarCount[# 0, i] >= 1){
						mBoltP = false;
						o_hud.hotbarCount[# 0, i]--;
						ammo++;
						audio_play_sound(sn_crossbow_reload,0,0);
						loadSuccess = true;
					}
				}
				else if(boltLoad == 8){
					if(o_hud.hotbarItems[# 0, i] == item.poisonmetalbolt && o_hud.hotbarCount[# 0, i] >= 1){
						mPoisBoltP = false;
						o_hud.hotbarCount[# 0, i]--;
						ammo++;
						audio_play_sound(sn_crossbow_reload,0,0);
						loadSuccess = true;
					}
				}
			}
		}
}

//o_hud.hotbar

if(!loadSuccess){
	isloading = false;
	alarm[1] = 75; //set alarm to set shooting possible
	alarm[3] = 15;	
	alarm[4] = 100; //set text delay
}
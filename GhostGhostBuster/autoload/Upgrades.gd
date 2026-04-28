extends Node

signal upgrade_acquired(upgrade:Dictionary, key_to_delete:String)

var UpgradesList:Dictionary = {
	"MORE DAMAGE": {
		"weapon": "default_weapon",
		"stat_to_upgrade": "damage",
		"amount": 0.5,
		"icon": preload("uid://i5r4w5iebs4")
	}, 
	"MORE FIREBALLS": {
		"weapon": "default_weapon",
		"stat_to_upgrade": "count",
		"amount": 1,
		"icon": preload("uid://i5r4w5iebs4")
	},
	"MORE ATTACK SPEED": {
		"weapon": "default_weapon",
		"stat_to_upgrade": "cooldown",
		"amount": 20,
		"icon": preload("uid://i5r4w5iebs4")
	},
	"MORE PELLETS": {
		"weapon": "shotgun_weapon",
		"stat_to_upgrade": "pellet_number",
		"amount": 2,
		"icon": preload("uid://i5r4w5iebs4")
	},
	"UNLOCK LASER": {
		"weapon": "laser_weapon",
		"stat_to_upgrade": "unlock",
		"icon": preload("uid://i5r4w5iebs4")
	},
	"UNLOCK SHOTGUN": {
		"weapon": "shotgun_weapon",
		"stat_to_upgrade": "unlock",
		"icon": preload("uid://i5r4w5iebs4")
	}
}

func delete_from_pool(key:String):
	UpgradesList.erase(key)

extends Node

signal upgrade_acquired(upgrade:Dictionary, key_to_delete:String)

var UpgradesList:Dictionary = {
	"MORE DAMAGE": {
		"weapon": "default_weapon",
		"stat_to_upgrade": "damage",
		"add_amount": 0.5,
		"icon": Image
	}, 
	"MORE FIREBALLS": {
		"weapon": "default_weapon",
		"stat_to_upgrade": "count",
		"add_amount": 1
	},
	"MORE ATTACK SPEED": {
		"weapon": "default_weapon",
		"stat_to_upgrade": "cooldown",
		"add_amount": 20
	},
	"MORE PELLETS": {
		"weapon": "shotgun_weapon",
		"stat_to_upgrade": "pellet_number",
		"add_amount": 2
	},
	"UNLOCK LASER": {
		"weapon": "laser_weapon",
		"stat_to_upgrade": "unlock"
	},
	"UNLOCK SHOTGUN": {
		"weapon": "shotgun_weapon",
		"stat_to_upgrade": "unlock"
	}
}

func delete_from_pool(key:String):
	UpgradesList.erase(key)

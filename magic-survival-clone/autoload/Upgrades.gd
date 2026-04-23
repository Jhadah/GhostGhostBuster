extends Node

signal upgrade_acquired(upgrade:Dictionary, key_to_delete:String)

var UpgradesList:Dictionary = {
	"MORE DAMAGE": {
		"weapon": "default_weapon",
		"stat_to_upgrade": "damage",
		"amount": 0.5,
		"icon": preload("res://ui/upgrade_icons/default_more_damage.png")
	}, 
	"MORE FIREBALLS": {
		"weapon": "default_weapon",
		"stat_to_upgrade": "count",
		"amount": 1,
		"icon": preload("res://ui/upgrade_icons/default_more_damage.png")
	},
	"MORE ATTACK SPEED": {
		"weapon": "default_weapon",
		"stat_to_upgrade": "cooldown",
		"amount": 20,
		"icon": preload("res://ui/upgrade_icons/default_more_damage.png")
	},
	"MORE PELLETS": {
		"weapon": "shotgun_weapon",
		"stat_to_upgrade": "pellet_number",
		"amount": 2,
		"icon": preload("res://ui/upgrade_icons/default_more_damage.png")
	},
	"UNLOCK LASER": {
		"weapon": "laser_weapon",
		"stat_to_upgrade": "unlock",
		"icon": preload("res://ui/upgrade_icons/default_more_damage.png")
	},
	"UNLOCK SHOTGUN": {
		"weapon": "shotgun_weapon",
		"stat_to_upgrade": "unlock",
		"icon": preload("res://ui/upgrade_icons/default_more_damage.png")
	}
}

func delete_from_pool(key:String):
	UpgradesList.erase(key)

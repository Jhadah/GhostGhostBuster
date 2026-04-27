extends Node

signal upgrade_acquired(upgrade:Dictionary, key_to_delete:String)

var UsableUpgrades:Dictionary = {}
var shotgun_upgrades:Dictionary = {
	"MORE PELLETS": {
		"weapon": "shotgun_weapon",
		"stat_to_upgrade": "pellet_number",
		"amount": 2,
		"icon": preload("res://ui/upgrade_icons/default_more_damage.png"),
		"description": "Shoot more pellets per shotgun shot"
	},
	"MORE SHOTGUN SPEED": {
		"weapon": "shotgun_weapon",
		"stat_to_upgrade": "cooldown",
		"icon": preload("res://ui/upgrade_icons/default_more_damage.png"),
		"description": "Decrease the downtime between shotgun shots"
	}
}
var laser_upgrades:Dictionary = {
	"MORE LASERS": {
		"weapon": "laser_weapon",
		"stat_to_upgrade": "count",
		"amount": 1,
		"icon": preload("res://ui/upgrade_icons/default_more_damage.png"),
		"description": "Shoot another laser in a different direction"
	}
}
var new_weapons_unlock:Dictionary = {
	"UNLOCK LASER": {
			"weapon": "laser_weapon",
			"stat_to_upgrade": "unlock",
			"icon": preload("res://ui/upgrade_icons/default_more_damage.png"),
			"description": "A beam of energy that pierces enemies"
		},
	"UNLOCK SHOTGUN": {
		"weapon": "shotgun_weapon",
		"stat_to_upgrade": "unlock",
		"upgrades_to_import": shotgun_upgrades,
		"icon": preload("res://ui/upgrade_icons/default_more_damage.png"),
		"description": "you know what a shotgun is..."
	}
}

func _ready() -> void:
	UsableUpgrades = {
		"MORE DAMAGE": {
			"weapon": "default_weapon",
			"stat_to_upgrade": "damage",
			"amount": 0.5,
			"icon": preload("res://ui/upgrade_icons/default_more_damage.png"),
			"description": "Increase fireball damage"
		}, 
		"MORE FIREBALLS": {
			"weapon": "default_weapon",
			"stat_to_upgrade": "count",
			"amount": 1,
			"icon": preload("res://ui/upgrade_icons/default_more_damage.png"),
			"description": "Shoot more fireballs"
		},
		"MORE ATTACK SPEED": {
			"weapon": "default_weapon",
			"stat_to_upgrade": "cooldown",
			"amount": 20,
			"icon": preload("res://ui/upgrade_icons/default_more_damage.png"),
			"description": "Decrease the downtime between fireballs"
		},
	}

func delete_from_pool(key:String):
	UsableUpgrades.erase(key)

func add_to_pool(dictionary:Dictionary):
	UsableUpgrades.merge(dictionary)

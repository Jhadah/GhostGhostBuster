extends Node

signal upgrade_acquired(upgrade:Dictionary, key_to_delete:String)

var UpgradesList:Dictionary = {
	"MORE DAMAGE 1": {
		"weapon": "default_weapon",
		"stat_to_upgrade": "damage",
		"add_amount": 0.5
	}, 
	"MORE FIREBALLS": {
		"weapon": "default_weapon",
		"stat_to_upgrade": "count",
		"add_amount": 1
	},
	"MORE ATTACK SPEED 1": {
		"weapon": "default_weapon",
		"stat_to_upgrade": "cooldown",
		"add_amount": 20
	},
	"UNLOCK LASER": {
		"weapon": "laser_weapon",
		"stat_to_upgrade": "unlock"
	}
}

func delete_from_pool(key:String):
	UpgradesList.erase(key)

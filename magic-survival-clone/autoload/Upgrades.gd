extends Node

signal upgrade_acquired(upgrade:Dictionary)

var UpgradesList:Dictionary = {
	#"MORE DAMAGE 1": {
		#"weapon": "default_weapon",
		#"stat_to_upgrade": "damage",
		#"add_amount": 1
	#}, 
	"MORE BULLETS": {
		"weapon": "default_weapon",
		"stat_to_upgrade": "count",
		"add_amount": 1
	},
	"MORE DAMAGE 2": {
		"weapon": "default_weapon",
		"stat_to_upgrade": "damage",
		"add_amount": 2
	}
}

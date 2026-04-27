extends ItemList

var keys:Array

func appear():
	visible = true
	get_tree().paused = true
	
	keys = Upgrades.UsableUpgrades.keys()
	keys.shuffle()
	
	for i in range(2):
		var key = keys[i]
		var upgrade = Upgrades.UsableUpgrades[key]
		var item = add_item(key, upgrade["icon"])
		
		set_item_metadata(item, upgrade)
		set_item_tooltip(item,upgrade["description"])

func disappear():
	visible = false
	get_tree().paused = false
	clear()

func _on_item_selected(index: int) -> void:
	Upgrades.upgrade_acquired.emit(get_item_metadata(index),keys[index])
	disappear()

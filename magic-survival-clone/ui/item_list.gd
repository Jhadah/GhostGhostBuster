extends ItemList

var keys:Array

func appear():
	visible = true
	get_tree().paused = true
	
	keys = Upgrades.UpgradesList.keys()
	keys.shuffle()
	
	for i in range(2):
		var upgrade = keys[i]
		var item = add_item(upgrade, Upgrades.UpgradesList[upgrade]["icon"])
		
		set_item_metadata(item, Upgrades.UpgradesList[upgrade])

func disappear():
	visible = false
	get_tree().paused = false
	clear()

func _on_item_selected(index: int) -> void:
	Upgrades.upgrade_acquired.emit(get_item_metadata(index),keys[index])
	disappear()

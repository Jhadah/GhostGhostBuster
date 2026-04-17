extends ItemList

var keys = Upgrades.UpgradesList.keys()

func appear():
	visible = true
	
	keys.shuffle()
	var upgrade1 = keys[0]
	var upgrade2 = keys[1]
	
	var item1 = add_item(upgrade1)
	set_item_metadata(item1, Upgrades.UpgradesList[upgrade1])
	var item2 = add_item(upgrade2)
	set_item_metadata(item2, Upgrades.UpgradesList[upgrade2])

func disappear():
	visible = false
	clear()

func _on_item_selected(index: int) -> void:
	Upgrades.upgrade_acquired.emit(get_item_metadata(index),keys[index])
	disappear()

extends ItemList



var keys = Upgrades.UpgradesList.keys()

var item1_idx
var item2_idx

func appear():
	visible = true
	
	keys.shuffle()
	var upgrade1 = keys[0]
	var upgrade2 = keys[1]
	
	item1_idx = add_item(upgrade1)
	set_item_metadata(item1_idx, Upgrades.UpgradesList[upgrade1])
	item2_idx = add_item(upgrade2)
	set_item_metadata(item2_idx, Upgrades.UpgradesList[upgrade2])

func disappear():
	visible = false
	clear()

func _on_item_selected(index: int) -> void:
	Upgrades.upgrade_acquired.emit(get_item_metadata(index))
	
	disappear()

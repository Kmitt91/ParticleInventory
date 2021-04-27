extends Panel


var ItemClass = preload("res://scenes/Spell.tscn")
var slot_index
var spell = null

signal cast_magic(magic)
signal delete_magic

enum SlotType {
	MAGIC_INVENTORY,
	MAGIC_EQUIP,
}

var slotType = null

func _ready():
	if randi() % 2 == 0:
		spell = ItemClass.instance()
		add_child(spell)


func pickFromSlot():
	remove_child(spell)
	var inventoryNode = find_parent("Inventory")
	inventoryNode.add_child(spell)
	spell = null
	emit_signal("delete_magic")

func putIntoSlot(new_spell):
	spell = new_spell
	spell.position = Vector2()
	var inventoryNode = find_parent("Inventory")
	inventoryNode.remove_child(spell)
	add_child(spell)
	emit_signal("cast_magic", spell.spell_name)
	

extends Node2D


const SlotClass = preload("res://scripts/Slot.gd")
onready var scroll_slots = $ScrollContainer.get_children()
onready var magic_equip_slot = $EquipScrollSlot.get_children()
var holding_item = null


func _ready():
	
	magic_equip_slot[0].connect("gui_input", self, "slot_gui_input", [magic_equip_slot[0]])
	magic_equip_slot[0].slot_index = 0
	magic_equip_slot[0].slotType = SlotClass.SlotType.MAGIC_EQUIP
	
	for i in range(scroll_slots.size()):
		scroll_slots[i].connect("gui_input", self, "slot_gui_input", [scroll_slots[i]])
		scroll_slots[i].slot_index = i
		scroll_slots[i].slotType = SlotClass.SlotType.MAGIC_INVENTORY
		
	



func slot_gui_input(event: InputEvent, slot: SlotClass):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
			if holding_item != null:
				if !slot.spell:
					slot.putIntoSlot(holding_item)
					holding_item = null
				else:
					if holding_item.spell_name != slot.spell.spell_name:
						var temp_item = slot.spell
						slot.pickFromSlot()
						temp_item.global_position = event.global_position
						slot.putIntoSlot(holding_item)
						holding_item = temp_item
			elif slot.spell:
				holding_item = slot.spell
				slot.pickFromSlot()
				holding_item.global_position = get_global_mouse_position()
				
			
		
	


func _input(event):
	if holding_item:
		holding_item.global_position = get_global_mouse_position()

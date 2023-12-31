extends StaticBody2D
#items 1 = corn seed, item 2 = wheat seed, item 3 = charm
var item = 1
var usedcharm = false

var item1price = 1
var item2price = 5
var item3price = 0
var item4price = 100

var item1owned = false
var item2owned = false
var item4owned = false

var price
# Called when the node enters the scene tree for the first time.
func _ready():
	$icon.play("corn_seed")
	item = 1
	$buy_button_color.color = "ff00147b" #red
	$buy_label.text = "buy"

func _physics_process(delta):
	if self.visible == true:
		if item == 1:
			$money_icon.visible = true
			$icon.play("corn_seed")
			$price_label.text = str(item1price)
			if Main.cash >= item1price:
				$buy_button_color.color = "00ff147b" #green
			else:
				$buy_button_color.color = "ff00147b"
		if item == 2:
			$money_icon.visible = true
			$icon.play("wheat_seed")
			$price_label.text = str(item2price)
			if Main.cash >= item2price:
				$buy_button_color.color = "00ff147b" #green
			else:
				$buy_button_color.color = "ff00147b"
		if item == 3:
			$money_icon.visible = false;
			$icon.play("charm")
			$price_label.text = "Charm"
			if not usedcharm:
				$buy_button_color.color = "00ff147b" #green
			else:
				$buy_button_color.color = "ff00147b" #red
		if item == 4:
			$money_icon.visible = false;
			$icon.play("retire")
			$price_label.text = "Retirement"
			if Main.cash >= item4price:
				$buy_button_color.color = "00ff147b" #green
			else:
				$buy_button_color.color = "ff00147b" #red
	

func _on_button_left_pressed():
	swap_item_back()


func _on_button_right_pressed():
	swap_item_forward()


func _on_buy_button_pressed():
	if item == 1:
		price = item1price
		if Main.cash >= price:
			if item1owned == false:
				buy(1)
	elif item == 2:
		price = item2price
		if Main.cash >= price:
			if item2owned == false:
				buy(2)
	elif item == 3 and not usedcharm:
		price = item3price
		if item2owned == false:
			buy(3)
	elif item == 4:
		price = item4price
		if Main.cash >= price:
			if item4owned == false:
				buy(4)

func swap_item_back():
	if item == 1:
		item = 4
	elif item == 2:
		item = 1
	elif item == 3:
		item = 2
	elif item == 4:
		item = 3

func swap_item_forward():
	if item == 1:
		item = 2
	elif item == 2:
		item = 3
	elif item == 3:
		item = 4
	elif item == 4:
		item = 1
		
func buy(i):
	Main.cash -= price
	if i == 1:
		item1owned = true
	if i == 2:
		item2owned = true
	if i == 3:
		usedcharm = true
		item2owned = true
	if i == 4:
		item4owned = true
	

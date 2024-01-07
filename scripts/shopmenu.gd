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
# initialize shop menu
func _ready():
	$icon.play("corn_seed")
	item = 1
	$buy_button_color.color = "ff00147b" #red
	$buy_label.text = "buy"

func _physics_process(delta):
	if Main.start:
		item = 1
	if self.visible == true:
		if item == 1:
			switch_to_corn()
		if item == 2:
			switch_to_wheat()
		if item == 3:
			charm_the_shopkeeper()
		if item == 4:
			switch_to_retirement()
	

func _on_button_left_pressed():
	swap_item_back()


func _on_button_right_pressed():
	swap_item_forward()

# allows or cancels action based on cash in inventory
func _on_buy_button_pressed():
	if item == 1:
		price = item1price
		if Main.cash >= price:
				buy(1)
	elif item == 2:
		price = item2price
		if Main.cash >= price:
				buy(2)
	elif item == 3 and not usedcharm:
		price = item3price
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
	Main.first_time_buy = false
	Main.cash -= price
	if i == 1:
		item1owned = true
		Main.numofcornseed += 1
	if i == 2:
		item2owned = true
		Main.numofwheatseed += 1
	if i == 3:
		usedcharm = true
		item2owned = true
		Main.numofwheatseed += 1
	if i == 4:
		item4owned = true
		Main.first_time_objective = false
		Main.first_time_win = false

#displays corn seed in item menu
func switch_to_corn():
	$money_icon.visible = true
	$icon.play("corn_seed")
	$price_label.text = str(item1price)
	$money_icon.play("default")
	if Main.cash >= item1price:
		$buy_button_color.color = "00ff147b" #green
	else:
		$buy_button_color.color = "ff00147b"

#displays wheat seed in item menu
func switch_to_wheat():
	$money_icon.visible = true
	$icon.play("wheat_seed")
	$price_label.text = str(item2price)
	$money_icon.play("med_bank")
	if Main.cash >= item2price:
		$buy_button_color.color = "00ff147b" #green
	else:
		$buy_button_color.color = "ff00147b"
	
#displays the charm option in item menu
func charm_the_shopkeeper():
	$money_icon.visible = false;
	$icon.play("charm")
	$price_label.text = "Charm"
	if not usedcharm:
		$buy_button_color.color = "00ff147b" #green
	else:
		$buy_button_color.color = "ff00147b" #red

#displays the retirement option in item menu
func switch_to_retirement():
	$money_icon.visible = true;
	$icon.play("retire")
	$price_label.text = "Retirement"
	$money_icon.play("big_bank")
	if Main.cash >= item4price:
		$buy_button_color.color = "00ff147b" #green
	else:
		$buy_button_color.color = "ff00147b" #red

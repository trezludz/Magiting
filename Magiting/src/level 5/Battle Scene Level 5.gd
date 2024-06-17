extends Control

onready var DisplayQuestion = $EnemyQuestion/Question

onready var ChoiceList = [$PlayerChoices/Choice1, 
							$PlayerChoices/Choice2, 
							$PlayerChoices/Choice3, 
							$PlayerChoices/Choice4
						]

onready var proceed_button = $Proceed



onready var world_scene = $"../Level5"
onready var player_stats = PlayerStats
onready var world_stats = WorldStats
onready var player_cam = $"../Level5/Player/PlayerCam"
onready var UI = $"../Level5/CanvasLayer"
onready var question_arr = get_parent().question_sets
var question_dict: Dictionary
signal disable_movement

var result
signal win
signal lose
signal game_over

func _ready():
	display_question()

func display_question():
	proceed_button.hide()
	question_dict = question_arr[get_parent().question_counter]
	DisplayQuestion.text = question_dict.question
	var choices = question_dict.choices
	for i in range(choices.size()):
		ChoiceList[i].text = choices[i]
	if choices[2] == "":
		$PlayerChoices/Choice3.disabled = true
	if choices[3] == "":
		$PlayerChoices/Choice4.disabled = true

func _on_Choice_1_pressed():
	if ChoiceList.find($PlayerChoices/Choice1) == question_dict.correctChoiceIndex:
		#Display Question.clear()
		DisplayQuestion.text = "You are correct!"
		result = "win"
		proceed_button.show()
	else:
		DisplayQuestion.text = "You are wrong!"
		result = "lose"
		proceed_button.show()
	$Hint.disabled = true
	$PlayerChoices/Choice1.disabled = true
	$PlayerChoices/Choice2.disabled = true
	$PlayerChoices/Choice3.disabled = true
	$PlayerChoices/Choice4.disabled = true
		
func _on_Choice_2_pressed():
	if ChoiceList.find($PlayerChoices/Choice2) == question_dict.correctChoiceIndex:
		DisplayQuestion.text = "You are correct!"
		result = "win"
		proceed_button.show()
	else:
		DisplayQuestion.text = "You are wrong!"
		result = "lose"
		proceed_button.show()
	$Hint.disabled = true
	$PlayerChoices/Choice1.disabled = true
	$PlayerChoices/Choice2.disabled = true
	$PlayerChoices/Choice3.disabled = true
	$PlayerChoices/Choice4.disabled = true

func _on_Choice_3_pressed():
	if ChoiceList.find($PlayerChoices/Choice3) == question_dict.correctChoiceIndex:
		DisplayQuestion.text = "You are correct!"
		result = "win"
		proceed_button.show()
	else:
		DisplayQuestion.text = "You are wrong!"
		result = "lose"
		proceed_button.show()
	$Hint.disabled = true
	$PlayerChoices/Choice1.disabled = true
	$PlayerChoices/Choice2.disabled = true
	$PlayerChoices/Choice3.disabled = true
	$PlayerChoices/Choice4.disabled = true
	
func _on_Choice_4_pressed():
	if ChoiceList.find($PlayerChoices/Choice4) == question_dict.correctChoiceIndex:
		DisplayQuestion.text = "You are correct!"
		result = "win"
		proceed_button.show()
	else:
		DisplayQuestion.text = "You are wrong!"
		result = "lose"
		proceed_button.show()
	$Hint.disabled = true
	$PlayerChoices/Choice1.disabled = true
	$PlayerChoices/Choice2.disabled = true
	$PlayerChoices/Choice3.disabled = true
	$PlayerChoices/Choice4.disabled = true

func _on_Hint_pressed():
	if world_stats.hints > 0:
		world_stats.hints -= 1
		while true:
			randomize()
			var index = randi() % 4
			if ChoiceList.find(ChoiceList[index]) != question_dict.correctChoiceIndex and ChoiceList[index].disabled == false:
				ChoiceList[index].disabled = true
				break

func _on_Proceed_pressed():
	if result == "win":
		world_stats.enemy.queue_free()
		get_parent().enemy_counter -= 1
		if player_stats.health < 5:
			player_stats.health += 1
	elif result == "lose":
		player_stats.health -= 1
	if player_stats.health == 0:
		emit_signal("game_over")
	if result == "win" and get_parent().question_counter > -1:
		get_parent().question_counter +=1
	world_scene.show()
	UI.show()
	$"../Level5/CanvasLayer/Player UI/Joystick".show()
	player_cam.make_current()
	queue_free()

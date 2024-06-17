extends Control

onready var DisplayHint = $Hint
onready var DisplayAnswer = $Answer
onready var world_scene = $"../Level2"
onready var player_cam = $"../Level2/Player/PlayerCam"
onready var UI = $"../Level2/CanvasLayer"
var player_stats = PlayerStats
var world_stats = WorldStats
var boss_stats = BossStats
onready var hangman_arr = get_parent().hangman_sets
var hangman_dict: Dictionary
var answer
var hidden_answer = ""
var alphabet = []
var result
var win_count = 0

signal disable_movement



func _ready():
	start_game()

func check_win():
	if answer == hidden_answer:
		win_count += 1
		result = "win"
		$Proceed.show()
		$DetailPanel/A.disabled = true
		$DetailPanel/B.disabled = true
		$DetailPanel/C.disabled = true
		$DetailPanel/D.disabled = true
		$DetailPanel/E.disabled = true
		$DetailPanel/F.disabled = true
		$DetailPanel/G.disabled = true
		$DetailPanel/H.disabled = true
		$DetailPanel/I.disabled = true
		$DetailPanel/J.disabled = true
		$DetailPanel/K.disabled = true
		$DetailPanel/L.disabled = true
		$DetailPanel/M.disabled = true
		$DetailPanel/N.disabled = true
		$"DetailPanel/Ñ".disabled = true
		$DetailPanel/O.disabled = true
		$DetailPanel/P.disabled = true
		$DetailPanel/Q.disabled = true
		$DetailPanel/R.disabled = true
		$DetailPanel/S.disabled = true
		$DetailPanel/T.disabled = true
		$DetailPanel/U.disabled = true
		$DetailPanel/V.disabled = true
		$DetailPanel/W.disabled = true
		$DetailPanel/X.disabled = true
		$DetailPanel/Y.disabled = true
		$DetailPanel/Z.disabled = true
	else:
		return

func start_game():
	$Proceed.hide()
	answer = ""
	hidden_answer = ""
	hangman_dict = hangman_arr[get_parent().hangman_counter]
	DisplayHint.text = hangman_dict.hint
	answer = hangman_dict.answer
	for i in range (0, answer.length()):
		if answer[i] == " ":
			hidden_answer = hidden_answer + " "
		else:
			hidden_answer = hidden_answer + "_"
	$DetailPanel/A.disabled = false
	$DetailPanel/B.disabled = false
	$DetailPanel/C.disabled = false
	$DetailPanel/D.disabled = false
	$DetailPanel/E.disabled = false
	$DetailPanel/F.disabled = false
	$DetailPanel/G.disabled = false
	$DetailPanel/H.disabled = false
	$DetailPanel/I.disabled = false
	$DetailPanel/J.disabled = false
	$DetailPanel/K.disabled = false
	$DetailPanel/L.disabled = false
	$DetailPanel/M.disabled = false
	$DetailPanel/N.disabled = false
	$"DetailPanel/Ñ".disabled = false
	$DetailPanel/O.disabled = false
	$DetailPanel/P.disabled = false
	$DetailPanel/Q.disabled = false
	$DetailPanel/R.disabled = false
	$DetailPanel/S.disabled = false
	$DetailPanel/T.disabled = false
	$DetailPanel/U.disabled = false
	$DetailPanel/V.disabled = false
	$DetailPanel/W.disabled = false
	$DetailPanel/X.disabled = false
	$DetailPanel/Y.disabled = false
	$DetailPanel/Z.disabled = false
	DisplayAnswer.text = hidden_answer
	
func _on_Proceed_pressed():
	print("hello")
	if result == "win" and win_count < 3:
		get_parent().hangman_counter += 1
		boss_stats.health -= 1
		_ready()
	elif result == "win" and win_count == 3:
		world_stats.enemy.queue_free()
		world_stats.boss_defeated = true
		world_scene.show()
		UI.show()
		player_cam.make_current()
		queue_free()
	elif player_stats.health > 0:
		_ready()
		player_stats.health -= 1
	elif player_stats.health == 0:
		emit_signal("game_over")
		queue_free()

func _on_A_pressed():
	if "A" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "A":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/A.disabled = true
	check_win()
	
func _on_B_pressed():
	if "B" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "B":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/B.disabled = true
	check_win()

func _on_C_pressed():
	if "C" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "C":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/C.disabled = true
	check_win()

func _on_D_pressed():
	if "D" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "D":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/D.disabled = true
	check_win()


func _on_E_pressed():
	if "E" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "E":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/E.disabled = true
	check_win()


func _on_F_pressed():
	if "F" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "F":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/F.disabled = true
	check_win()

func _on_G_pressed():
	if "G" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "G":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/G.disabled = true
	check_win()

func _on_H_pressed():
	if "H" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "H":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/H.disabled = true
	check_win()

func _on_I_pressed():
	if "I" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "I":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/I.disabled = true
	check_win()

func _on_J_pressed():
	if "J" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "J":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/J.disabled = true
	check_win()
	
func _on_K_pressed():
	if "K" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "K":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/K.disabled = true
	check_win()
	
func _on_L_pressed():
	if "L" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "L":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/L.disabled = true
	check_win()

func _on_M_pressed():
	if "M" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "M":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/M.disabled = true
	check_win()

func _on_N_pressed():
	if "N" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "N":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/N.disabled = true
	check_win()

func _on__pressed():
	if "Ñ" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "Ñ":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/"Ñ".disabled = true
	check_win()

func _on_O_pressed():
	if "O" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "O":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/O.disabled = true
	check_win()


func _on_P_pressed():
	if "P" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "P":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/P.disabled = true
	check_win()

func _on_Q_pressed():
	if "Q" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "Q":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/Q.disabled = true
	check_win()

func _on_R_pressed():
	if "R" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "R":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/R.disabled = true
	check_win()
	
func _on_S_pressed():
	if "S" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "S":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/S.disabled = true
	check_win()

func _on_T_pressed():
	if "T" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "T":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/T.disabled = true
	check_win()

func _on_U_pressed():
	if "U" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "U":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/U.disabled = true
	check_win()

func _on_V_pressed():
	if "V" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "V":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/V.disabled = true
	check_win()

func _on_W_pressed():
	if "W" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "W":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/W.disabled = true
	check_win()

func _on_X_pressed():
	if "X" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "X":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/X.disabled = true
	check_win()

func _on_Y_pressed():
	if "Y" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "Y":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
		
	DisplayAnswer.text = hidden_answer
	$DetailPanel/Y.disabled = true
	check_win()

func _on_Z_pressed():
	if "Z" in answer:
		for i in range(0, answer.length()):
			if answer[i] == "Z":
				hidden_answer[i] = answer[i]
	else:
		player_stats.health -=1
	
	DisplayAnswer.text = hidden_answer
	$DetailPanel/Z.disabled = true
	check_win()



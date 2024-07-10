extends ItemContainer

func hit():
	$LidSprite.hide()
	# pick random marker from spawnPositions to set as pos
	for i in range (5):
		var pos = $SpawnPositions.get_child(randi()%$SpawnPositions.get_child_count()).global_position
		open.emit(pos, current_direction)

extends KinematicBody2D

func anim(axle):
	
	if axle.x == 1:
		$Sprite.scale.x = 2
		
	if axle.x == -1:
		$Sprite.scale.x = -2
		
	
	axle = axle.normalized()
	if axle == Vector2():
		$AnimationTree.get("parameters/playback").travel("idle")
	else:
		$AnimationTree.get("parameters/playback").travel("run")
		$AnimationTree.set("parameters/idle/blend_position", axle)
		$AnimationTree.set("parameters/run/blend_position", axle)
	
	pass

func move():
	
	var direc = Vector2()
	var velocidade = 150
	
	if Input.is_action_pressed("rigth"):
		direc.x += velocidade
		
	if Input.is_action_pressed("left"):
		direc.x -= velocidade
		
	if Input.is_action_pressed("up"):
		direc.y -= velocidade
		
	if Input.is_action_pressed("down"):
		direc.y += velocidade
		
	
	direc = move_and_slide(direc).normalized()
	
	anim(direc)
	pass 

func _physics_process(delta):
	move()

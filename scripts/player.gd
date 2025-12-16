extends CharacterBody2D

const SPEED = 130.0

func _physics_process(_delta: float) -> void:
	var direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)

	if direction.length() > 0:
		velocity = direction.normalized() * SPEED
	else:
		velocity = Vector2.ZERO
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	elif velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	move_and_slide()

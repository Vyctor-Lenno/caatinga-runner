extends CharacterBody2D

@export var speed := 220.0
@export var jump_velocity := -420.0
@export var gravity := 980.0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		if velocity.y > 0:
			velocity.y = 0

	var direction := Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed

	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump_velocity

	move_and_slide()

class_name Player extends CharacterBody2D

const BASE_SPEED = 3000.0
const BASE_FRICTION = 1200.0

var speed = 3000
var friction = 1200

var mechanics_state: PlayerState = IdlePlayerState.new()

enum PhaseState { SOLID, LIQUID, GAS, PLASMA }
var phase_state: = PhaseState.LIQUID:
	set(s):
		if s is PhaseState:
			phase_state=s
			phase_state_updated()

func _physics_process(delta: float) -> void:
	mechanics_state._physics_process(self, delta)
	

func _input(event: InputEvent) -> void:
	if not event.is_action_pressed("phase_shift"):
		return
	phase_state = ((phase_state+1)%2) as PhaseState
	get_viewport().set_input_as_handled()
	

func _unhandled_input(event: InputEvent) -> void:
	var new_state = mechanics_state._unhandled_input(self, event)
	
	if new_state:
		mechanics_state = new_state
	
	

func phase_state_updated():
	match phase_state:
		PhaseState.SOLID:
			speed=BASE_SPEED*0.75
			friction=BASE_FRICTION*1.25
		PhaseState.LIQUID:
			speed=BASE_SPEED
			friction=BASE_FRICTION
		PhaseState.GAS:
			speed=BASE_SPEED*1.25
			friction=BASE_FRICTION*0.75
		PhaseState.PLASMA:
			speed=BASE_SPEED*1.3
			friction=BASE_FRICTION*1.3
	

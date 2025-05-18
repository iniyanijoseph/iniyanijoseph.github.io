extends Control

onready var tagNumLabel := $InputSet/TagVBoxContainer/Tag
onready var valueLabel := $InputSet/Value
onready var questionLabel := $InputSet/Question
onready var scoreLabel := $InputSet/ScoreVBoxContainer/ScoreLabel
onready var textureRect := $InputSet/TagVBoxContainer/TextureRect
onready var slider := $InputSet/ScoreVBoxContainer/HSlider
var tagNum : int
var inputValue := 0

export(String, MULTILINE) var question := "I leave or move on to another section when i smell a strong odor in a store"

func _ready() -> void:
	tagNumLabel.text = name + ". "
	tagNum = int(name)
	questionLabel.text = question

func _on_HSlider_value_changed(value):
	valueLabel.text = str(value)
	inputValue = value

func _process(_delta : float) -> void:
	if(inputValue == 1):
		scoreLabel.text = "Almost Never"
	elif(inputValue == 2):
		scoreLabel.text = "Seldom"
	elif(inputValue == 3):
		scoreLabel.text = "Occasionally"
	elif(inputValue == 4):
		scoreLabel.text = "Frequently"
	elif(inputValue == 5):
		scoreLabel.text = "Almost Always"

func setTexture(tex : Texture) -> void:
	textureRect.texture = tex

func _on_HSlider_focus_entered():
	if(slider.value == 0):
		slider.value = 1
	valueLabel.text = str(slider.value)
	inputValue = slider.value

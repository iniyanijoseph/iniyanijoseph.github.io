extends Control


var inputValues := []


var lowRegistration := [3, 6, 12, 15, 21, 23, 36, 37, 39, 41, 44, 45, 52, 55, 59]
var lowRegistrationRawScore := 0

var sensationSeeking := [2, 4, 8, 10, 14, 17, 19, 28, 30, 32, 40, 42, 47, 50, 58]
var sensationSeekingRawScore := 0

var sensorySensitivity := [7, 9, 13, 16, 20, 22, 25, 27, 31, 33, 34, 48, 51, 54, 60]
var sensorySensitivityRawScore := 0

var sensationAvoiding := [1, 5, 11, 18, 24, 26, 29, 35, 38, 43, 46, 49, 53, 56, 57]
var sensationAvoidingRawScore := 0

var quadrantSummary : Array = [
	[[18, 26, 40, 51, 75],
	[27, 41, 58, 65, 75],
	[19, 25, 40, 48, 75],
	[18, 25, 40, 48, 29, 75]],
	
	[[18, 23, 35, 44, 75],
	[35, 42, 56, 62, 75],
	[18, 25, 41, 48, 75],
	[19, 26, 41, 49, 75]],
	
	[[19, 26, 40, 51, 75],
	[29, 39, 52, 63, 75],
	[18, 25, 41, 48, 75],
	[18, 25, 42, 49, 75]],
	]

enum SUMMARYTITLES{
	LOW_REGISTRATION,
	SENSATION_SEEKING,
	SENSORY_SENSITIVITY,
	SENSATION_AVOIDING
	}
enum AGE{
	ELEVENTOSEVENTEEN,
	EIGHTEENTOSIXTYFOUR,
	SIXTYFIVEPLUS
	}

onready var infoDialog := $InfoDialog
onready var ageEdit := $VBoxContainer/HBoxContainer/LineEdit

var horizontalBarTexture : Texture = preload("res://horizontalBar.png")
var verticalBarTexture : Texture = preload("res://verticalBar.png")
var curveTexture : Texture = preload("res://curve.png")
var spiralTexture : Texture = preload("res://spiral.png")

func _ready() -> void:
	inputValues = get_tree().get_nodes_in_group("Input")
	for input in inputValues:
		if(input.tagNum in lowRegistration):
			input.setTexture(horizontalBarTexture)
		if(input.tagNum in sensationSeeking):
			input.setTexture(curveTexture)
		if(input.tagNum in sensorySensitivity):
			input.setTexture(spiralTexture)
		if(input.tagNum in sensationAvoiding):
			input.setTexture(verticalBarTexture)
	infoDialog.show()

func _process(_delta : float) -> void:
	lowRegistrationRawScore = 0
	sensationSeekingRawScore = 0
	sensorySensitivityRawScore = 0
	sensationAvoidingRawScore = 0
	for input in inputValues:
		if(input.tagNum in lowRegistration):
			lowRegistrationRawScore += input.inputValue
		if(input.tagNum in sensationSeeking):
			sensationSeekingRawScore += input.inputValue
		if(input.tagNum in sensorySensitivity):
			sensorySensitivityRawScore += input.inputValue
		if(input.tagNum in sensationAvoiding):
			sensationAvoidingRawScore += input.inputValue

func _on_ExportButton_pressed():
	var exportPath := OS.get_system_dir(OS.SYSTEM_DIR_DOWNLOADS) + "/SensoryProfileScore.csv"
	var file := File.new()
	var _x = file.open(exportPath, File.WRITE)
	var line : Array
	file.store_csv_line(["Low Registration"])
	for input in inputValues:
		if(input.tagNum in lowRegistration):
			line = (["Q" + str(input.tagNum), str(input.inputValue)])
			file.store_csv_line(line)
	file.store_csv_line([""])
	
	file.store_csv_line(["Sensation Seeking"])
	for input in inputValues:
		if(input.tagNum in sensationSeeking):
			line = (["Q" + str(input.tagNum), str(input.inputValue)])
			file.store_csv_line(line)
	file.store_csv_line([""])
	
	file.store_csv_line(["Sensory Sensitivity"])
	for input in inputValues:
		if(input.tagNum in sensorySensitivity):
			line = (["Q" + str(input.tagNum), str(input.inputValue)])
			file.store_csv_line(line)
	file.store_csv_line([""])

	file.store_csv_line(["Sensation Avoiding"])
	for input in inputValues:
		if(input.tagNum in sensationAvoiding):
			line = (["Q" + str(input.tagNum), str(input.inputValue)])
			file.store_csv_line(line)
	file.store_csv_line([""])

	
	line = (["Low Registration Raw Score", str(lowRegistrationRawScore)])
	file.store_csv_line(line)
	line = (["Sensation Seeking Raw Score", str(sensationSeekingRawScore)])
	file.store_csv_line(line)
	line = (["Sensory Sensitivity Raw Score", str(sensorySensitivityRawScore)])
	file.store_csv_line(line)
	line = (["Sensation Avoiding Raw Score", str(sensationAvoidingRawScore)])
	file.store_csv_line(line)
	file.store_csv_line([""])
	
	var chart : Array
	var age := int(ageEdit.text)
	if age <= 17:
		chart = quadrantSummary[AGE.ELEVENTOSEVENTEEN]
	elif age <= 64:
		chart = quadrantSummary[AGE.EIGHTEENTOSIXTYFOUR]
	else:
		chart = quadrantSummary[AGE.SIXTYFIVEPLUS]
		
	var lowRegistrationScore := getScore(chart[SUMMARYTITLES.LOW_REGISTRATION], lowRegistrationRawScore)
	line = ["Low Registration Score", lowRegistrationScore]
	file.store_csv_line(line)

	var sensationSeekingScore := getScore(chart[SUMMARYTITLES.SENSATION_SEEKING], sensationSeekingRawScore)
	line = ["Sensation Seeking Score", sensationSeekingScore]
	file.store_csv_line(line)
	
	var sensorySensitivityScore := getScore(chart[SUMMARYTITLES.SENSORY_SENSITIVITY], sensorySensitivityRawScore)
	line = ["Sensory Sensitivity Score", sensorySensitivityScore]
	file.store_csv_line(line)

	var sensationAvoidingScore := getScore(chart[SUMMARYTITLES.SENSATION_AVOIDING], sensationAvoidingRawScore)
	line = ["Sensation Avoiding Score", sensationAvoidingScore]
	file.store_csv_line(line)
	
	file.close()
	get_tree().quit()

func _on_Info_pressed() -> void:
	infoDialog.visible = !infoDialog.visible

func getScore(rankingArray : Array, value : int) -> String:
	if(value <= rankingArray[0]):
		return "Much Less Than Most People"
	elif(value <= rankingArray[1]):
		return "Less than Most People"
	elif(value <= rankingArray[2]):
		return "Similar to Most People"
	elif(value < rankingArray[3]):
		return "More Than most People"
	else:
		return "Much More Than Most People"

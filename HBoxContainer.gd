extends HBoxContainer
export(String, MULTILINE) var rowStringJSON=""

#func _ready():
#	$Name.rect_min_size=Vector2(self.rect_size*0.25)
#	$Brand.rect_min_size=Vector2(self.rect_size*0.4)
#	$Price.rect_min_size=Vector2(self.rect_size*0.15)
func _process(delta):
	#OS.delay_msec(500)
	if rowStringJSON=="":
		return
	var parsedObj=JSON.parse(rowStringJSON)
	$Name.text=parsedObj.result.name
	$Brand.text=parsedObj.result.brand
	$Price.text=String(parsedObj.result.mrp)

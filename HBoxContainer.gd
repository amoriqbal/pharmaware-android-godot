extends HBoxContainer
export(String, MULTILINE) var rowStringJSON=""

func _process(delta):
	#OS.delay_msec(500)
	if rowStringJSON=="":
		return
	var parsedObj=JSON.parse(rowStringJSON)
	$Name.text=parsedObj.result.name
	$Brand.text=parsedObj.result.brand
	$Price.text=String(parsedObj.result.mrp)

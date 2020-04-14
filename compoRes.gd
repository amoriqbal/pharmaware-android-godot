extends VBoxContainer
export (PackedScene) var RowContainerScene
export (String) var compoStringJSON
var expanded:bool
var results:Array
func _ready():
	expanded=false
	
func render():
	var parsedBody=JSON.parse(compoStringJSON)
	if(parsedBody.error==OK):
		$Button.text=String(parsedBody.result.name)
		if not expanded:
			while results.size():
#				print_debug("****************inside****************")
				var r=results.pop_front()
				if typeof(r)==typeof(RowContainerScene):
#					print_debug("****************freeing*******************");
					self.remove_child(r.get_ref())
					r.get_ref().queue_free();
		else:
			if parsedBody.result.Products.size():
				for ele in parsedBody.result.Products:
					results.push_back(weakref(RowContainerScene.instance()))
					#results.back().get_ref().text=JSON.print(ele)
					results.back().get_ref().rowStringJSON = JSON.print(ele)
					self.add_child(results.back().get_ref())


func _on_Button_pressed():
	expanded=!expanded
	render()

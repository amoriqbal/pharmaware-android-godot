extends Control
export(String) var url
#export(NodePath) var SearchText
var httpReqNodes: Array


func _on_SearchButton_pressed():
	var searchText=get_tree().call_group("SearchBox","getSearchText");
	#var data
	#data["search"]=SearchText.text
	
	var query="{\"search\":\""+$Main/Top/SearchBoxContainer/TextEdit.text+"\"}"
	var headers = ["Content-Type: application/json"]
	$HTTPRequest.request(url,headers,false,HTTPClient.METHOD_POST, query)

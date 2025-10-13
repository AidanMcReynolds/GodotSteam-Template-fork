extends Node

const APP_ID: int = 480
const STEAM_APP_ID: String = "SteamAppID"
const STEAM_GAME_ID: String = "SteamGameID"

var steam_id: int = 0
var steam_username: String = ""


func _init() -> void:
	OS.set_environment(STEAM_APP_ID, str(APP_ID))
	OS.set_environment(STEAM_GAME_ID, str(APP_ID))


func _ready() -> void: 
	var initialized: bool = Steam.steamInit()

	if not initialized:
		get_tree().quit()
		return

	steam_id = Steam.getSteamID()
	steam_username = Steam.getPersonaName()

func _process(_delta: float) -> void:
	Steam.run_callbacks()

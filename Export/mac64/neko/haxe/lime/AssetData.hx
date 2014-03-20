package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/icon-blur.png", "assets/icon-blur.png");
			type.set ("assets/icon-blur.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/icon.png", "assets/icon.png");
			type.set ("assets/icon.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/mask.png", "assets/mask.png");
			type.set ("assets/mask.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData

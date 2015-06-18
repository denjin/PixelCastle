package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import openfl.Assets;
import flixel.util.FlxSpriteUtil;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;

import flixel.util.FlxDestroyUtil;

import flixel.tile.FlxTilemap;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState {
	//the size of the tilemap tiles
	private static inline var TILE_WIDTH:Int = 16;
	private static inline var TILE_HEIGHT:Int = 16;
	
	//the tilemap
	private var terrainMap:FlxTilemap;
	
	private var highlightBox:FlxSprite;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void {
		terrainMap = new FlxTilemap();
		
		highlightBox = new FlxSprite(0, 0);
		highlightBox.makeGraphic(TILE_WIDTH, TILE_HEIGHT, FlxColor.TRANSPARENT);
		FlxSpriteUtil.drawRect(highlightBox, 0, 0, TILE_WIDTH - 1, TILE_HEIGHT - 1, FlxColor.TRANSPARENT, { thickness:1, color:FlxColor.WHITE } );
		add(highlightBox);
		
		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void {
		FlxDestroyUtil.destroy(terrainMap);
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void {
		highlightBox.x = Math.floor(FlxG.mouse.x / TILE_WIDTH) * TILE_WIDTH;
		highlightBox.y = Math.floor(FlxG.mouse.y / TILE_HEIGHT) * TILE_HEIGHT;
		
		super.update();
	}
}
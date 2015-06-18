package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

import flixel.util.FlxDestroyUtil;

using flixel.util.FlxSpriteUtil;


/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState {
	private var menuTitle:FlxText;
	private var playButton:FlxButton;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void {
		//create text for the top of the menu
		menuTitle = new FlxText(0, 0, 0, "PixelCastles", 14);
		add(menuTitle);
		
		//create button to play game
		playButton = new FlxButton(0, 0, "Play", clickPlay);
		playButton.screenCenter();
		add(playButton);
		
		
		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void {
		super.destroy();
		menuTitle = FlxDestroyUtil.destroy(menuTitle);
		playButton = FlxDestroyUtil.destroy(playButton);
		
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void {
		super.update();
	}
	
	private function clickPlay():Void {
		FlxG.switchState(new PlayState());
	}
}
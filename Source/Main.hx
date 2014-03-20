package;

import openfl.Assets;
import flash.display.Sprite;
import flash.display.BitmapData;
import flash.display.Bitmap;
import motion.easing.Linear;
import motion.Actuate;

class Main extends Sprite {
	
	private var counter = 1;
	
	public function new () {
		
		super ();
		createReels();
		
	}

	private function createReels(){

		createReel(170, "1");
		createReel(380, "2");
		createReel(560, "3");
		createReel(560, "4");
		createReel(560, "5");
		createMask();
	}

	private function createMask(){
		var bitmapData:BitmapData = Assets.getBitmapData ("assets/mask.png");
		var mask:Bitmap = new Bitmap(bitmapData);
		addChild(mask);
	}

	private function createReel(posX, id){
		var reelContainer:Sprite = new Sprite();
		addChild(reelContainer);
		reelContainer.name = "reel" + id;
		reelContainer.x = posX;
		reelContainer.y = -147;

		for (i in 0...4) {
			var bitmapData:BitmapData = Assets.getBitmapData ("assets/icon-blur.png");
			var blurReel:Bitmap = new Bitmap(bitmapData);
	       	reelContainer.addChild(blurReel);

	       	blurReel.y = i * (blurReel.height + 20);
		}

		spin(reelContainer);
	}

	private function spin(reel){
		var r:Sprite = reel;
		counter = 0;
		r.y = -200;
		for (i in 0...r.numChildren) {
			r.getChildAt(i).y = i * (r.getChildAt(i).height + 20);
		}

		Actuate.tween(r, .3, { y: 400 } ).ease(Linear.easeNone).onUpdate(checkItemsPosition, [r]).onComplete(spin, [r]);

	}

	private function checkItemsPosition(reel){

		var r:Sprite = reel;
		var itemH = ((r.height+20)/3);
		//trace((Math.floor(r.y)%itemH) + " - " + (r.y));
		for(i in 0...r.numChildren) {
			
			if(r.getChildAt(i).y + Math.floor(r.y) > 430){
				r.getChildAt(i).y = itemH * counter * -1;
				counter++;
			}

		}

	}
	
}
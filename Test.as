package
{
	import flash.display.Bitmap;
	import flash.display.GradientType;
	import flash.display.InterpolationMethod;
	import flash.display.Loader;
	import flash.display.Shape;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import flash.utils.Timer;

	public class Test extends Sprite
	{
		
		public function Test()
		{
			
			stage.scaleMode = StageScaleMode.NO_SCALE;
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onCompleteHandler);
			loader.load(new URLRequest("GEButton_down.png"));
			
//			var square:Shape = new Shape();
//			square.graphics.lineStyle(20, 0xFFCC00);
//			var gradientMatrix:Matrix = new Matrix();
//			gradientMatrix.createGradientBox(15, 15, Math.PI, 10, 10);
//			square.graphics.beginGradientFill(GradientType.RADIAL, 
//				[0xffff00, 0x0000ff], 
//				[100, 100], 
//				[0, 0xFF], 
//				gradientMatrix, 
//				SpreadMethod.REFLECT, 
//				InterpolationMethod.RGB, 
//				0.9);
//			square.graphics.drawRect(0, 0, 100, 100);
//			
//			var grid:Rectangle = new Rectangle(20, 20, 60, 60);
//			square.scale9Grid = grid ;
//			
//			addChild(square);
//			
//			var tim:Timer = new Timer(100);
//			tim.start();
//			tim.addEventListener(TimerEvent.TIMER, scale);
//			
//			var scaleFactor:Number = 1.01;
//			
//			function scale(event:TimerEvent):void {
//				square.scaleX *= scaleFactor;
//				square.scaleY *= scaleFactor;
//				
//				if (square.scaleX > 2.0) {
//					scaleFactor = 0.99;
//				}
//				if (square.scaleX < 1.0) {
//					scaleFactor = 1.01;
//				}
//			}
		}
		
		protected function onCompleteHandler(event:Event):void
		{
			var png:Bitmap = (event.currentTarget).content;
			addChild(png);
			
			var scalePng:Bitmap = new ScaleBitmap(png.bitmapData);
			var grid:Rectangle = new Rectangle(4, 4, 1, 1);
			scalePng.scale9Grid = grid ;
			scalePng.width = 20;
			scalePng.height = 20;
			scalePng.x= 100;
			
			var sp:Sprite = new Sprite();
			sp.graphics.beginFill(0x000000);
			sp.graphics.drawCircle(50,50,50);
			sp.graphics.endFill();
			addChild(sp);
			sp.addChild(scalePng);
			stage.addEventListener(MouseEvent.CLICK,onStageClick);
			sp.addEventListener(MouseEvent.CLICK,onSpClick);
			this.addEventListener(MouseEvent.CLICK,onThisClick);
			
			
		}
		
		protected function onThisClick(event:MouseEvent):void
		{
			trace("onThisCLick",event.currentTarget,event.target);
			///event.stopImmediatePropagation();
		//	event.stopPropagation();
		}
		
		protected function onSpClick(event:MouseEvent):void
		{
			trace("onSpClick",event.currentTarget,event.target);
			//event.stopPropagation();
			//event.stopImmediatePropagation();
		}
		
		protected function onStageClick(event:MouseEvent):void
		{
			trace("onStageClick",event.currentTarget,event.target);
		}
	}
}
package  
{
	import flash.text.*;
	import flash.filters.GlowFilter;
	
	/**
	 * ...
	 * @author crossin
	 */
	public class ZhText extends TextField 
	{	
		protected var format:TextFormat;
		protected var filter:GlowFilter;
		
		public function ZhText() {
			super();

			format = new TextFormat();   
			format.size = 24;   
			format.color = 0xdddddd;
			format.bold = true;
			
			filter = new GlowFilter();
			filter.color = 0x000000;
			filter.blurX = 2;
			filter.blurY = 2;
			
			defaultTextFormat = format;
			selectable = false;
			filters = [filter];
		}
	}

}
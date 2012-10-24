package com.saturn0076.as3.preloader.view.components 
{
	import fl.controls.ProgressBar;

	public class ProgressBar extends fl.controls.ProgressBar{
		// id, size and color 
		public var id:String;
		private var _sw:int;	//stageWidth
		private var _sh:int;	//stageHeight
		/**
		 * Constructor
		 */
		public function ProgressBar( id:String, params:Array=null) {
			this.id = id;
			if(params != null){
				updatePosition(params);
			}
		}
		
		public function updatePosition(params:Array=null):void {
			if(params != null){
				sw = params[0];
				sh = params[1];
				this.x = sw/2 - this.width/2;
				this.y = sh/2 - this.height/2;
			}
		}

		public function get sw():int { return _sw; }
		public function set sw(value:int):void { _sw = value; }
		public function get sh():int { return _sh; }
		public function set sh(value:int):void { _sh = value; }

	}
}
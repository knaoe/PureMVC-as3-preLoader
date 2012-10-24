package com.saturn0076.as3.preloader.view 
{
	import com.saturn0076.as3.preloader.PreloaderConst;
	import com.saturn0076.as3.preloader.view.components.ProgressBar;
	
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	/**
	 * A Mediator for interacting with the Stage.
	 */
	public class StageMediator extends Mediator implements IMediator {
		// Cannoncial name of the Mediator
		public static const NAME:String = 'StageMediator';
		
		/**
		 * Constructor.
		 */
		public function StageMediator( viewComponent:Object ){
			// pass the viewComponent to the superclass where
			// it will be stored in the inherited viewComponent propety
			super( NAME, viewComponent );
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			stage.addEventListener(Event.RESIZE, stageResizeHandler);
		}
		/**
		 * List all notifications this Mediator is interested in.
		 * <P>
		 * Automatically called by the framework when the mediator
		 * is registered with the view.</P>
		 * 
		 * @return Array the list of Nofitication names
		 */
		override public function listNotificationInterests():Array 
		{
			return [ 
				PreloaderConst.CALL_LOAD,
				PreloaderConst.UPDATE_PROGRESS,
				PreloaderConst.SUCCESS_LOAD
			];
		}
		
		/**
		 * Handle all notifications this Mediator is interested in.
		 * <P>
		 * Called by the framework when a notification is sent that
		 * this mediator expressed an interest in when registered
		 * (see <code>listNotificationInterests</code>.</P>
		 * 
		 * @param INotification a notification 
		 */
		override public function handleNotification( note:INotification ):void 
		{
			switch ( note.getName() ) {
				
				case PreloaderConst.CALL_LOAD:
					trace(NAME + "[CALL_LOAD]");
					var params:Array = note.getBody() as Array;
					var progressBar:ProgressBar = new ProgressBar( "preLoader", params);
					facade.registerMediator( new ProgressBarMediator( progressBar ));
					stage.addChild(progressBar);
					break;
				case PreloaderConst.UPDATE_PROGRESS:
					trace(NAME + "[UPDATE_LOAD]");
					
					break;
				case PreloaderConst.SUCCESS_LOAD:
					trace(NAME + "[SUCCESS_LOAD]");
					
					break;
			}
		}
		
		private function stageResizeHandler(event:Event):void {
			var stageObj:Array = [
				stage.stageWidth,
				stage.stageHeight
			];
			sendNotification( PreloaderConst.RESIZE_STAGE, stageObj)
		}
		/**
		 * Cast the viewComponent to its actual type.
		 * 
		 * <P>
		 * This is a useful idiom for mediators. The
		 * PureMVC Mediator class defines a viewComponent
		 * property of type Object. </P>
		 * 
		 * <P>
		 * Here, we cast the generic viewComponent to 
		 * its actual type in a protected mode. This 
		 * retains encapsulation, while allowing the instance
		 * (and subclassed instance) access to a 
		 * strongly typed reference with a meaningful
		 * name.</P>
		 * 
		 * @return stage the viewComponent cast to flash.display.Stage
		 */
		protected function get stage():Stage{
			return viewComponent as Stage;
		}
	}
}
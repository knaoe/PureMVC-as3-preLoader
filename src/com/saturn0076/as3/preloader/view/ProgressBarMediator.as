package com.saturn0076.as3.preloader.view 
{
	import com.saturn0076.as3.preloader.PreloaderConst;
	import com.saturn0076.as3.preloader.view.components.ProgressBar;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class ProgressBarMediator extends Mediator implements IMediator{
		/**
		 * Constructor.
		 */
		public function ProgressBarMediator( viewComponent:Object ) {
			// pass the viewComponent to the superclass where 
			// it will be stored in the inherited viewComponent property
			//
			// *** Note that the name of the mediator is the same as the
			// *** id of the HelloSprite it stewards. It does not use a
			// *** fixed 'NAME' constant as most single-use mediators do
			super( ProgressBar(viewComponent).id, viewComponent );
			
			
		}
		
		override public function listNotificationInterests():Array {
			return [ 
				PreloaderConst.UPDATE_PROGRESS,
				PreloaderConst.RESIZE_STAGE
			];
		}
		
		override public function handleNotification(note:INotification):void{
			switch(note.getName()) {
				case PreloaderConst.UPDATE_PROGRESS: {
					trace("[ProgressBarMediator][UPDATE_PROGRESS]");
					break;
				}
				case PreloaderConst.RESIZE_STAGE: {
					var params:Array = note.getBody() as Array;
					progressBar.updatePosition(params);
				}
				default: {
					break;
				}
			}
		}
		
		protected function get progressBar():ProgressBar{
			return viewComponent as ProgressBar;
		}
	}
}
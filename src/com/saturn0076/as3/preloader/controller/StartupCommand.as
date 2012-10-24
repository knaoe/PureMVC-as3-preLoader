package com.saturn0076.as3.preloader.controller 
{
	import com.saturn0076.as3.preloader.PreloaderConst;
	import com.saturn0076.as3.preloader.PreloaderFacade;
	import com.saturn0076.as3.preloader.view.StageMediator;
	
	import flash.display.Stage;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class StartupCommand extends SimpleCommand implements ICommand {
		/**
		 * Register the Proxies and Mediators.
		 * 
		 * Get the View Components for the Mediators from the app,
		 * which passed a refernce to itself on the notification.
		 */
		override public function execute(note:INotification):void
		{
			var stage:Stage = note.getBody() as Stage;
			
			facade.registerMediator( new StageMediator(stage) );
			var stageObj:Array = [
					stage.stageWidth,
					stage.stageHeight
				];
			sendNotification( PreloaderConst.CALL_LOAD, stageObj );
		}
	}
}
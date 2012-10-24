package com.saturn0076.as3.preloader 
{
	/*
	AS3 / Preloader on PureMVC
	By Kenichi Naoe <naoe@saturn-0076.com>
	Copyright(c) 2012, Some rights reserved.
	*/
	import com.saturn0076.as3.preloader.controller.StartupCommand;
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class PreloaderFacade extends Facade implements IFacade
	{
		// Notification name constants
		
		
		/**
		 * Singleton ApplicationFacade Factory Method
		 */
		public static function getInstance() : PreloaderFacade {
			if ( instance == null ) instance = new PreloaderFacade( );
			return instance as PreloaderFacade;
		}
		
		/**
		 * Register Commands with the Controller 
		 */
		override protected function initializeController( ) : void 
		{
			super.initializeController();            
			registerCommand( PreloaderConst.CALL_STARTUP, StartupCommand );
		}
		
		public function startup( stage:Object ):void
		{
			sendNotification( PreloaderConst.CALL_STARTUP, stage );
		}
		
	}
}
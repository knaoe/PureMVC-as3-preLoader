/*
PureMVC AS3 / Flash Demo - HelloFlash
By Cliff Hall <clifford.hall@puremvc.org>
Copyright(c) 2007-08, Some rights reserved.
*/
package 
{
	import com.saturn0076.as3.preloader.PreloaderFacade;
	
	import flash.display.MovieClip;
	
	import org.puremvc.as3.demos.helloworld.ApplicationFacade;
	
	public class Main extends MovieClip
	{
		public function Main()
		{
			PreloaderFacade.getInstance().startup( this.stage );
//			ApplicationFacade.getInstance().startup( this.stage );
		}
	}
}
/*
PureMVC AS3 / Flash Demo - HelloFlash
By Cliff Hall <clifford.hall@puremvc.org>
Copyright(c) 2007-08, Some rights reserved.
*/
package 
{
	import flash.display.MovieClip;
	import org.puremvc.as3.demos.helloworld.ApplicationFacade;
	
	public class Main extends MovieClip
	{
		public function Main()
		{
			ApplicationFacade.getInstance().startup( this.stage );
		}
	}
}
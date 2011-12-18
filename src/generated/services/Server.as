/**
 * This is a generated sub-class of _Server.as and is intended for behavior
 * customization.  This class is only generated when there is no file already present
 * at its target location.  Thus custom behavior that you add here will survive regeneration
 * of the super-class. 
 **/
 
package generated.services
{

public class Server extends _Super_Server
{
    /**
     * Override super.init() to provide any initialization customization if needed.
     */
    protected override function preInitializeService():void
    {
        super.preInitializeService();
        // Initialization customization goes here
    }
 
	public function set serverAddress(address:String):void {
		this._serviceControl.baseURL = address;
	}	
}

}

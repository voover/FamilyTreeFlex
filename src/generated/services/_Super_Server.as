/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - Server.as.
 */
package generated.services
{
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.services.wrapper.HTTPServiceWrapper;
import generated.valueObjects.GetTreeResponse;
import mx.rpc.AbstractOperation;
import mx.rpc.AsyncToken;
import mx.rpc.http.HTTPMultiService;
import mx.rpc.http.Operation;

import com.adobe.serializers.json.JSONSerializationFilter;

[ExcludeClass]
internal class _Super_Server extends com.adobe.fiber.services.wrapper.HTTPServiceWrapper
{
    private static var serializer0:JSONSerializationFilter = new JSONSerializationFilter();

    // Constructor
    public function _Super_Server()
    {
        // initialize service control
        _serviceControl = new mx.rpc.http.HTTPMultiService("http://localhost/familytree/");
         var operations:Array = new Array();
         var operation:mx.rpc.http.Operation;
         var argsArray:Array;

         operation = new mx.rpc.http.Operation(null, "getTree");
         operation.url = "get.php";
         operation.method = "GET";
         operation.serializationFilter = serializer0;
         operation.resultType = generated.valueObjects.GetTreeResponse;
         operations.push(operation);

         operation = new mx.rpc.http.Operation(null, "editNode");
         operation.url = "editnode.php";
         operation.method = "GET";
         argsArray = new Array("id","firstName","lastName","birthDate","deathDate","sex","source","relation");
         operation.argumentNames = argsArray;         
         operation.serializationFilter = serializer0;
         operation.resultType = generated.valueObjects.GetTreeResponse;
         operations.push(operation);

         _serviceControl.operationList = operations;  


         preInitializeService();
         model_internal::initialize();
    }
    
    //init initialization routine here, child class to override
    protected function preInitializeService():void
    {
      
    }
    

    /**
      * This method is a generated wrapper used to call the 'getTree' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function getTree() : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("getTree");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send() ;
        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'editNode' operation. It returns an mx.rpc.AsyncToken whose 
      * result property will be populated with the result of the operation when the server response is received. 
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value. 
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function editNode(id:int, firstName:String, lastName:String, birthDate:String, deathDate:String, sex:int, source:int, relation:String) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("editNode");
		var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(id,firstName,lastName,birthDate,deathDate,sex,source,relation) ;
        return _internal_token;
    }
     
}

}

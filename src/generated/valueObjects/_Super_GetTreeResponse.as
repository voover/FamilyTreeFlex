/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - GetTreeResponse.as.
 */

package generated.valueObjects
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.EventDispatcher;
import generated.valueObjects.Node;
import generated.valueObjects.Relation;
import mx.collections.ArrayCollection;
import mx.events.PropertyChangeEvent;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_GetTreeResponse extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
        generated.valueObjects.Relation.initRemoteClassAliasSingleChild();
        generated.valueObjects.Node.initRemoteClassAliasSingleChild();
    }

    model_internal var _dminternal_model : _GetTreeResponseEntityMetadata;
    model_internal var _changedObjects:mx.collections.ArrayCollection = new ArrayCollection();

    public function getChangedObjects() : Array
    {
        _changedObjects.addItemAt(this,0);
        return _changedObjects.source;
    }

    public function clearChangedObjects() : void
    {
        _changedObjects.removeAll();
    }

    /**
     * properties
     */
    private var _internal_relations : ArrayCollection;
    model_internal var _internal_relations_leaf:generated.valueObjects.Relation;
    private var _internal_nodes : ArrayCollection;
    model_internal var _internal_nodes_leaf:generated.valueObjects.Node;
    private var _internal_defaultRoot : int;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_GetTreeResponse()
    {
        _model = new _GetTreeResponseEntityMetadata(this);

        // Bind to own data or source properties for cache invalidation triggering

    }

    /**
     * data/source property getters
     */

    [Bindable(event="propertyChange")]
    public function get relations() : ArrayCollection
    {
        return _internal_relations;
    }

    [Bindable(event="propertyChange")]
    public function get nodes() : ArrayCollection
    {
        return _internal_nodes;
    }

    [Bindable(event="propertyChange")]
    public function get defaultRoot() : int
    {
        return _internal_defaultRoot;
    }

    public function clearAssociations() : void
    {
    }

    /**
     * data/source property setters
     */

    public function set relations(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_relations;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_relations = value;
            }
            else if (value is Array)
            {
                _internal_relations = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_relations = null;
            }
            else
            {
                throw new Error("value of relations must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "relations", oldValue, _internal_relations));
        }
    }

    public function set nodes(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_nodes;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_nodes = value;
            }
            else if (value is Array)
            {
                _internal_nodes = new ArrayCollection(value);
            }
            else if (value == null)
            {
                _internal_nodes = null;
            }
            else
            {
                throw new Error("value of nodes must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "nodes", oldValue, _internal_nodes));
        }
    }

    public function set defaultRoot(value:int) : void
    {
        var oldValue:int = _internal_defaultRoot;
        if (oldValue !== value)
        {
            _internal_defaultRoot = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "defaultRoot", oldValue, _internal_defaultRoot));
        }
    }

    /**
     * Data/source property setter listeners
     *
     * Each data property whose value affects other properties or the validity of the entity
     * needs to invalidate all previously calculated artifacts. These include:
     *  - any derived properties or constraints that reference the given data property.
     *  - any availability guards (variant expressions) that reference the given data property.
     *  - any style validations, message tokens or guards that reference the given data property.
     *  - the validity of the property (and the containing entity) if the given data property has a length restriction.
     *  - the validity of the property (and the containing entity) if the given data property is required.
     */


    /**
     * valid related derived properties
     */
    model_internal var _isValid : Boolean;
    model_internal var _invalidConstraints:Array = new Array();
    model_internal var _validationFailureMessages:Array = new Array();

    /**
     * derived property calculators
     */

    /**
     * isValid calculator
     */
    model_internal function calculateIsValid():Boolean
    {
        var violatedConsts:Array = new Array();
        var validationFailureMessages:Array = new Array();

        var propertyValidity:Boolean = true;

        model_internal::_cacheInitialized_isValid = true;
        model_internal::invalidConstraints_der = violatedConsts;
        model_internal::validationFailureMessages_der = validationFailureMessages;
        return violatedConsts.length == 0 && propertyValidity;
    }

    /**
     * derived property setters
     */

    model_internal function set isValid_der(value:Boolean) : void
    {
        var oldValue:Boolean = model_internal::_isValid;
        if (oldValue !== value)
        {
            model_internal::_isValid = value;
            _model.model_internal::fireChangeEvent("isValid", oldValue, model_internal::_isValid);
        }
    }

    /**
     * derived property getters
     */

    [Transient]
    [Bindable(event="propertyChange")]
    public function get _model() : _GetTreeResponseEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _GetTreeResponseEntityMetadata) : void
    {
        var oldValue : _GetTreeResponseEntityMetadata = model_internal::_dminternal_model;
        if (oldValue !== value)
        {
            model_internal::_dminternal_model = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_model", oldValue, model_internal::_dminternal_model));
        }
    }

    /**
     * methods
     */


    /**
     *  services
     */
    private var _managingService:com.adobe.fiber.services.IFiberManagingService;

    public function set managingService(managingService:com.adobe.fiber.services.IFiberManagingService):void
    {
        _managingService = managingService;
    }

    model_internal function set invalidConstraints_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_invalidConstraints;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_invalidConstraints = value;
            _model.model_internal::fireChangeEvent("invalidConstraints", oldValue, model_internal::_invalidConstraints);
        }
    }

    model_internal function set validationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_validationFailureMessages;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_validationFailureMessages = value;
            _model.model_internal::fireChangeEvent("validationFailureMessages", oldValue, model_internal::_validationFailureMessages);
        }
    }


}

}

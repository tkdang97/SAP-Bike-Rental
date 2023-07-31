using ExternalService as service from '../../srv/external-service';

annotate service.ServiceOrdersByCustomer with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Order ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Start date',
            Value : startDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Current rental duration',
            Value: currentDuration
        }
    ]
);
annotate service.ServiceOrdersByCustomer with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Order ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Start date',
                Value : startDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Current rental duration',
                Value : currentDuration,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Completed',
                Value : isComplete,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Customer ID',
                Value : customer,
            },
            // Button to navigate to the checkout app
            {
                $Type : 'UI.DataFieldForIntentBasedNavigation',
                SemanticObject : 'Order',
                Action : 'Checkout',
                Label : 'Checkout Bike'
            }       
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
            
        },
    ]
);

//annotate the cost field with the respective currency
annotate service.ServiceOrdersByCustomer with {
    cost @Measures.ISOCurrency : currency
};
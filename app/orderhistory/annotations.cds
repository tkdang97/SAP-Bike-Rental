using ExternalService as service from '../../srv/external-service';


annotate service.ServiceOrderHistory with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'startDate',
            Value : startDate,
        },
        {
            $Type : 'UI.DataField',
            Value : endDate,
            Label : 'endDate',
        },        
        {
            $Type : 'UI.DataField',
            Label : 'cost',
            Value : cost,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Rental duration',
            Value: currentDuration
        }
    ]
);
annotate service.ServiceOrderHistory with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'startDate',
                Value : startDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'endDate',
                Value : endDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'isComplete',
                Value : isComplete,
            },
            {
                $Type : 'UI.DataField',
                Label : 'customer',
                Value : customer,
            },
            {
                $Type : 'UI.DataField',
                Label : 'cost',
                Value : cost,
            },
            {
            $Type : 'UI.DataField',
            Label : 'Rental duration',
            Value: currentDuration
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
annotate service.ServiceOrderHistory with @(
    UI.Identification : []
);
annotate service.ServiceOrderHistory with {
    cost @Measures.ISOCurrency : currency
};

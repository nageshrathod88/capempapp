using CDSViewSrv as service from '../../srv/CDService';
annotate service.PODetails with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'purchaseorder',
                Value : purchaseorder,
            },
            {
                $Type : 'UI.DataField',
                Value : VendorID,
            },
            {
                $Type : 'UI.DataField',
                Value : companyname,
            },
            {
                $Type : 'UI.DataField',
                Label : 'POGrossamount',
                Value : POGrossamount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'POCurrency',
                Value : POCurrency,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ItemPosition',
                Value : ItemPosition,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ProductID',
                Value : ProductID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ProductDec',
                Value : ProductDec,
            },
            {
                $Type : 'UI.DataField',
                Label : 'City',
                Value : City,
            },
            {
                $Type : 'UI.DataField',
                Label : 'County',
                Value : County,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ItemGrossAmount',
                Value : ItemGrossAmount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ItemNetAmount',
                Value : ItemNetAmount,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'ItemPosition',
            Value : ItemPosition,
        },
        {
            $Type : 'UI.DataField',
            Label : 'purchaseorder',
            Value : purchaseorder,
        },
        {
            $Type : 'UI.DataField',
            Value : VendorID,
        },
        {
            $Type : 'UI.DataField',
            Value : companyname,
        },
        {
            $Type : 'UI.DataField',
            Label : 'POGrossamount',
            Value : POGrossamount,
        },
    ],
);


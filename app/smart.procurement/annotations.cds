using ProcurementService as service from '../../srv/procurement-service';

annotate service.PurchaseRequests with @(
    UI.FieldGroup #GeneratedGroup: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Title}',
                Value: title,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>RequestNo}',
                Value: requestNo,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>RequestDate}',
                Value: requestDate,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>RequiredByDate}',
                Value: requiredByDate,
            },
            {
                $Type: 'UI.DataField',
                Value: status_code,
            },
            {
                $Type: 'UI.DataField',
                Value: priority_code,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>TotalAmount}',
                Value: totalAmount,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Remarks}',
                Value: remarks,
            },
            {
                $Type: 'UI.DataField',
                Label: '{i18n>Currency}',
                Value: currency_code,
            },
            {
                $Type: 'UI.DataField',
                Value: employee_ID,
                Label: '{i18n>EmployeeId}',
            },
            {
                $Type: 'UI.DataField',
                Value: vendor_ID,
                Label: '{i18n>VendorId}',
            },
        ],
    },
    UI.Facets                    : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneratedGroup',
    }, ],
    UI.LineItem                  : [
        {
            $Type: 'UI.DataField',
            Label: '{i18n>RequestNo}',
            Value: requestNo,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>Title}',
            Value: title,
        },
        {
            $Type: 'UI.DataField',
            Value: employee.name,
            Label: '{i18n>Employee}',
        },
        {
            $Type: 'UI.DataField',
            Value: priority_code,
        },
        {
            $Type: 'UI.DataField',
            Value: status_code,
        },
        {
            $Type: 'UI.DataField',
            Value: totalAmount,
            Label: '{i18n>TotalAmount}',
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>RequiredBy}',
            Value: requiredByDate,
        },
        {
            $Type: 'UI.DataField',
            Value: requestDate,
            Label: '{i18n>RequestDate}',
        },
    ],
    UI.SelectionFields           : [
        priority_code,
        status_code,
        employee_ID,
    ],
    UI.HeaderInfo                : {
        Title         : {
            $Type: 'UI.DataField',
            Value: requestNo,
        },
        TypeName      : '',
        TypeNamePlural: '',
    },
);

annotate service.PurchaseRequests with {
    employee @(
        Common.ValueList   : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Employees',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: employeeNumber,
                    ValueListProperty: 'employeeNumber',
                    Label           : 'Employee Number',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    LocalDataProperty: name,
                    ValueListProperty: 'name',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    LocalDataProperty: email,
                    ValueListProperty: 'email',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    LocalDataProperty: designation,
                    ValueListProperty: 'designation',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    LocalDataProperty: joiningDate,
                    ValueListProperty: 'joiningDate',
                }
            ],
        },
        Common.FieldControl: #Mandatory,
        Common.Label       : '{i18n>Employee}',
    //   Common.ValueListWithFixedValues : true,
    )
};

annotate service.Employees with {
    employeeNumber @Common.Label: '{i18n>Employee Number}';
    name           @Common.Label: '{i18n>Name}';
    email          @Common.Label: '{i18n>Email}';
    designation    @Common.Label: '{i18n>Designation}';
    joiningDate    @Common.Label: '{i18n>Joining Date}';
};


annotate service.PurchaseRequests with {
    vendor @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Vendors',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: vendor_ID,
                ValueListProperty: 'ID',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'vendorCode',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'name',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'email',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'phone',
            },
        ],
    }
};

annotate service.PurchaseRequests with {
    currency @Common.ValueList: {
        $Type         : 'Common.ValueListType',
        CollectionPath: 'Currencies',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: currency_code,
                ValueListProperty: 'code',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'description',
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'symbol',
            },
        ],
    }
};


annotate service.PurchaseRequests with {
    status @Common.Label: '{i18n>Status}'
};

// annotate service.Employees with {
//     name @(
//         Common.Label    : '{i18n>Employee}',
//         Common.ValueList: {
//             $Type         : 'Common.ValueListType',
//             CollectionPath: 'Employees',
//             Parameters    : [
//                 {
//                     $Type            : 'Common.ValueListParameterInOut',
//                     LocalDataProperty: employeeNumber,
//                     ValueListProperty: 'employeeNumber',
//                     Common.Label     : '{i18n>Employee Number}'
//                 },
//                 {
//                     $Type            : 'Common.ValueListParameterDisplayOnly',
//                     LocalDataProperty: name,
//                     ValueListProperty: 'name',
//                     Common.Label     : '{i18n>Name}'
//                 },
//                 {
//                     $Type            : 'Common.ValueListParameterDisplayOnly',
//                     LocalDataProperty: email,
//                     ValueListProperty: 'email',
//                     Common.Label     : '{i18n>Email}'
//                 },
//                 {
//                     $Type            : 'Common.ValueListParameterDisplayOnly',
//                     LocalDataProperty: designation,
//                     ValueListProperty: 'designation',
//                     Common.Label     : '{i18n>Designation}'
//                 },
//                 {
//                     $Type            : 'Common.ValueListParameterDisplayOnly',
//                     LocalDataProperty: joiningDate,
//                     ValueListProperty: 'joiningDate',
//                     Common.Label     : '{i18n>Joining Date}'
//                 },
//             ],
//         },
//     //Common.ValueListWithFixedValues : true,
//     )
// };

annotate service.PurchaseRequests with {
    requestNo @Common.FieldControl: #ReadOnly
};

annotate service.PurchaseRequests with {
    title @Common.FieldControl: #Mandatory
};

annotate service.PurchaseRequests with {
    requestDate @Common.FieldControl: #Mandatory
};

annotate service.PurchaseRequests with {
    priority @(
        Common.ValueListWithFixedValues: true,
        Common.Label                   : '{i18n>Priority}',
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Priorities',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: priority_code,
                    ValueListProperty: 'code',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description',
                },
            ],
        }
    )
};

annotate service.PurchaseRequests with {
    status @(
        Common.ValueListWithFixedValues: true,
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Statuses',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: status_code,
                    ValueListProperty: 'code',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description',
                },
            ],
        }
    )
};

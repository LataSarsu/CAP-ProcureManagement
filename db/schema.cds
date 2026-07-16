namespace smart.procurement;

using {
    cuid,
    managed
} from '@sap/cds/common';

type Priority       : String enum {
    LOW;
    MEDIUM;
    HIGH;
}

entity Department : cuid, managed {
    departmentCode : String(10) not null @assert.unique: true;
    name           : String(100);
    costCenter     : String(20);
    isActive       : Boolean default true;
    employees      : Association to many Employee
                         on employees.department = $self;
}

entity Employee : cuid, managed {
    employeeNumber : String(10) not null;
    name           : String(100) not null;
    email          : String(100) not null;
    designation    : String(50);
    joiningDate    : Date;
    isActive       : Boolean default true;
    department     : Association to Department;
}

entity PurchaseRequest : cuid, managed {
    title           : String(150);
    requestNo       : String(20);
    requestDate     : Date not null;
    requiredByDate  : Date;
    status          : Status default 'DRAFT';
    priority        : Priority default 'MEDIUM';
    totalAmount     : Decimal(15, 2);
    remarks         : String(255);
    employee        : Association to Employee not null;
    vendor          : Association to Vendor;
    items           : Composition of many PurchaseItem
                          on items.purchaseRequest = $self;
    approvalHistory : Composition of many ApprovalHistory
                          on approvalHistory.purchaseRequest = $self;
    currency        : Association to Currency;
}

entity Currency {
    key code        : String(3);
        description : String(50);
        symbol      : String(5);
}

entity PurchaseItem : cuid, managed {
    itemNo          : Integer not null;
    materialName    : String(255);
    quantity        : Decimal(13, 3);
    unitPrice       : Decimal(15, 2);
    amount          : Decimal(15, 2);
    uom             : String(10);
    purchaseRequest : Association to PurchaseRequest not null;
}

type Status         : String enum {
    DRAFT;
    SUBMITTED;
    MANAGER_APPROVED;
    FINANCE_APPROVED;
    PO_CREATED;
    COMPLETED;
    REJECTED;
}

entity Vendor : cuid, managed {
    vendorCode : String(20) not null @assert.unique: true;
    name       : String(100);
    email      : String(100);
    phone      : String(20);
    gstin      : String(20);
    city       : String(50);
    country    : String(50);
    isActive   : Boolean default true;
}

entity ApprovalHistory : cuid, managed {
    action          : ApprovalAction;
    comments        : String(255);
    approvedBy      : Association to Employee not null;
    purchaseRequest : Association to PurchaseRequest not null;
}

type ApprovalAction : String enum {
    SUBMITTED;
    APPROVED;
    REJECTED;
    RETURNED;
}

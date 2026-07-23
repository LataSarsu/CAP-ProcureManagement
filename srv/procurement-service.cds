using {smart.procurement as db} from '../db/schema';

service ProcurementService {

    entity PurchaseRequests as projection on db.PurchaseRequest;
    entity PurchaseItems    as projection on db.PurchaseItem;
    entity Employees        as projection on db.Employee;
    entity NumberRanges     as projection on db.NumberRange;
    entity Priorities       as projection on db.Priority;
    entity Statuses         as projection on db.Status;

    @readonly
    entity Departments      as projection on db.Department;

    entity Vendors          as projection on db.Vendor;
    entity Currencies       as projection on db.Currency;
}

annotate ProcurementService.PurchaseRequests with @odata.draft.enabled;


using {smart.procurement as db} from '../db/schema';

service ProcurementService {

    entity PurchaseRequests as projection on db.PurchaseRequest;
    entity PurchaseItems    as projection on db.PurchaseItem;
    entity Employees        as projection on db.Employee;
     @readonly
    entity Departments      as projection on db.Department;
    entity Vendors          as projection on db.Vendor;
    entity Currencies        as projection on db.Currency;
}

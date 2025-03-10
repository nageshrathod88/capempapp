using { epm.db.master, epm.db.transaction } from '../db/datamodel';

service catalogservice @(path:'EPMServices') {
    entity businesspartner as projection on master.businesspartner;
    annotate catalogservice.businesspartner with @(Capabilities : { 
        InsertRestrictions : {
            Insertable : false,            
        },
        UpdateRestrictions : {
            Updatable : false,            
        },
        DeleteRestrictions : {
            Deletable : false,            
        }
    });     
    
    entity address as projection on master.address;
    entity product as projection on master.product;
    entity purchaseorder as projection on transaction.purchaseorder;
    entity poitems as projection on transaction.poitems; 
    @readonly
    entity worker as projection on master.worker; 
    
}

@impl: './highSal.js'
service highSal {
    entity highWorkers as projection on master.worker;
    function getHighestSalary() returns Decimal(15,2);
}

@impl: './incrementLogic.js'
service salaryservice  {
    entity salaryWorkers as projection on master.worker;
    action increaseSalary(ID:UUID);
}
using {bikerental.db as db} from '../db/schema';

service MappingService @(requires: 'authenticated-user'){    
    entity customersMap @(restrict: [
    { grant: '*', to: 'admin' }
    ]) as projection on db.customersMap
    type paymentInfo {
        email: String;
        paymentMethod: String;
        cardNo: String;
    }

    function getPaymentInfo () returns paymentInfo;

    action updatePaymentInfo (paymentMethod: String, cardNo: String) returns Integer;
}
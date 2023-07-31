// Import of all remote entity definitions (from https://api.sap.com/package/S4HANAOPAPI/all)
using {API_BUSINESS_PARTNER as bupa} from './external/API_BUSINESS_PARTNER';
using {OP_API_SERVICE_ORDER_SRV_0001 as srvorder} from './external/OP_API_SERVICE_ORDER_SRV_0001';
using {OP_API_EQUIPMENT as equi} from './external/OP_API_EQUIPMENT';
using {OP_PRODUCT_0001 as prod} from './external/OP_PRODUCT_0001';
using { MEASUREMENTDOCUMENT_0001 as measdoc } from './external/MEASUREMENTDOCUMENT_0001';
using { OP_API_MEASURINGPOINT_0001 as measpoint } from './external/OP_API_MEASURINGPOINT_0001';
using { OP_API_SERVICE_CONFIRMATION_SRV_0001 as srvconfirmation} from './external/OP_API_SERVICE_CONFIRMATION_SRV_0001';
using { OP_API_BILLING_DOCUMENT_SRV_0001 as billingdoc} from './external/OP_API_BILLING_DOCUMENT_SRV_0001';

//Service is only available for logged in users, entities then have more specific role requirements
service ExternalService @(requires: 'authenticated-user'){
    entity Customers @(restrict: [
    { grant: '*', to: 'admin' }
    ])
    as projection on bupa.A_BusinessPartner {
        key BusinessPartner as ID,
        BusinessPartnerFullName,
        FirstName,
        LastName,
        to_BusinessPartnerAddress as addresses: redirected to CustomerAddresses
    }

    entity CustomerAddresses @(restrict: [
    { grant: '*', to: 'admin' }
    ]) as projection on bupa.A_BusinessPartnerAddress {
        BusinessPartner as bupaID,
        AddressID as ID,
        PostalCode as postcode,
        CityName as city,
        StreetName as street,
        HouseNumber as number,
        to_EmailAddress as mailAddresses: redirected to CustomerMails
    }

    entity CustomerMails @(restrict: [
    { grant: '*', to: 'admin' }
    ]) as projection on bupa.A_AddressEmailAddress {
        AddressID as ID,
        Person as personalID,
        OrdinalNumber as ordinal,
        EmailAddress as Email,
    }

    //enforced programatically via Node.js
    entity ServiceOrders as projection on srvorder.A_ServiceOrder {
        ServiceOrder as ID,
        ServiceOrderType as type,
        RequestedServiceStartDateTime as startDate,
        RequestedServiceEndDateTime as endDate,
        ServiceOrderIsCompleted as isComplete,
        ServiceOrderIsReleased as isReleased,
        SoldToParty as customer,
        ServiceDocGrossAmount as cost,
        TransactionCurrency as currency,
        to_Item as orderItems: redirected to ServiceOrderItems,
        to_ReferenceObject as refObjects: redirected to ServiceOrderObjects,
        to_Confirmation as confirmation: redirected to ServiceOrderConfirmations,
        to_PersonResponsible as responsible: redirected to ServiceOrderPersonResp
    };

    entity ServiceOrderItems as projection on srvorder.A_ServiceOrderItem {
        ServiceOrderItem as ID,
        ServiceOrder as orderID,
        Product,
        Quantity,
        QuantityUnit,
        ProfitCenter,
        to_PricingElement as priceElement: redirected to ServiceOrderItemPriceElements
    }

    entity ServiceOrderObjects as projection on srvorder.A_ServiceOrderRefObject {
        ServiceOrder as ID,
        ServiceReferenceEquipment as equipmentID
    }

    entity ServiceOrderConfirmations as projection on srvorder.A_ServiceOrderConfirmation

    entity ServiceOrderPersonResp as projection on srvorder.A_ServiceOrderPersonResp {
        ServiceOrder as ID,
        PersonResponsible as employeeID,
        CustMgmtPartnerIsMainPartner as isMain
    }

    entity ServiceOrderItemPriceElements as projection on srvorder.A_ServiceOrderItemPriceElement {
        ServiceOrder as orderID,
        ServiceOrderItem as itemID,
        PricingProcedureStep as step,
        PricingProcedureCounter as cnt,
        ConditionRateValue as rate,
        ConditionCurrency as currency
    }

    entity Bikes @(restrict: [
    { grant: '*', to: 'admin' }
    ]) as projection on equi.Equipment {
        Equipment as ID,
        EquipmentCategory as equipCategory,
        ValidityEndDate as validTo,
        Material as productID,
        SerialNumber as serialNo,
        AssetManufacturerName as manufacturer,
        ManufacturerPartTypeName as model
    }

    @(restrict: [
    { grant: '*', to: 'admin' },
    { grant: 'READ', to: 'customer'}
    ])
    @cds.persistence.skip : true
    entity BikesMap {
        key ID: String(18) not null;
        key validTo: Date not null;
        equipCategory: String(1);
        productID: String(40);
        serialNo: String(18);
        manufacturer: String(30);
        model: String(20);
        longitude: Decimal;
        latitude: Decimal;
        status: Integer;
    }

    entity MeasuringDocs @(restrict: [
    { grant: '*', to: 'admin' }
    ]) as projection on measdoc.MeasurementDocument {
        MeasurementDocument as ID,
        MeasuringPoint as pointID,
        MeasurementReadingDateTime as readingDate,
        MeasurementReadingEntryUoM as unit,
        MeasurementReading as readingValue,
    };

    entity MeasuringPoints @(restrict: [
    { grant: '*', to: 'admin' }
    ]) as projection on measpoint.MeasuringPoint {
        MeasuringPoint as ID,
        MeasuringPointDescription as description,
        MeasuringPointCategory as category,
        MeasurementRangeUnit as unit,
        Equipment as equipmentID, 
        MsrgPtInternalCharacteristic as characteristic
    };

    entity ServiceConfirmations @(restrict: [
    { grant: '*', to: 'admin' },
    { grant: ['READ', 'WRITE'], to: 'customer'}
    ]) as projection on srvconfirmation.A_ServiceConfirmation {
        ServiceConfirmation as ID,
        ReferenceServiceOrder as orderID,
        ServiceConfirmationIsFinal as isFinal,
        ServiceConfirmationType as type,
        ServiceConfirmationIsCompleted as isComplete,
        to_Item as confirmationItem: redirected to ServiceConfirmationItems,
        to_ReferenceObject as refObjects: redirected to ServiceConfirmationObjects
    }

    entity ServiceConfirmationItems as projection on srvconfirmation.A_ServiceConfirmationItem {
        ServiceConfirmation as ID,
        ServiceConfirmationItem as itemID,
        Product,
        Quantity,
        QuantityUnit,
        ExecutingServiceEmployee as execEmployee,
        ActualServiceDuration as actualDuration,
        ActualServiceDurationUnit as durationUnit,
        ReferenceServiceOrder as orderID,
        ReferenceServiceOrderItem as orderItemID
    }

    entity ServiceConfirmationObjects as projection on srvconfirmation.A_ServiceConfRefObject {
        ServiceConfirmation as ID,
        ServiceReferenceEquipment as equipmentID
    }
    
    entity ServiceOrdersByCustomer as projection on srvorder.A_ServiceOrder {
        ServiceOrder as ID,
        ServiceOrderType as type,
        RequestedServiceStartDateTime as startDate: Timestamp,
        RequestedServiceEndDateTime as endDate: Timestamp,
        ServiceOrderIsCompleted as isComplete,
        ServiceOrderIsReleased as isReleased,
        SoldToParty as customer,
        ServiceDocGrossAmount as cost,
        TransactionCurrency as currency,
        null as currentDuration: String,
        to_Item as orderItems: redirected to ServiceOrderItems,
        to_ReferenceObject as refObjects: redirected to ServiceOrderObjects,
        to_Confirmation as confirmation: redirected to ServiceOrderConfirmations,
        to_PersonResponsible as responsible: redirected to ServiceOrderPersonResp
    }

    entity BillingDocs @(restrict: [
    { grant: '*', to: 'admin' }
    ]) as projection on billingdoc.A_BillingDocument {
        BillingDocument as ID,
        DocumentReferenceID as orderID,
        SoldToParty as customer,
    }
  
    function GetPDF (orderID: String) returns LargeString;

    entity ServiceOrderHistory as projection on srvorder.A_ServiceOrder {
    ServiceOrder as ID,
    ServiceOrderType as type,
    RequestedServiceStartDateTime as startDate: Timestamp,
    RequestedServiceEndDateTime as endDate: Timestamp,
    ServiceOrderIsCompleted as isComplete,
    ServiceOrderIsReleased as isReleased,
    SoldToParty as customer,
    null as cost: Double,
    TransactionCurrency as currency,
    null as currentDuration: String,
    to_Item as orderItems: redirected to ServiceOrderItems,
    to_ReferenceObject as refObjects: redirected to ServiceOrderObjects,
    to_Confirmation as confirmation: redirected to ServiceOrderConfirmations,
    to_PersonResponsible as responsible: redirected to ServiceOrderPersonResp
    
}
    action updateBikeLocation (bikeID: String, latitude: Double, longitude: Double) returns Integer;

    action updateBikeInfos @(restrict: [
        {grant: '*', to: 'admin'}
    ]) (manufacturer: String, model: String);
}
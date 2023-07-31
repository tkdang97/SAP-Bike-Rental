/* checksum : 264dea8de4f5f270f37e736c1cfcc94e */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service OP_API_SERVICE_CONFIRMATION_SRV_0001 {};

@cds.external : true
@cds.persistence.skip : true
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Service Confirmation'
entity OP_API_SERVICE_CONFIRMATION_SRV_0001.A_ServiceConfirmation {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transaction ID'
  key ServiceConfirmation : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transaction Type'
  @sap.quickinfo : 'Business Transaction Type'
  ServiceConfirmationType : String(4);
  @sap.label : 'Object GUID'
  @sap.quickinfo : 'GUID of a CRM Order Object'
  ServiceConfirmationUUID : UUID;
  @sap.label : 'Transaction Descr.'
  @sap.quickinfo : 'Transaction Description'
  ServiceConfirmationDescription : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Trans. Cat.'
  @sap.quickinfo : 'Business Trans. Cat.'
  ServiceObjectType : String(10);
  @sap.label : 'Language'
  @sap.quickinfo : 'Language Key of Description'
  Language : String(2);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Priority'
  @sap.quickinfo : 'Activity Priority'
  ServiceDocumentPriority : String(1);
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Service Req. Start'
  @sap.quickinfo : 'Service Request Start Date'
  RequestedServiceStartDateTime : DateTime;
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Service Request Due'
  @sap.quickinfo : 'Service Request Due Date'
  RequestedServiceEndDateTime : DateTime;
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Short Time Stamp'
  @sap.quickinfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
  ErlstRequestedDeliveryDateTime : DateTime;
  @sap.label : 'Ext. Reference'
  @sap.quickinfo : 'Sold-To Party''s External Reference Number'
  PurchaseOrderByCustomer : String(35);
  @sap.display.format : 'Date'
  @sap.label : 'Reference Doc. Date'
  @sap.quickinfo : 'Reference Document Date'
  CustomerPurchaseOrderDate : Date;
  ServiceConfirmationIsCompleted : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Status Is Active'
  ServiceConfirmationIsCanceled : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Organization'
  SalesOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Distribution Channel'
  DistributionChannel : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Division'
  Division : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Office'
  SalesOffice : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Group'
  SalesGroup : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sold-To Party'
  SoldToParty : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ship-To Party'
  ShipToParty : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Bill-To Party'
  BillToParty : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Payer'
  PayerParty : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Contact Person'
  @sap.quickinfo : 'Customer Contact Person'
  ContactPerson : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transaction ID'
  ReferenceServiceOrder : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Final Confirmation'
  @sap.quickinfo : 'Final service confirmation for the related service order'
  ServiceConfirmationIsFinal : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Currency'
  @sap.semantics : 'currency-code'
  TransactionCurrency : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Shipping Conditions'
  ShippingCondition : String(2);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Service Team'
  @sap.quickinfo : 'Service Team (Responsibility Management)'
  RespyMgmtServiceTeam : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  RespyMgmtServiceTeamName : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Global Team ID'
  @sap.quickinfo : 'Global Team ID in Responsibility Mgmt.'
  RespyMgmtGlobalTeamID : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Org. ID'
  @sap.quickinfo : 'Sales Organization ID'
  SalesOrganizationOrgUnitID : String(14);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Service Organization'
  ServiceOrganization : String(14);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Office'
  SalesOfficeOrgUnitID : String(14);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Group'
  SalesGroupOrgUnitID : String(14);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ent. Service Org.'
  @sap.quickinfo : 'Enterprise Service Organization'
  EnterpriseServiceOrganization : String(4);
  @cds.ambiguous : 'missing on condition?'
  to_Appointment : Association to many OP_API_SERVICE_CONFIRMATION_SRV_0001.A_SrvcConfAppointment {  };
  @cds.ambiguous : 'missing on condition?'
  to_Duration : Association to many OP_API_SERVICE_CONFIRMATION_SRV_0001.A_SrvcConfDuration {  };
  @cds.ambiguous : 'missing on condition?'
  to_Item : Association to many OP_API_SERVICE_CONFIRMATION_SRV_0001.A_ServiceConfirmationItem {  };
  @cds.ambiguous : 'missing on condition?'
  to_Partner : Association to many OP_API_SERVICE_CONFIRMATION_SRV_0001.A_SrvcConfPartner {  };
  @cds.ambiguous : 'missing on condition?'
  to_PersonResponsible : Association to many OP_API_SERVICE_CONFIRMATION_SRV_0001.A_ServiceConfPersonResp {  };
  @cds.ambiguous : 'missing on condition?'
  to_PricingElement : Association to many OP_API_SERVICE_CONFIRMATION_SRV_0001.A_ServiceConfPriceElement {  };
  @cds.ambiguous : 'missing on condition?'
  to_ReferenceObject : Association to many OP_API_SERVICE_CONFIRMATION_SRV_0001.A_ServiceConfRefObject {  };
  @cds.ambiguous : 'missing on condition?'
  to_ServiceConfUserStatus : Association to many OP_API_SERVICE_CONFIRMATION_SRV_0001.A_ServiceConfUserStatus {  };
  @cds.ambiguous : 'missing on condition?'
  to_Text : Association to many OP_API_SERVICE_CONFIRMATION_SRV_0001.A_ServiceConfirmationText {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.content.version : '1'
@sap.label : 'Service Confirmation Item'
entity OP_API_SERVICE_CONFIRMATION_SRV_0001.A_ServiceConfirmationItem {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transaction ID'
  key ServiceConfirmation : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item Number in Doc.'
  @sap.quickinfo : 'Shortened Item Number in Document'
  key ServiceConfirmationItem : String(6) not null;
  @sap.label : 'Object GUID'
  @sap.quickinfo : 'GUID of a CRM Order Object'
  ServiceConfirmationItemUUID : UUID;
  @sap.label : 'Product Description'
  ServiceConfItemDescription : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Trans. Cat.'
  @sap.quickinfo : 'Business Trans. Cat.'
  ServiceObjectType : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Object Type'
  @sap.quickinfo : 'CRM Item Object Type'
  ServiceDocumentItemObjectType : String(10);
  @sap.label : 'Language'
  @sap.quickinfo : 'Short Text Language for an Item'
  Language : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Name'
  @sap.quickinfo : 'Product Name Entered'
  Product : String(54);
  @sap.unit : 'QuantityUnit'
  @sap.label : 'Order Quantity'
  @sap.quickinfo : 'CRM: Order Quantity'
  Quantity : Decimal(13, 3);
  @sap.label : 'Sales Unit'
  @sap.quickinfo : 'Unit of Measure in Which the Product Is Sold'
  @sap.semantics : 'unit-of-measure'
  QuantityUnit : String(3);
  @sap.label : 'Actual Duration'
  @sap.quickinfo : 'Confirmed Duration'
  ActualServiceDuration : Decimal(7, 2);
  @sap.label : 'Time Unit'
  @sap.quickinfo : 'Time Unit for Confirmed Duration'
  @sap.semantics : 'unit-of-measure'
  ActualServiceDurationUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Item Category'
  ServiceConfItemCategory : String(4);
  ServiceConfItemIsCompleted : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Exec.Service Emp.'
  @sap.quickinfo : 'Executing Service Employee'
  ExecutingServiceEmployee : String(10);
  @sap.label : 'Partner Number'
  ServicePerformer : String(32);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Accounting Indicator'
  BillableControl : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transaction ID'
  ReferenceServiceOrder : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item Number in Doc.'
  @sap.quickinfo : 'Shortened Item Number in Document'
  ReferenceServiceOrderItem : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transaction ID'
  ReferenceServiceContract : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item Number in Doc.'
  @sap.quickinfo : 'Shortened Item Number in Document'
  ReferenceServiceContractItem : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Shipping Conditions'
  ShippingCondition : String(2);
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Short Time Stamp'
  @sap.quickinfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
  ErlstRequestedDeliveryDateTime : DateTime;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item Number in Doc.'
  @sap.quickinfo : 'Shortened Item Number in Document'
  ParentServiceConfItem : String(6);
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Service Actual Start'
  @sap.quickinfo : 'Service Actual Start Date'
  ActualServiceStartDateTime : DateTime;
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Service Actual End'
  @sap.quickinfo : 'Service Actual End Date'
  ActualServiceEndDateTime : DateTime;
  @sap.display.format : 'Date'
  @sap.label : 'Serv. Rendered Date'
  @sap.quickinfo : 'Service Rendered Date'
  ServicesRenderedDate : Date;
  @sap.label : 'Ref. Number'
  @sap.quickinfo : 'External Reference Number'
  FSMServiceConfirmationItem : String(80);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item Number in Doc.'
  @sap.quickinfo : 'Shortened Item Number in Document'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SrvcDocItmPartReferenceItem : String(6);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item Number in Doc.'
  @sap.quickinfo : 'Shortened Item Number in Document'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SrvcDocItmApptReferenceItem : String(6);
  @sap.label : 'Object GUID'
  @sap.quickinfo : 'GUID of a CRM Order Object'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SrvcDocItmApptRefObjectUUID : UUID;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Overtime Category'
  TimeSheetOvertimeCategory : String(4);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Service Team'
  @sap.quickinfo : 'Service Team (Responsibility Management)'
  RespyMgmtServiceTeam : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  RespyMgmtServiceTeamName : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Global Team ID'
  @sap.quickinfo : 'Global Team ID in Responsibility Mgmt.'
  RespyMgmtGlobalTeamID : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Terms of Payment'
  PaymentTerms : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Payment Method'
  PaymentMethod : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Mandate ID'
  @sap.quickinfo : 'Unique Reference to Mandate per Payment Recipient'
  SEPAMandate : String(35);
  @sap.display.format : 'UpperCase'
  @sap.label : 'SEPA Relevant'
  @sap.quickinfo : 'Indicator for SEPA-Relevant Transactions'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SrvcSEPAMandateRelevance : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Service Type'
  ServiceTransactionChargeType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valuation Type'
  SrvcTransactionValuationType : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Contract Account'
  @sap.quickinfo : 'Contract Account Number'
  ContractAccount : String(12);
  @cds.ambiguous : 'missing on condition?'
  to_Appointment : Association to many OP_API_SERVICE_CONFIRMATION_SRV_0001.A_SrvcConfItemAppointment {  };
  @cds.ambiguous : 'missing on condition?'
  to_Duration : Association to many OP_API_SERVICE_CONFIRMATION_SRV_0001.A_SrvcConfItemDuration {  };
  @cds.ambiguous : 'missing on condition?'
  to_Partner : Association to many OP_API_SERVICE_CONFIRMATION_SRV_0001.A_SrvcConfItemPartner {  };
  @cds.ambiguous : 'missing on condition?'
  to_PricingElement : Association to many OP_API_SERVICE_CONFIRMATION_SRV_0001.A_ServiceConfItemPriceElement {  };
  @cds.ambiguous : 'missing on condition?'
  to_ReferenceObject : Association to many OP_API_SERVICE_CONFIRMATION_SRV_0001.A_ServiceConfItmRefObject {  };
  @cds.ambiguous : 'missing on condition?'
  to_ServiceConfirmation : Association to OP_API_SERVICE_CONFIRMATION_SRV_0001.A_ServiceConfirmation {  };
  @cds.ambiguous : 'missing on condition?'
  to_SrvcConfItemUserStatus : Association to many OP_API_SERVICE_CONFIRMATION_SRV_0001.A_ServiceConfItemUserStatus {  };
  @cds.ambiguous : 'missing on condition?'
  to_Text : Association to many OP_API_SERVICE_CONFIRMATION_SRV_0001.A_ServiceConfirmationItemText {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.content.version : '1'
@sap.label : 'Text of Service Confirmation Item'
entity OP_API_SERVICE_CONFIRMATION_SRV_0001.A_ServiceConfirmationItemText {
  @sap.display.format : 'UpperCase'
  @sap.label : 'ID'
  @sap.quickinfo : 'Transaction ID'
  key ServiceConfirmation : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item Number in Doc.'
  @sap.quickinfo : 'Shortened Item Number in Document'
  key ServiceConfirmationItem : String(6) not null;
  @sap.label : 'Language Key'
  key Language : String(2) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Text ID'
  key LongTextID : String(4) not null;
  @sap.label : 'String'
  @sap.heading : ''
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  LongText : LargeString;
};

@cds.external : true
@cds.persistence.skip : true
@sap.content.version : '1'
@sap.label : 'Service Confirmation Text'
entity OP_API_SERVICE_CONFIRMATION_SRV_0001.A_ServiceConfirmationText {
  @sap.display.format : 'UpperCase'
  @sap.label : 'ID'
  @sap.quickinfo : 'Transaction ID'
  key ServiceConfirmation : String(10) not null;
  @sap.label : 'Language Key'
  key Language : String(2) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Text ID'
  key LongTextID : String(4) not null;
  @sap.label : 'String'
  @sap.heading : ''
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  LongText : LargeString;
};

@cds.external : true
@cds.persistence.skip : true
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Price Element of Srvc Confirmation Item'
entity OP_API_SERVICE_CONFIRMATION_SRV_0001.A_ServiceConfItemPriceElement {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transaction ID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key ServiceConfirmation : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item Number in Doc.'
  @sap.quickinfo : 'Shortened Item Number in Document'
  key ServiceConfirmationItem : String(6) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Step Number'
  key PricingProcedureStep : String(3) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Counter'
  @sap.quickinfo : 'Condition Counter'
  key PricingProcedureCounter : String(3) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Type'
  ConditionType : String(4);
  @sap.label : 'Amount'
  @sap.quickinfo : 'Condition Amount or Percentage'
  ConditionRateValue : Decimal(24, 9);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Currency'
  @sap.quickinfo : 'Currency Key'
  @sap.semantics : 'currency-code'
  ConditionCurrency : String(5);
  @sap.unit : 'ConditionQuantityUnit'
  @sap.label : 'Pricing Unit'
  @sap.quickinfo : 'Condition Pricing Unit'
  ConditionQuantity : Decimal(5, 0);
  @sap.label : 'Condition Unit'
  @sap.quickinfo : 'Condition Unit in the Document'
  @sap.semantics : 'unit-of-measure'
  ConditionQuantityUnit : String(3);
};

@cds.external : true
@cds.persistence.skip : true
@sap.updatable : 'false'
@sap.content.version : '1'
@sap.label : 'Service Confirmation Item User Status'
entity OP_API_SERVICE_CONFIRMATION_SRV_0001.A_ServiceConfItemUserStatus {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transaction ID'
  key ServiceConfirmation : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item Number in Doc.'
  @sap.quickinfo : 'Shortened Item Number in Document'
  key ServiceConfirmationItem : String(6) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Status'
  @sap.quickinfo : 'Object Status'
  key SrvcConfItemUserStatus : String(5) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.updatable : 'false'
@sap.content.version : '1'
@sap.label : 'Reference Obj. of Srvc Confirmation Item'
entity OP_API_SERVICE_CONFIRMATION_SRV_0001.A_ServiceConfItmRefObject {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transaction ID'
  key ServiceConfirmation : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item Number in Doc.'
  @sap.quickinfo : 'Shortened Item Number in Document'
  key ServiceConfirmationItem : String(6) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Equipment'
  @sap.quickinfo : 'Equipment Number'
  key ServiceReferenceEquipment : String(18) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Functional Location'
  key ServiceRefFunctionalLocation : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Main Ref. Object'
  @sap.quickinfo : 'Main Reference Object'
  SrvcRefObjIsMainObject : Boolean;
};

@cds.external : true
@cds.persistence.skip : true
@sap.content.version : '1'
@sap.label : 'Employee Resp. for Service Confirmation'
entity OP_API_SERVICE_CONFIRMATION_SRV_0001.A_ServiceConfPersonResp {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transaction ID'
  key ServiceConfirmation : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Business Partner'
  @sap.quickinfo : 'Business Partner Number'
  key PersonResponsible : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Main Partner'
  @sap.quickinfo : 'Main Partner (For Ambiguous Partner Functions)'
  CustMgmtPartnerIsMainPartner : Boolean;
};

@cds.external : true
@cds.persistence.skip : true
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Price Element of Service Confirmation'
entity OP_API_SERVICE_CONFIRMATION_SRV_0001.A_ServiceConfPriceElement {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transaction ID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key ServiceConfirmation : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Step Number'
  key PricingProcedureStep : String(3) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Counter'
  @sap.quickinfo : 'Condition Counter'
  key PricingProcedureCounter : String(3) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Type'
  ConditionType : String(4);
  @sap.label : 'Amount'
  @sap.quickinfo : 'Condition Amount or Percentage'
  ConditionRateValue : Decimal(24, 9);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Currency'
  @sap.quickinfo : 'Currency Key'
  @sap.semantics : 'currency-code'
  ConditionCurrency : String(5);
  @sap.unit : 'ConditionQuantityUnit'
  @sap.label : 'Pricing Unit'
  @sap.quickinfo : 'Condition Pricing Unit'
  ConditionQuantity : Decimal(5, 0);
  @sap.label : 'Condition Unit'
  @sap.quickinfo : 'Condition Unit in the Document'
  @sap.semantics : 'unit-of-measure'
  ConditionQuantityUnit : String(3);
};

@cds.external : true
@cds.persistence.skip : true
@sap.updatable : 'false'
@sap.content.version : '1'
@sap.label : 'Reference Objects of Srvc Confirmation'
entity OP_API_SERVICE_CONFIRMATION_SRV_0001.A_ServiceConfRefObject {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transaction ID'
  key ServiceConfirmation : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Equipment'
  @sap.quickinfo : 'Equipment Number'
  key ServiceReferenceEquipment : String(18) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Functional Location'
  key ServiceRefFunctionalLocation : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Main Ref. Object'
  @sap.quickinfo : 'Main Reference Object'
  SrvcRefObjIsMainObject : Boolean;
};

@cds.external : true
@cds.persistence.skip : true
@sap.updatable : 'false'
@sap.content.version : '1'
@sap.label : 'Service Confirmation User Status'
entity OP_API_SERVICE_CONFIRMATION_SRV_0001.A_ServiceConfUserStatus {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transaction ID'
  key ServiceConfirmation : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Status'
  @sap.quickinfo : 'Object Status'
  key SrvcConfUserStatus : String(5) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Service Confirmation Appointment'
entity OP_API_SERVICE_CONFIRMATION_SRV_0001.A_SrvcConfAppointment {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transaction ID'
  key ServiceConfirmation : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Date Type'
  @sap.quickinfo : 'Technical Date Type Name'
  key SrvcDocAppointmentType : String(12) not null;
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Time Stamp (UTC) of Start Time of Appointment'
  @sap.heading : ''
  SrvcDocApptStartDateTime : DateTime;
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Time stamp of end of appointment'
  @sap.heading : ''
  SrvcDocApptEndDateTime : DateTime;
};

@cds.external : true
@cds.persistence.skip : true
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Service Confirmation Duration'
entity OP_API_SERVICE_CONFIRMATION_SRV_0001.A_SrvcConfDuration {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transaction ID'
  key ServiceConfirmation : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Name of Duration'
  @sap.quickinfo : 'Name for Type of Time Duration'
  key SrvcDocDurationType : String(12) not null;
  @sap.label : 'Duration Value'
  @sap.quickinfo : 'Numerical Value of Duration'
  SrvcDocDurationValue : Decimal(13, 0);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Time Unit'
  @sap.quickinfo : 'Default Value for Time Unit'
  SrvcDocDurationUnit : String(12);
};

@cds.external : true
@cds.persistence.skip : true
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Service Confirmation Item Appointment'
entity OP_API_SERVICE_CONFIRMATION_SRV_0001.A_SrvcConfItemAppointment {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transaction ID'
  key ServiceConfirmation : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item Number in Doc.'
  @sap.quickinfo : 'Shortened Item Number in Document'
  key ServiceConfirmationItem : String(6) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Date Type'
  @sap.quickinfo : 'Technical Date Type Name'
  key SrvcDocAppointmentType : String(12) not null;
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Time Stamp (UTC) of Start Time of Appointment'
  @sap.heading : ''
  SrvcDocApptStartDateTime : DateTime;
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Time stamp of end of appointment'
  @sap.heading : ''
  SrvcDocApptEndDateTime : DateTime;
};

@cds.external : true
@cds.persistence.skip : true
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Service Confirmation Item Duration'
entity OP_API_SERVICE_CONFIRMATION_SRV_0001.A_SrvcConfItemDuration {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transaction ID'
  key ServiceConfirmation : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item Number in Doc.'
  @sap.quickinfo : 'Shortened Item Number in Document'
  key ServiceConfirmationItem : String(6) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Name of Duration'
  @sap.quickinfo : 'Name for Type of Time Duration'
  key SrvcDocDurationType : String(12) not null;
  @sap.label : 'Duration Value'
  @sap.quickinfo : 'Numerical Value of Duration'
  SrvcDocDurationValue : Decimal(13, 0);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Time Unit'
  @sap.quickinfo : 'Default Value for Time Unit'
  SrvcDocDurationUnit : String(12);
};

@cds.external : true
@cds.persistence.skip : true
@sap.content.version : '1'
@sap.label : 'Service Confirmation Item Partner'
entity OP_API_SERVICE_CONFIRMATION_SRV_0001.A_SrvcConfItemPartner {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transaction ID'
  key ServiceConfirmation : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item Number in Doc.'
  @sap.quickinfo : 'Shortened Item Number in Document'
  key ServiceConfirmationItem : String(6) not null;
  key CustMgmtPartnerFunction : String(8) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Business Partner'
  @sap.quickinfo : 'Business Partner Number'
  key CustMgmtBusinessPartner : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Main Partner'
  @sap.quickinfo : 'Main Partner (For Ambiguous Partner Functions)'
  CustMgmtPartnerIsMainPartner : Boolean;
  @cds.ambiguous : 'missing on condition?'
  to_Address : Association to OP_API_SERVICE_CONFIRMATION_SRV_0001.A_SrvcConfItmPartnerAddress {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Partner Address of Service Confirmation Item'
entity OP_API_SERVICE_CONFIRMATION_SRV_0001.A_SrvcConfItmPartnerAddress {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transaction ID'
  key ServiceConfirmation : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Item Number in Doc.'
  @sap.quickinfo : 'Shortened Item Number in Document'
  key ServiceConfirmationItem : String(6) not null;
  key CustMgmtPartnerFunction : String(8) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Business Partner'
  @sap.quickinfo : 'Business Partner Number'
  key CustMgmtBusinessPartner : String(10) not null;
  @sap.label : 'Full Name'
  @sap.quickinfo : 'Full Name of Person'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  AddresseeFullName : String(80);
  @sap.label : 'City'
  CityName : String(40);
  @sap.label : 'Language Key'
  CorrespondenceLanguage : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Country/Region Key'
  Country : String(3);
  @sap.label : 'District'
  DistrictName : String(40);
  @sap.label : 'E-Mail Address'
  EmailAddress : String(241);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fax'
  @sap.quickinfo : 'Fax Number: Dialing Code and Number'
  FaxAreaCodeSubscriberNumber : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Extension'
  @sap.quickinfo : 'Fax no.: Extension'
  FaxExtensionNumber : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Country/Region'
  @sap.quickinfo : 'Country/Region for Telephone/Fax Number'
  FaxNumberCountry : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Title'
  @sap.quickinfo : 'Form-of-Address Key'
  FormOfAddress : String(4);
  @sap.label : 'House Number'
  HouseNumber : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Telephone'
  @sap.quickinfo : 'Telephone No.: Dialing Code and Number'
  MobileNumber : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Country/Region'
  @sap.quickinfo : 'Country/Region for Telephone/Fax Number'
  MobilePhoneCountry : String(3);
  @sap.label : 'Name'
  @sap.quickinfo : 'Name 1'
  OrganizationName1 : String(40);
  @sap.label : 'Name 2'
  OrganizationName2 : String(40);
  @sap.label : 'Name 3'
  OrganizationName3 : String(40);
  @sap.label : 'Name 4'
  OrganizationName4 : String(40);
  @sap.label : 'Last Name'
  PersonFamilyName : String(40);
  @sap.label : 'First Name'
  PersonGivenName : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Extension'
  @sap.quickinfo : 'Telephone no.: Extension'
  PhoneExtensionNumber : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Telephone'
  @sap.quickinfo : 'Telephone No.: Dialing Code and Number'
  PhoneNumber : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Country/Region'
  @sap.quickinfo : 'Country/Region for Telephone/Fax Number'
  PhoneNumberCountry : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'PO Box'
  POBox : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'PO Box Postal Code'
  POBoxPostalCode : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Postal Code'
  @sap.quickinfo : 'City postal code'
  PostalCode : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Region'
  @sap.quickinfo : 'Region (State, Province, County)'
  Region : String(3);
  @sap.label : 'Street'
  StreetName : String(60);
  @sap.label : 'Street 2'
  StreetPrefixName1 : String(40);
  @sap.label : 'Street 3'
  StreetPrefixName2 : String(40);
  @sap.label : 'Street 4'
  StreetSuffixName1 : String(40);
  @sap.label : 'Street 5'
  StreetSuffixName2 : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Jurisdiction'
  TaxJurisdiction : String(15);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transportation Zone'
  @sap.quickinfo : 'Transportation zone to or from which the goods are delivered'
  TransportZone : String(10);
};

@cds.external : true
@cds.persistence.skip : true
@sap.content.version : '1'
@sap.label : 'Service Confirmation Partner'
entity OP_API_SERVICE_CONFIRMATION_SRV_0001.A_SrvcConfPartner {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transaction ID'
  key ServiceConfirmation : String(10) not null;
  key CustMgmtPartnerFunction : String(8) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Business Partner'
  @sap.quickinfo : 'Business Partner Number'
  key CustMgmtBusinessPartner : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Main Partner'
  @sap.quickinfo : 'Main Partner (For Ambiguous Partner Functions)'
  CustMgmtPartnerIsMainPartner : Boolean;
  @cds.ambiguous : 'missing on condition?'
  to_Address : Association to OP_API_SERVICE_CONFIRMATION_SRV_0001.A_SrvcConfPartnerAddress {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Partner Address of Service Confirmation'
entity OP_API_SERVICE_CONFIRMATION_SRV_0001.A_SrvcConfPartnerAddress {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transaction ID'
  key ServiceConfirmation : String(10) not null;
  key CustMgmtPartnerFunction : String(8) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Business Partner'
  @sap.quickinfo : 'Business Partner Number'
  key CustMgmtBusinessPartner : String(10) not null;
  @sap.label : 'Full Name'
  @sap.quickinfo : 'Full Name of Person'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  AddresseeFullName : String(80);
  @sap.label : 'City'
  CityName : String(40);
  @sap.label : 'Language Key'
  CorrespondenceLanguage : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Country/Region Key'
  Country : String(3);
  @sap.label : 'District'
  DistrictName : String(40);
  @sap.label : 'E-Mail Address'
  EmailAddress : String(241);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fax'
  @sap.quickinfo : 'Fax Number: Dialing Code and Number'
  FaxAreaCodeSubscriberNumber : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Extension'
  @sap.quickinfo : 'Fax no.: Extension'
  FaxExtensionNumber : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Country/Region'
  @sap.quickinfo : 'Country/Region for Telephone/Fax Number'
  FaxNumberCountry : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Title'
  @sap.quickinfo : 'Form-of-Address Key'
  FormOfAddress : String(4);
  @sap.label : 'House Number'
  HouseNumber : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Telephone'
  @sap.quickinfo : 'Telephone No.: Dialing Code and Number'
  MobileNumber : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Country/Region'
  @sap.quickinfo : 'Country/Region for Telephone/Fax Number'
  MobilePhoneCountry : String(3);
  @sap.label : 'Name'
  @sap.quickinfo : 'Name 1'
  OrganizationName1 : String(40);
  @sap.label : 'Name 2'
  OrganizationName2 : String(40);
  @sap.label : 'Name 3'
  OrganizationName3 : String(40);
  @sap.label : 'Name 4'
  OrganizationName4 : String(40);
  @sap.label : 'Last Name'
  PersonFamilyName : String(40);
  @sap.label : 'First Name'
  PersonGivenName : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Extension'
  @sap.quickinfo : 'Telephone no.: Extension'
  PhoneExtensionNumber : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Telephone'
  @sap.quickinfo : 'Telephone No.: Dialing Code and Number'
  PhoneNumber : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Country/Region'
  @sap.quickinfo : 'Country/Region for Telephone/Fax Number'
  PhoneNumberCountry : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'PO Box'
  POBox : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'PO Box Postal Code'
  POBoxPostalCode : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Postal Code'
  @sap.quickinfo : 'City postal code'
  PostalCode : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Region'
  @sap.quickinfo : 'Region (State, Province, County)'
  Region : String(3);
  @sap.label : 'Street'
  StreetName : String(60);
  @sap.label : 'Street 2'
  StreetPrefixName1 : String(40);
  @sap.label : 'Street 3'
  StreetPrefixName2 : String(40);
  @sap.label : 'Street 4'
  StreetSuffixName1 : String(40);
  @sap.label : 'Street 5'
  StreetSuffixName2 : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Jurisdiction'
  TaxJurisdiction : String(15);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transportation Zone'
  @sap.quickinfo : 'Transportation zone to or from which the goods are delivered'
  TransportZone : String(10);
};


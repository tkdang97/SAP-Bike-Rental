/* checksum : 1678f862bfce568166e0e3ea4c47c91e */
@cds.external : true
type OP_PRODUCT_0001.SAP__Message {
  code : LargeString not null;
  message : LargeString not null;
  target : LargeString;
  additionalTargets : many LargeString not null;
  transition : Boolean not null;
  @odata.Type : 'Edm.Byte'
  numericSeverity : Integer not null;
  longtextUrl : LargeString;
};

@cds.external : true
@CodeList.CurrencyCodes : {
  Url: '../../../../default/iwbep/common/0001/$metadata',
  CollectionPath: 'Currencies'
}
@CodeList.UnitsOfMeasure : {
  Url: '../../../../default/iwbep/common/0001/$metadata',
  CollectionPath: 'UnitsOfMeasure'
}
@Aggregation.ApplySupported : {
  Transformations: [ 'aggregate', 'groupby', 'filter' ],
  Rollup: #None
}
@Common.ApplyMultiUnitBehaviorForSortingAndFiltering : true
@Capabilities.FilterFunctions : [
  'eq',
  'ne',
  'gt',
  'ge',
  'lt',
  'le',
  'and',
  'or',
  'contains',
  'startswith',
  'endswith',
  'any',
  'all'
]
@Capabilities.SupportedFormats : [ 'application/json', 'application/pdf' ]
@PDF.Features : {
  DocumentDescriptionReference: '../../../../default/iwbep/common/0001/$metadata',
  DocumentDescriptionCollection: 'MyDocumentDescriptions',
  ArchiveFormat: true,
  Border: true,
  CoverPage: true,
  FitToPage: true,
  FontName: true,
  FontSize: true,
  Margin: true,
  Signature: true,
  ResultSizeDefault: 20000,
  ResultSizeMaximum: 20000
}
service OP_PRODUCT_0001 {};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Sales Delivery Sales Tax'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: Country,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductSalesTaxCategory,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductSalesOrg,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductDistributionChnl,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProdSalesDeliverySalesTax {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Departure Ctry/Reg.'
  @Common.Heading : 'DeCR'
  @Common.QuickInfo : 'Departure Country/Region (from which the goods are sent)'
  key Country : String(3) not null;
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Tax Category'
  @Common.Heading : 'TxCat'
  @Common.QuickInfo : 'Tax category (sales tax, federal sales tax,...)'
  key ProductSalesTaxCategory : String(4) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Sales Organization'
  @Common.Heading : 'SOrg.'
  key ProductSalesOrg : String(4) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Distribution Channel'
  @Common.Heading : 'DChl'
  key ProductDistributionChnl : String(2) not null;
  ProductTaxClassification : String(1) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductSalesDelivery : Association to one OP_PRODUCT_0001.ProductSalesDelivery on _ProductSalesDelivery.ProductDistributionChnl = ProductDistributionChnl;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product'
@Common.Messages : SAP__Messages
@Capabilities.NavigationRestrictions.RestrictedProperties : [
  {
    NavigationProperty: _ProductDescription,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlant,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductProcurement,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductQualityManagement,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductSales,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductSalesDelivery,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductStorage,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductUnitOfMeasure,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductValuation,
    InsertRestrictions: { Insertable: true }
  }
]
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ 'LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: ProductType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: CreatedByUser,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: LastChangedByUser,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: IsMarkedForDeletion,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: CrossPlantStatus,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductOldID,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: GrossWeight,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: WeightUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: WeightISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ItemCategoryGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: NetWeight,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: Division,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: VolumeUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: VolumeISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductVolume,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: AuthorizationGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: SizeOrDimensionText,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: IndustryStandardName,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InternationalArticleNumberCat,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductIsConfigurable,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: IsBatchManagementRequired,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ExternalProductGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: SerialNoExplicitnessLevel,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: IsApprovedBatchRecordReqd,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: HandlingIndicator,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: WarehouseProductGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: WarehouseStorageCondition,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: StandardHandlingUnitType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: SerialNumberProfile,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: IsPilferable,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: IsRelevantForHzdsSubstances,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: QuarantinePeriod,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: TimeUnitForQuarantinePeriod,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: QuarantinePeriodISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: QualityInspectionGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: HandlingUnitType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: HasVariableTareWeight,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MaximumPackagingLength,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MaximumPackagingWidth,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MaximumPackagingHeight,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: UnitForMaxPackagingDimensions,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MaxPackggDimensionISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnitSpecificProductLength,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnitSpecificProductWidth,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnitSpecificProductHeight,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductMeasurementUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductMeasurementISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ArticleCategory,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: IndustrySector,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: DangerousGoodsIndProfile,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductDocumentChangeNumber,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductDocumentPageNumber,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: DocumentIsCreatedByCAD,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductionOrInspectionMemoTxt,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductionMemoPageFormat,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductIsHighlyViscous,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: TransportIsInBulk,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProdEffctyParamValsAreAssigned,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProdIsEnvironmentallyRelevant,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: LaboratoryOrDesignOffice,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: PackagingProductGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductDocumentNumber,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductDocumentVersion,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductDocumentType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductDocumentPageFormat,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProdChmlCmplncRelevanceCode,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: DiscountInKindEligibility,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductHierarchy,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProdAllocDetnProcedure,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.Product {
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductType'
  @Common.IsUpperCase : true
  @Common.Label : 'Product Type'
  @Common.Heading : 'PTyp'
  ProductType : String(4) not null;
  @Core.Computed : true
  @Common.Label : 'Created On'
  @Common.Heading : 'Created'
  CreationDate : Date;
  @Core.Computed : true
  @Common.Label : 'Created At Time'
  @Common.QuickInfo : 'Time of Creation'
  CreationTime : Time not null;
  @odata.Precision : 7
  @odata.Type : 'Edm.DateTimeOffset'
  @Common.Label : 'Created On'
  @Common.QuickInfo : 'Product Created On'
  CreationDateTime : Timestamp;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Created By'
  @Common.QuickInfo : 'Name of Person Responsible for Creating the Object'
  CreatedByUser : String(12) not null;
  @Core.Computed : true
  @Common.Label : 'Last Change'
  @Common.Heading : 'Last Chg'
  @Common.QuickInfo : 'Date of Last Change'
  LastChangeDate : Date;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Changed By'
  @Common.QuickInfo : 'Name of Person Who Changed Object'
  LastChangedByUser : String(12) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Marked for Deletion'
  @Common.Heading : 'D'
  @Common.QuickInfo : 'Deletion Indicator'
  IsMarkedForDeletion : Boolean not null;
  @Common.SAPObjectNodeTypeReference : 'ProductProfileCode'
  @Common.IsUpperCase : true
  @Common.Label : 'CrossPlantProdStatus'
  @Common.Heading : 'PS'
  @Common.QuickInfo : 'Cross-Plant Product Status'
  CrossPlantStatus : String(2) not null;
  @Common.Label : 'Valid from'
  @Common.QuickInfo : 'Date from which the cross-plant material status is valid'
  CrossPlantStatusValidityDate : Date;
  @Common.IsUpperCase : true
  @Common.Label : 'Old product number'
  @Common.Heading : 'Old product no.'
  @Common.QuickInfo : 'Old Product Number'
  ProductOldID : String(40) not null;
  @Measures.Unit : WeightUnit
  @Measures.UNECEUnit : WeightISOUnit
  @Common.Label : 'Gross Weight'
  GrossWeight : Decimal(13, 3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Unit of Weight'
  @Common.Heading : 'WUn'
  WeightUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Unit of weight ISO'
  @Common.Heading : 'WUn'
  @Common.QuickInfo : 'Unit of weight in ISO code'
  WeightISOUnit : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductGroup'
  @Common.IsUpperCase : true
  @Common.Label : 'Product Group'
  @Common.Heading : 'Prd Group'
  ProductGroup : String(9) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductItemCategoryGroup'
  @Common.IsUpperCase : true
  @Common.Label : 'Gen. item cat. grp'
  @Common.Heading : 'ItCGr'
  @Common.QuickInfo : 'General item category group'
  ItemCategoryGroup : String(4) not null;
  @Measures.Unit : WeightUnit
  @Measures.UNECEUnit : WeightISOUnit
  @Common.Label : 'Net Weight'
  NetWeight : Decimal(13, 3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Division'
  @Common.Heading : 'Dv'
  Division : String(2) not null;
  @Common.IsUnit : true
  @Common.Label : 'Volume Unit'
  @Common.Heading : 'VUn'
  VolumeUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Volume unit ISO'
  @Common.Heading : 'VUI'
  @Common.QuickInfo : 'Volume unit in ISO code'
  VolumeISOUnit : String(3) not null;
  @Measures.Unit : VolumeUnit
  @Measures.UNECEUnit : VolumeISOUnit
  @Common.Label : 'Volume'
  ProductVolume : Decimal(13, 3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Authorization Group'
  @Common.Heading : 'AGrp'
  AuthorizationGroup : String(4) not null;
  @Common.IsDigitSequence : true
  @Common.Label : 'ANP Code'
  ANPCode : String(9) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Size/dimensions'
  SizeOrDimensionText : String(32) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Industry Std Desc.'
  @Common.QuickInfo : 'Industry Standard Description (such as ANSI or ISO)'
  IndustryStandardName : String(18) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'GTIN'
  @Common.QuickInfo : 'Global Trade Item Number (EAN/UPC/GTIN)'
  ProductStandardID : String(18) not null;
  @Common.SAPObjectNodeTypeReference : 'GlobalTradeItemNumberCategory'
  @Common.IsUpperCase : true
  @Common.Label : 'EAN category'
  @Common.Heading : 'Ct'
  @Common.QuickInfo : 'Category of International Article Number (EAN)'
  InternationalArticleNumberCat : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Configurable'
  @Common.Heading : 'Conf.'
  @Common.QuickInfo : 'Product is Configurable'
  ProductIsConfigurable : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Batch Management'
  @Common.Heading : 'BMR'
  @Common.QuickInfo : 'Batch Management Requirement Indicator'
  IsBatchManagementRequired : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Ext. Product Group'
  @Common.Heading : 'Ext. Product Grp'
  @Common.QuickInfo : 'External Product Group'
  ExternalProductGroup : String(18) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Cross-plant CP'
  @Common.QuickInfo : 'Cross-Plant Configurable Product'
  CrossPlantConfigurableProduct : String(40) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Serialization level'
  @Common.Heading : 'SL'
  @Common.QuickInfo : 'Level of Explicitness for Serial Number'
  SerialNoExplicitnessLevel : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Appr.Batch Recd Req.'
  @Common.Heading : 'AR'
  @Common.QuickInfo : 'Approved Batch Record Required'
  IsApprovedBatchRecordReqd : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Handling Indicator'
  @Common.Heading : 'Hand.Ind.'
  HandlingIndicator : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'WH Material Group'
  @Common.Heading : 'WHMatGrp'
  @Common.QuickInfo : 'Warehouse Material Group'
  WarehouseProductGroup : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Whse Stor. Condition'
  @Common.Heading : 'Cond.'
  @Common.QuickInfo : 'Warehouse Storage Condition'
  WarehouseStorageCondition : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Standard HU Type'
  StandardHandlingUnitType : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Serial No. Profile'
  @Common.QuickInfo : 'Serial Number Profile'
  SerialNumberProfile : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Pilferable'
  IsPilferable : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Relevant for HS'
  @Common.Heading : 'Rel. for HS'
  @Common.QuickInfo : 'Relevant for Hazardous Substances'
  IsRelevantForHzdsSubstances : Boolean not null;
  @Measures.Unit : TimeUnitForQuarantinePeriod
  @Measures.UNECEUnit : QuarantinePeriodISOUnit
  @Common.Label : 'Quarant. Per.'
  @Common.Heading : 'QPer.'
  @Common.QuickInfo : 'Quarantine Period'
  QuarantinePeriod : Decimal(precision: 3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Time Unit'
  @Common.Heading : 'Quarantine Time Unit'
  @Common.QuickInfo : 'Time Unit for Quarantine Period'
  TimeUnitForQuarantinePeriod : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Time Unit'
  @Common.Heading : 'Quarantine Time Unit'
  @Common.QuickInfo : 'Time Unit for Quarantine Time in ISO Code'
  QuarantinePeriodISOUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Quality Inspec. Grp'
  @Common.Heading : 'Quality Inspection Group'
  @Common.QuickInfo : 'Quality Inspection Group'
  QualityInspectionGroup : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Handling Unit Type'
  HandlingUnitType : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Varb. Tare Weight'
  @Common.Heading : 'V'
  @Common.QuickInfo : 'Variable Tare Weight'
  HasVariableTareWeight : Boolean not null;
  @Measures.Unit : UnitForMaxPackagingDimensions
  @Measures.UNECEUnit : MaxPackggDimensionISOUnit
  @Common.Label : 'Max. Pack. Length'
  @Common.QuickInfo : 'Maximum Packing Length of Packaging Material'
  MaximumPackagingLength : Decimal(15, 3) not null;
  @Measures.Unit : UnitForMaxPackagingDimensions
  @Measures.UNECEUnit : MaxPackggDimensionISOUnit
  @Common.Label : 'Max. Pack. Width'
  @Common.QuickInfo : 'Maximum Packing Width of Packaging Material'
  MaximumPackagingWidth : Decimal(15, 3) not null;
  @Measures.Unit : UnitForMaxPackagingDimensions
  @Measures.UNECEUnit : MaxPackggDimensionISOUnit
  @Common.Label : 'Max. Pack. Height'
  @Common.QuickInfo : 'Maximum Packing Height of Packaging Material'
  MaximumPackagingHeight : Decimal(15, 3) not null;
  @Common.Label : 'Maximum Capacity'
  @Common.QuickInfo : 'Maximum Allowed Capacity of Packaging Material'
  MaximumCapacity : Decimal(15, 3) not null;
  @Common.Label : 'Overcapacity Toler.'
  @Common.Heading : 'OCT'
  @Common.QuickInfo : 'Overcapacity Tolerance of the Handling Unit'
  OvercapacityTolerance : Decimal(3, 1) not null;
  @Common.IsUnit : true
  @Common.Label : 'Unit of Measurement'
  @Common.Heading : 'UoM'
  @Common.QuickInfo : 'Unit of Measure for Maximum Packing Length/Width/Height'
  UnitForMaxPackagingDimensions : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Unit: ISO Code'
  @Common.Heading : 'Unt'
  @Common.QuickInfo : 'Unit for Maximum Packing Length/Width/Height in ISO Code'
  MaxPackggDimensionISOUnit : String(3) not null;
  @Measures.Unit : ProductMeasurementUnit
  @Measures.UNECEUnit : ProductMeasurementISOUnit
  @Common.Label : 'Length'
  BaseUnitSpecificProductLength : Decimal(13, 3) not null;
  @Measures.Unit : ProductMeasurementUnit
  @Measures.UNECEUnit : ProductMeasurementISOUnit
  @Common.Label : 'Width'
  BaseUnitSpecificProductWidth : Decimal(13, 3) not null;
  @Measures.Unit : ProductMeasurementUnit
  @Measures.UNECEUnit : ProductMeasurementISOUnit
  @Common.Label : 'Height'
  BaseUnitSpecificProductHeight : Decimal(13, 3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Unit of Dimension'
  @Common.QuickInfo : 'Unit of Dimension for Length/Width/Height'
  ProductMeasurementUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Dimension unit ISO'
  @Common.Heading : 'DUI'
  @Common.QuickInfo : 'Unit for length/breadth/height in ISO code'
  ProductMeasurementISOUnit : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductCategory'
  @Common.IsUpperCase : true
  @Common.Label : 'Product Category'
  @Common.Heading : 'Ct'
  ArticleCategory : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Industry'
  @Common.Heading : 'I'
  IndustrySector : String(1) not null;
  @odata.Precision : 7
  @odata.Type : 'Edm.DateTimeOffset'
  @Core.Computed : true
  @Common.Label : 'Last Changed'
  @Common.QuickInfo : 'Change Time Stamp'
  LastChangeDateTime : Timestamp;
  @Core.Computed : true
  @Common.Label : 'Last Changed Time'
  @Common.Heading : 'Last Chgd. Time'
  @Common.QuickInfo : 'Time of Last Change'
  LastChangeTime : Time not null;
  @Common.IsUpperCase : true
  @Common.Label : 'DG indicator profile'
  @Common.Heading : 'Pro.'
  @Common.QuickInfo : 'Dangerous Goods Indicator Profile'
  DangerousGoodsIndProfile : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Document change no.'
  @Common.Heading : 'Ch.no.'
  @Common.QuickInfo : 'Document change number (without document management system)'
  ProductDocumentChangeNumber : String(6) not null;
  @Common.IsDigitSequence : true
  @Common.Label : 'Number of sheets'
  @Common.Heading : 'No.'
  @Common.QuickInfo : 'Number of sheets (without Document Management system)'
  ProductDocumentPageCount : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Page number'
  @Common.Heading : 'PNo'
  @Common.QuickInfo : 'Page number of document (without Document Management system)'
  ProductDocumentPageNumber : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'CAD Indicator'
  @Common.Heading : 'CAD'
  DocumentIsCreatedByCAD : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Prod./insp. memo'
  @Common.QuickInfo : 'Production/inspection memo'
  ProductionOrInspectionMemoTxt : String(18) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Page format'
  @Common.Heading : 'For.'
  @Common.QuickInfo : 'Page Format of Production Memo'
  ProductionMemoPageFormat : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Highly viscous'
  @Common.Heading : 'HighlyVisc'
  @Common.QuickInfo : 'Indicator: Highly Viscous'
  ProductIsHighlyViscous : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'In bulk/liquid'
  @Common.QuickInfo : 'Indicator: In Bulk/Liquid'
  TransportIsInBulk : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Assign effect. vals'
  @Common.Heading : 'Par.ef.'
  @Common.QuickInfo : 'Assign effectivity parameter values/ override change numbers'
  ProdEffctyParamValsAreAssigned : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Environmentally rlvt'
  @Common.Heading : 'E'
  @Common.QuickInfo : 'Environmentally Relevant'
  ProdIsEnvironmentallyRelevant : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Lab/Office'
  @Common.Heading : 'L/O'
  @Common.QuickInfo : 'Laboratory/design office'
  LaboratoryOrDesignOffice : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Matl Grp Pack.Matls'
  @Common.Heading : 'GrPMt'
  @Common.QuickInfo : 'Material Group: Packaging Materials'
  PackagingProductGroup : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Ref. mat. for pckg'
  @Common.Heading : 'Reference material'
  @Common.QuickInfo : 'Reference material for materials packed in same way'
  PackingReferenceProduct : String(40) not null;
  @Common.Label : 'Basic material'
  @Common.QuickInfo : 'Basic Material'
  BasicProduct : String(48) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Document'
  @Common.QuickInfo : 'Document number (without document management system)'
  ProductDocumentNumber : String(22) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Document Version'
  @Common.Heading : 'Vers'
  @Common.QuickInfo : 'Document version (without Document Management system)'
  ProductDocumentVersion : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Document Type'
  @Common.Heading : 'Type'
  @Common.QuickInfo : 'Document type (without Document Management system)'
  ProductDocumentType : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Page format'
  @Common.Heading : 'Page'
  @Common.QuickInfo : 'Page format of document (without Document Management system)'
  ProductDocumentPageFormat : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Chemical Compliance Relevance Indicator'
  ProdChmlCmplncRelevanceCode : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Qual.f.FreeGoodsDis.'
  @Common.Heading : 'DiK'
  @Common.QuickInfo : 'Material qualifies for discount in kind'
  DiscountInKindEligibility : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Competitor'
  ProdCompetitorCustomerNumber : String(10) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Product Hierarchy'
  ProductHierarchy : String(18) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Product allocation'
  @Common.QuickInfo : 'Product allocation determination procedure'
  ProdAllocDetnProcedure : String(18) not null;
  SAP__Messages : many OP_PRODUCT_0001.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductDescription : Composition of many OP_PRODUCT_0001.ProductDescription;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlant : Composition of many OP_PRODUCT_0001.ProductPlant;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductProcurement : Composition of one OP_PRODUCT_0001.ProductProcurement;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductQualityManagement : Composition of one OP_PRODUCT_0001.ProductQualityManagement;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductSales : Composition of one OP_PRODUCT_0001.ProductSales;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductSalesDelivery : Composition of many OP_PRODUCT_0001.ProductSalesDelivery;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductStorage : Composition of one OP_PRODUCT_0001.ProductStorage;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductUnitOfMeasure : Composition of many OP_PRODUCT_0001.ProductUnitOfMeasure;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductValuation : Composition of many OP_PRODUCT_0001.ProductValuation;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Description'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductDescription {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Common.FieldControl : #Mandatory
  @Common.Label : 'Language Key'
  @Common.Heading : 'Language'
  key Language : String(2) not null;
  @Common.Label : 'Product Description'
  ProductDescription : String(40) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant'
@Capabilities.NavigationRestrictions.RestrictedProperties : [
  {
    NavigationProperty: _ProdPlantInternationalTrade,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantCosting,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantForecast,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantInspTypeSetting,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantMRP,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantProcurement,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantPurchaseTax,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantQualityManagement,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantSales,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantStorage,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantStorageLocation,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantSupplyPlanning,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductPlantWorkScheduling,
    InsertRestrictions: { Insertable: true }
  }
]
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: Plant,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProfileCode,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: FiscalYearVariant,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: PeriodType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: IsMarkedForDeletion,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: StockDeterminationGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: IsBatchManagementRequired,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: SerialNumberProfile,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: IsNegativeStockAllowed,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductIsExciseTaxRelevant,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: GoodsIssueISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: DistrCntrDistributionProfile,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductIsCriticalPrt,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductLogisticsHandlingGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductFreightGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: OriglBatchManagementIsRequired,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductMinControlTemperature,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductMaxControlTemperature,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductControlTemperatureUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProdCtrlTemperatureUnitISOCode,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductPlant {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Common.FieldControl : #Mandatory
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductProfileCode'
  @Common.IsUpperCase : true
  @Common.Label : 'Material Status'
  @Common.Heading : 'Plant-Specific Material Status'
  @Common.QuickInfo : 'Plant-Specific Material Status'
  ProfileCode : String(2) not null;
  @Common.Label : 'Valid From'
  @Common.QuickInfo : 'Date from Which the Plant-Specific Material Status Is Valid'
  ProfileValidityStartDate : Date;
  @Common.IsUpperCase : true
  @Common.Label : 'Fiscal Year Variant'
  @Common.Heading : 'FV'
  FiscalYearVariant : String(2) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductConsumptionPeriodType'
  @Common.IsUpperCase : true
  @Common.Label : 'Period Indicator'
  @Common.Heading : 'PI'
  PeriodType : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Profit Center'
  @Common.Heading : 'Profit Ctr'
  ProfitCenter : String(10) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'DF at plant level'
  @Common.Heading : 'Pl'
  @Common.QuickInfo : 'Flag Material for Deletion at Plant Level'
  IsMarkedForDeletion : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Conf. Material'
  @Common.Heading : 'Configurable Material'
  @Common.QuickInfo : 'Configurable Material'
  ConfigurableProduct : String(40) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Stock Determ. Group'
  @Common.Heading : 'Stock Determination Group'
  @Common.QuickInfo : 'Stock determination group'
  StockDeterminationGroup : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Batch Mgmt Rqt(Plnt)'
  @Common.Heading : 'BMR'
  @Common.QuickInfo : 'Batch Management Requirement Indicator for Plant'
  IsBatchManagementRequired : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Serial No. Profile'
  @Common.Heading : 'Profl.'
  @Common.QuickInfo : 'Serial Number Profile'
  SerialNumberProfile : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Neg. stocks in plant'
  @Common.Heading : 'NS'
  @Common.QuickInfo : 'Negative stocks allowed in plant'
  IsNegativeStockAllowed : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Mat. CFOP category'
  @Common.Heading : 'MC'
  @Common.QuickInfo : 'Material CFOP category'
  ProductCFOPCategory : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Is Excise Tax Relevant'
  @Common.QuickInfo : 'Excise Tax Relevance Indicator'
  ProductIsExciseTaxRelevant : Boolean not null;
  @Common.IsUnit : true
  @Common.Label : 'Unit of issue'
  @Common.Heading : 'UoI'
  @Common.QuickInfo : 'Ouput Unit of Measure'
  GoodsIssueUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Unit of issue in ISO'
  @Common.Heading : 'UII'
  @Common.QuickInfo : 'Unit of issue in ISO code'
  GoodsIssueISOUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Distr. profile'
  @Common.QuickInfo : 'Distribution profile of material in plant'
  DistrCntrDistributionProfile : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Critical Part'
  @Common.Heading : 'Cri'
  @Common.QuickInfo : 'Indicator: Critical part'
  ProductIsCriticalPrt : Boolean not null;
  @Common.SAPObjectNodeTypeReference : 'ProductLogisticsHandlingGroup'
  @Common.IsUpperCase : true
  @Common.Label : 'Log. handling group'
  @Common.Heading : 'LHG'
  @Common.QuickInfo : 'Logistics handling group for workload calculation'
  ProductLogisticsHandlingGroup : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Material freight grp'
  @Common.Heading : 'MatFrtGp'
  @Common.QuickInfo : 'Material freight group'
  ProductFreightGroup : String(8) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'OB Reference Materl'
  @Common.QuickInfo : 'Reference Material for Original Batches'
  OriginalBatchReferenceProduct : String(40) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'OB Management'
  @Common.Heading : 'OBM'
  @Common.QuickInfo : 'Indicator for Original Batch Management'
  OriglBatchManagementIsRequired : String(1) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  @Measures.Unit : ProductControlTemperatureUnit
  @Measures.UNECEUnit : ProdCtrlTemperatureUnitISOCode
  @Common.Label : 'Min. Temperature'
  @Common.Heading : 'Minimum Temperature'
  @Common.QuickInfo : 'Minimum Temperature'
  ProductMinControlTemperature : Decimal(7, 2) not null;
  @Measures.Unit : ProductControlTemperatureUnit
  @Measures.UNECEUnit : ProdCtrlTemperatureUnitISOCode
  @Common.Label : 'Max. Temperature'
  @Common.Heading : 'Maximum Temperature'
  @Common.QuickInfo : 'Maximum Temperature'
  ProductMaxControlTemperature : Decimal(7, 2) not null;
  @Common.IsUnit : true
  @Common.Label : 'Temperature UoM'
  @Common.Heading : 'Unit of Measure of Temperatu'
  @Common.QuickInfo : 'Unit of Measure of Temperature'
  ProductControlTemperatureUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product Control Temperature ISO Unit'
  ProdCtrlTemperatureUnitISOCode : String(3) not null;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProdPlantInternationalTrade : Composition of one OP_PRODUCT_0001.ProductPlantInternationalTrade;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantCosting : Composition of one OP_PRODUCT_0001.ProductPlantCosting;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantForecast : Composition of one OP_PRODUCT_0001.ProductPlantForecast;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantInspTypeSetting : Composition of many OP_PRODUCT_0001.ProductPlantInspTypeSetting;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantMRP : Composition of many OP_PRODUCT_0001.ProductPlantMRP;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantProcurement : Composition of one OP_PRODUCT_0001.ProductPlantProcurement;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantPurchaseTax : Composition of many OP_PRODUCT_0001.ProductPlantPurchaseTax;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantQualityManagement : Composition of one OP_PRODUCT_0001.ProductPlantQualityManagement;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantSales : Composition of one OP_PRODUCT_0001.ProductPlantSales;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantStorage : Composition of one OP_PRODUCT_0001.ProductPlantStorage;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantStorageLocation : Composition of many OP_PRODUCT_0001.ProductPlantStorageLocation;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantSupplyPlanning : Composition of one OP_PRODUCT_0001.ProductPlantSupplyPlanning;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductPlantWorkScheduling : Composition of one OP_PRODUCT_0001.ProductPlantWorkScheduling;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant Costing'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: Plant,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: IsCoProduct,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: CostingLotSize,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: TaskListType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: CostingSpecialProcurementType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductBOMUsage,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductIsCostingRelevant,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: VarianceKey,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: CostingProductionVersion,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: IsFixedPriceCoProduct,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductPlantCosting {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Co-Product'
  IsCoProduct : Boolean not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Costing Lot Size'
  @Common.QuickInfo : 'Lot Size for Product Costing'
  CostingLotSize : Decimal(13, 3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Group'
  @Common.QuickInfo : 'Key for Task List Group'
  TaskListGroup : String(8) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Task List Type'
  @Common.Heading : 'TLType'
  TaskListType : String(1) not null;
  @Common.SAPObjectNodeTypeReference : 'ProcurementSubType'
  @Common.IsUpperCase : true
  @Common.Label : 'Special Procurement Type'
  @Common.QuickInfo : 'Special Procurement Type for Costing'
  CostingSpecialProcurementType : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Alternative BOM'
  @Common.Heading : 'AltBOM'
  SourceBOMAlternative : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'BOM Usage'
  @Common.Heading : 'BOM Usg'
  ProductBOMUsage : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Do Not Cost'
  ProductIsCostingRelevant : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Group Counter'
  @Common.Heading : 'GrC'
  TaskListGroupCounter : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Variance Key'
  @Common.Heading : 'VarKey'
  VarianceKey : String(6) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Production Version'
  @Common.Heading : 'Ver.'
  @Common.QuickInfo : 'Production Version To Be Costed'
  CostingProductionVersion : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Fixed-Price Co-Prod.'
  @Common.QuickInfo : 'Fixed-Price Co-Product'
  IsFixedPriceCoProduct : Boolean not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one OP_PRODUCT_0001.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant Forecast'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: Plant,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ConsumptionReferencePlant,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: CorrectionFactorIsRequired,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ForecastModelIsReset,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductPlantForecast {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Common.Label : 'Date to'
  @Common.QuickInfo : 'To date of the material to be copied for consumption'
  ConsumptionRefUsageEndDate : Date;
  @Common.Label : 'Multiplier'
  @Common.QuickInfo : 'Multiplier for reference material for consumption'
  CnsmpnQuantityMultiplierValue : Decimal(4, 2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'RefMatl: consumption'
  @Common.Heading : 'Consumable mat.'
  @Common.QuickInfo : 'Reference material for consumption'
  ConsumptionReferenceProduct : String(40) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'RefPlant:consumption'
  @Common.Heading : 'CNPL'
  @Common.QuickInfo : 'Reference plant for consumption'
  ConsumptionReferencePlant : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Correction factors'
  @Common.Heading : 'C'
  @Common.QuickInfo : 'Indicator: take correction factors into account'
  CorrectionFactorIsRequired : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Reset automatically'
  @Common.QuickInfo : 'Reset Forecast Model Automatically'
  ForecastModelIsReset : Boolean not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one OP_PRODUCT_0001.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Inspection Type Settings'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: InspectionLotType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: Plant,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InspLotIsTaskListRequired,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InspLotHasMaterialSpec,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InspLotHasConfignSpecification,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InspLotHasBatchCharc,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InspLotHasAutomSpecAssgmt,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InspLotHasCharc,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: HasPostToInspectionStock,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InspLotIsAutomUsgeDcsnPossible,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: SamplingProcedure,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InspLotDynamicRule,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InspectionLotIsFullInspection,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InspLotSkipIsAllowed,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InspLotHasManualSampleSize,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InspLotIsSmplCalcMnlTriggered,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InspLotIsSerialNmbrPossible,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InspLotSummaryControl,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InspQualityScoreProcedure,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InspectionLotHasAppraisalCosts,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProdInspTypeSettingIsActive,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InspTypeIsPrfrd,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InspLotHasHandlingUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InspLotHasMultipleSpec,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InspLotOfEWMSummaryControl,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductPlantInspTypeSetting {
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Inspection Type'
  @Common.Heading : 'InspType'
  key InspectionLotType : String(8) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Material'
  @Common.QuickInfo : 'Material Number'
  key Product : String(40) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Insp. with Task List'
  @Common.Heading : 'List'
  @Common.QuickInfo : 'Inspection with Task List'
  InspLotIsTaskListRequired : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Insp. with Mat Spec.'
  @Common.QuickInfo : 'Inspect with Material Specification'
  InspLotHasMaterialSpec : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Insp. by Configuratn'
  @Common.QuickInfo : 'Inspection Specifications from Configuration'
  InspLotHasConfignSpecification : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Inspect by Batch'
  @Common.QuickInfo : 'Inspection Specifications from Batch Determination'
  InspLotHasBatchCharc : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Automatic Assignment'
  @Common.Heading : 'APlS'
  @Common.QuickInfo : 'Automatic Specification Assignment'
  InspLotHasAutomSpecAssgmt : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Inspect Charcs'
  @Common.Heading : 'ChIn'
  @Common.QuickInfo : 'Inspect by Characteristics'
  InspLotHasCharc : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Post to Insp. Stock'
  @Common.Heading : 'I'
  @Common.QuickInfo : 'Post to Inspection Stock'
  HasPostToInspectionStock : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Automatic UD'
  @Common.Heading : 'Auto UD'
  @Common.QuickInfo : 'Automatic Usage Decision Planned'
  InspLotIsAutomUsgeDcsnPossible : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Sampling Procedure'
  @Common.Heading : 'Prc'
  SamplingProcedure : String(8) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Modification Rule'
  @Common.Heading : 'DynR'
  @Common.QuickInfo : 'Dynamic Modification Rule'
  InspLotDynamicRule : String(3) not null;
  @Common.Label : 'Insp. percentage'
  @Common.Heading : 'Ins%'
  @Common.QuickInfo : 'Inspection Percentage'
  InspLotSampleQuantityInPercent : Decimal(precision: 3) not null;
  @Common.IsUpperCase : true
  @Common.Label : '100% Inspection'
  @Common.Heading : '100%'
  InspectionLotIsFullInspection : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Skips Allowed'
  @Common.Heading : 'Skip'
  InspLotSkipIsAllowed : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Manual Sample Entry'
  @Common.Heading : 'MSE'
  @Common.QuickInfo : 'Enter Sample Manually'
  InspLotHasManualSampleSize : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Manual Sample Calc.'
  @Common.Heading : 'MTC'
  @Common.QuickInfo : 'Trigger Sample Calculation Manually'
  InspLotIsSmplCalcMnlTriggered : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Serial Numbers Poss.'
  @Common.Heading : 'SerN'
  @Common.QuickInfo : 'Serial Numbers Possible'
  InspLotIsSerialNmbrPossible : Boolean not null;
  @Common.Label : 'Avg. Insp. Duration'
  @Common.Heading : 'AInD'
  @Common.QuickInfo : 'Average Inspection Duration'
  InspLotDurationInDays : Decimal(precision: 3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Control Lot Creation'
  @Common.Heading : 'LtCtl'
  @Common.QuickInfo : 'Control of Inspection Lot Creation (Lot Summary)'
  InspLotSummaryControl : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Q-Score Procedure'
  @Common.Heading : 'QSc'
  @Common.QuickInfo : 'Procedure for Calculating Quality Score'
  InspQualityScoreProcedure : String(2) not null;
  @Common.Label : 'Allowed Scrap Share'
  @Common.Heading : 'Scrap%'
  @Common.QuickInfo : 'Allowed Share of Scrap (Percent) in Inspection Lot'
  InspLotAcceptedScrapRatioInPct : Decimal(6, 4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Individual QM Order'
  @Common.Heading : 'InOr'
  @Common.QuickInfo : 'Record Appraisal Costs in Individual QM Order'
  InspectionLotHasAppraisalCosts : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'QM Order'
  @Common.QuickInfo : 'Order Number for Recording Appraisal Costs'
  QualityCostCollector : String(12) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'InspType-Matl Active'
  @Common.Heading : 'Act'
  @Common.QuickInfo : 'Inspection Type - Material Combination Is Active'
  ProdInspTypeSettingIsActive : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Preferred Insp. Type'
  @Common.Heading : 'Prf'
  @Common.QuickInfo : 'Preferred Inspection Type'
  InspTypeIsPrfrd : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Inspection for HU'
  @Common.Heading : 'HU'
  @Common.QuickInfo : 'Inspection for Handling Unit'
  InspLotHasHandlingUnit : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Multiple Specs'
  @Common.Heading : 'Indicator: Multiple Specifications'
  @Common.QuickInfo : 'Indicator: Multiple Specifications'
  InspLotHasMultipleSpec : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Insp. Lot Summary'
  @Common.Heading : 'Inspection Lot Summary (Warehouse-Managed Stock)'
  @Common.QuickInfo : 'Inspection Lot Summary (Warehouse-Managed Stock)'
  InspLotOfEWMSummaryControl : String(1) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one OP_PRODUCT_0001.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant International Trade'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: Plant,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: CountryOfOrigin,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: RegionOfOrigin,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ConsumptionTaxCtrlCode,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ExportAndImportProductGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductCASNumber,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProdIntlTradeClassification,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductPlantInternationalTrade {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Country/Region of Origin'
  @Common.QuickInfo : 'Country/Region of Origin of Product'
  CountryOfOrigin : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Region of Origin'
  @Common.Heading : 'ROr'
  RegionOfOrigin : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Control code'
  @Common.QuickInfo : 'Control code for consumption taxes in foreign trade'
  ConsumptionTaxCtrlCode : String(16) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Intrastat Group'
  @Common.Heading : 'IntraGrp'
  @Common.QuickInfo : 'Material Group for Intrastat'
  ExportAndImportProductGroup : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'CAS number (pharm.)'
  @Common.Heading : 'CAS no.'
  @Common.QuickInfo : 'CAS number for pharmaceutical products in foreign trade'
  ProductCASNumber : String(15) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'PRODCOM no.'
  @Common.QuickInfo : 'Production statistics: PRODCOM number for foreign trade'
  ProdIntlTradeClassification : String(9) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one OP_PRODUCT_0001.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant MRP'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: MRPArea,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: Plant,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MRPType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MRPResponsible,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MRPGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ReorderThresholdQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: PlanAndOrderDayDetermination,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: LotSizingProcedure,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: RoundingProfile,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: LotSizeRoundingQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MinimumLotSizeQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MaximumLotSizeQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MaximumStockQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProcurementSubType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductionInvtryManagedLoc,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: DfltStorageLocationExtProcmt,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MRPPlanningCalendar,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: SafetyStockQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: RangeOfCvrgPrflCode,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: FixedLotSizeQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: LotSizeIndependentCosts,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: StorageCostsPercentageCode,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: IsMarkedForDeletion,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: SafetyTimePeriodProfile,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: DependentRqmtMRPRelevance,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductSafetyTimeMRPRelevance,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: IsPlannedDeliveryTime,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MRPSafetyStockMethod,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductPlantMRP {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Material'
  @Common.QuickInfo : 'Material Number'
  key Product : String(40) not null;
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'MRP Area'
  key MRPArea : String(10) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'MRP Area Plant'
  @Common.Heading : 'Plnt'
  @Common.QuickInfo : 'MRP Area: Plant'
  key Plant : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'MRPType'
  @Common.IsUpperCase : true
  @Common.Label : 'MRP Type'
  @Common.Heading : 'Typ'
  MRPType : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'MRP Controller'
  @Common.Heading : 'MRPCn'
  MRPResponsible : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'MRPGroup'
  @Common.IsUpperCase : true
  @Common.Label : 'MRP Group'
  @Common.Heading : 'MRP'
  MRPGroup : String(4) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Reorder Point'
  ReorderThresholdQuantity : Decimal(13, 3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Planning Cycle'
  @Common.Heading : 'PCy'
  PlanAndOrderDayDetermination : String(3) not null;
  @Common.IsDigitSequence : true
  @Common.Label : 'Planning time fence'
  PlanningTimeFence : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Lot Sizing Procedure'
  @Common.QuickInfo : 'Lot Sizing Procedure in Materials Planning'
  LotSizingProcedure : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Rounding Profile'
  @Common.Heading : 'R. Profile'
  RoundingProfile : String(4) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Rounding value'
  @Common.Heading : 'Rounding val.'
  @Common.QuickInfo : 'Rounding value for purchase order quantity'
  LotSizeRoundingQuantity : Decimal(13, 3) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Minimum Lot Size'
  @Common.Heading : 'Min. Lot Sze'
  MinimumLotSizeQuantity : Decimal(13, 3) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Maximum Lot Size'
  @Common.Heading : 'Max. Lot Size'
  MaximumLotSizeQuantity : Decimal(13, 3) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Maximum Stock Level'
  @Common.Heading : 'Max. Level'
  MaximumStockQuantity : Decimal(13, 3) not null;
  @Common.Label : 'Assembly scrap (%)'
  @Common.Heading : 'A.scrap'
  @Common.QuickInfo : 'Assembly scrap in percent'
  AssemblyScrapPercent : Decimal(5, 2) not null;
  @Common.SAPObjectNodeTypeReference : 'ProcurementSubType'
  @Common.IsUpperCase : true
  @Common.Label : 'Special Procurement'
  @Common.Heading : 'Special Procurement Type'
  @Common.QuickInfo : 'Special Procurement Type'
  ProcurementSubType : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Storage Location'
  @Common.Heading : 'Production Storage Location'
  @Common.QuickInfo : 'Issue Storage Location'
  ProductionInvtryManagedLoc : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Storage Location'
  @Common.Heading : 'Storage Location for External Procurement'
  @Common.QuickInfo : 'Default Storage Location for External Procurement'
  DfltStorageLocationExtProcmt : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'MRPPlanningCalendar'
  @Common.IsUpperCase : true
  @Common.Label : 'Planning Calendar'
  MRPPlanningCalendar : String(3) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Safety Stock'
  SafetyStockQuantity : Decimal(13, 3) not null;
  @Common.SAPObjectNodeTypeReference : 'MatlStkRangeOfCoverageProfile'
  @Common.IsUpperCase : true
  @Common.Label : 'Coverage Profile'
  @Common.Heading : 'Range-of-Coverage Profile'
  @Common.QuickInfo : 'Range-of-Coverage Profile'
  RangeOfCvrgPrflCode : String(3) not null;
  @Common.IsDigitSequence : true
  @Common.Label : 'Safety Time'
  @Common.Heading : 'SafetyTime'
  @Common.QuickInfo : 'Safety Time (in Workdays)'
  SafetySupplyDurationInDays : String(2) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Fixed lot size'
  @Common.Heading : 'Fix. lot size'
  FixedLotSizeQuantity : Decimal(13, 3) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'LS-Independent Costs'
  @Common.Heading : 'LSI Costs'
  @Common.QuickInfo : 'Lot-Size-Independent Costs'
  LotSizeIndependentCosts : Decimal(11, variable) not null;
  @Common.SAPObjectNodeTypeReference : 'StorageCostsPercentageCode'
  @Common.IsUpperCase : true
  @Common.Label : 'Storage Costs Code'
  @Common.Heading : 'Key'
  @Common.QuickInfo : 'Storage Costs Percentage Code'
  StorageCostsPercentageCode : String(1) not null;
  @Common.Label : 'Service level (%)'
  @Common.Heading : 'SLev'
  @Common.QuickInfo : 'Service level'
  ProductServiceLevelInPercent : Decimal(3, 1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Deletion Indicator'
  @Common.Heading : 'D'
  IsMarkedForDeletion : Boolean not null;
  @Common.SAPObjectNodeTypeReference : 'MatlStkSafetyTimePeriodProfile'
  @Common.IsUpperCase : true
  @Common.Label : 'Time Profile'
  @Common.Heading : 'Safety Time Period Profile'
  @Common.QuickInfo : 'Period Profile for Safety Time'
  SafetyTimePeriodProfile : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'MRP Relevant'
  @Common.Heading : 'MRP-Relevant Dependent Requirements'
  @Common.QuickInfo : 'MRP relevancy for dependent requirements'
  DependentRqmtMRPRelevance : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Safety Time'
  @Common.QuickInfo : 'Safety Time Indicator (with or without safety time)'
  ProductSafetyTimeMRPRelevance : String(1) not null;
  @Common.Label : 'Planned Deliv. Time'
  @Common.Heading : 'PDT'
  @Common.QuickInfo : 'Planned Delivery Time in Days'
  PlannedDeliveryDurationInDays : Decimal(precision: 3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Consider PlDelTime'
  @Common.QuickInfo : 'Consider Planned Delivery Time of the MRP Area'
  IsPlannedDeliveryTime : Boolean not null;
  @Common.Label : 'Takt time'
  @Common.Heading : 'TT'
  RqmtQtyRcptTaktTmeInWrkgDays : Decimal(precision: 3) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductSafetyStockMethod'
  @Common.IsUpperCase : true
  @Common.Label : 'Safety Stock Method'
  @Common.QuickInfo : 'MRP Safety Stock Method'
  MRPSafetyStockMethod : String(2) not null;
  @Common.SAPObjectNodeTypeReference : 'Currency'
  @Common.IsCurrency : true
  @Common.IsUpperCase : true
  @Common.Label : 'Currency'
  @Common.Heading : 'Crcy'
  @Common.QuickInfo : 'Currency Key'
  Currency : String(3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one OP_PRODUCT_0001.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant Procurement'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: Plant,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: IsAutoPurOrdCreationAllowed,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: IsSourceListRequired,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: JustInTimeDeliveryScheduleCode,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: PurchasingGroup,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductPlantProcurement {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Automatic PO'
  @Common.Heading : 'Aut'
  @Common.QuickInfo : 'Indicator: "automatic purchase order allowed"'
  IsAutoPurOrdCreationAllowed : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Source list'
  @Common.QuickInfo : 'Indicator: Source list requirement'
  IsSourceListRequired : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'JIT Delivery'
  @Common.Heading : 'JIT Delivery Schedules'
  @Common.QuickInfo : 'JIT Delivery Schedules'
  JustInTimeDeliveryScheduleCode : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Purchasing Group'
  @Common.Heading : 'PGr'
  PurchasingGroup : String(3) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one OP_PRODUCT_0001.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant Purchase Tax'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: Plant,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: DepartureCountry,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProdPurchaseTaxClassification,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductPlantPurchaseTax {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Departure Ctry/Reg.'
  @Common.Heading : 'DeCR'
  @Common.QuickInfo : 'Departure Country/Region (from which the goods are sent)'
  key DepartureCountry : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Tax ind. f. material'
  @Common.Heading : 'Material'
  @Common.QuickInfo : 'Tax indicator for material (Purchasing)'
  ProdPurchaseTaxClassification : String(1) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one OP_PRODUCT_0001.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant Quality Management'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: Plant,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProdQltyManagementControlKey,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: HasPostToInspectionStock,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InspLotDocumentationIsRequired,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: QualityMgmtSystemForSupplier,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductQualityCertificateType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProdQualityAuthorizationGroup,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductPlantQualityManagement {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'QM Control Key'
  @Common.Heading : 'Ctrl Key'
  @Common.QuickInfo : 'Control Key for Quality Management in Procurement'
  ProdQltyManagementControlKey : String(8) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Post to insp. stock'
  @Common.Heading : 'I'
  @Common.QuickInfo : 'Has Post to Inspection Stock'
  HasPostToInspectionStock : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Documentation reqd'
  @Common.Heading : 'D'
  @Common.QuickInfo : 'Documentation required indicator'
  InspLotDocumentationIsRequired : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Target QM System'
  @Common.QuickInfo : 'Required QM System for Supplier'
  QualityMgmtSystemForSupplier : String(4) not null;
  @Common.Label : 'Inspection Interval'
  @Common.Heading : 'InspIn'
  @Common.QuickInfo : 'Interval Until Next Recurring Inspection'
  RecrrgInspIntervalTimeInDays : Decimal(precision: 5) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Certificate Type'
  @Common.Heading : 'CTyp'
  ProductQualityCertificateType : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'QM Material Auth.'
  @Common.Heading : 'QMatAu'
  @Common.QuickInfo : 'Material Authorization Group for Activities in QM'
  ProdQualityAuthorizationGroup : String(6) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one OP_PRODUCT_0001.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant Sales'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: Plant,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: LoadingGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: CapPlanningQuantityInBaseUoM,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ReplacementPartType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: AvailabilityCheckType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductPlantSales {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Loading Group'
  @Common.Heading : 'LGrp'
  LoadingGroup : String(4) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Base quantity'
  @Common.QuickInfo : 'Base quantity for capacity planning in shipping'
  CapPlanningQuantityInBaseUoM : Decimal(13, 3) not null;
  @Common.Label : 'Processing time'
  @Common.Heading : 'PrTime'
  @Common.QuickInfo : 'Shipping processing time'
  ProdShipgProcgDurationInDays : Decimal(5, 2) not null;
  @Common.Label : 'Setup time'
  @Common.Heading : 'Setup'
  @Common.QuickInfo : 'Shipping setup time'
  WrkCentersShipgSetupTimeInDays : Decimal(5, 2) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductReplacementPartType'
  @Common.IsUpperCase : true
  @Common.Label : 'Replacement Part'
  @Common.Heading : 'R'
  @Common.QuickInfo : 'Replacement part'
  ReplacementPartType : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Availability check'
  @Common.Heading : 'Av'
  @Common.QuickInfo : 'Checking Group for Availability Check'
  AvailabilityCheckType : String(2) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one OP_PRODUCT_0001.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant Storage'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: Plant,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: PhysInventoryForCycleCounting,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MaximumStoragePeriod,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProdMaximumStoragePeriodUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MaximumStoragePeriodISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: CycleCountingIndicatorIsFixed,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductPlantStorage {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'CC Phys. Inv. Ind.'
  @Common.Heading : 'CC'
  @Common.QuickInfo : 'Physical Inventory Indicator for Cycle Counting'
  PhysInventoryForCycleCounting : String(1) not null;
  @Measures.Unit : ProdMaximumStoragePeriodUnit
  @Measures.UNECEUnit : MaximumStoragePeriodISOUnit
  @Common.Label : 'Max. Storage Period'
  @Common.Heading : 'Stor.'
  @Common.QuickInfo : 'Maximum Storage Period'
  MaximumStoragePeriod : Decimal(precision: 5) not null;
  @Common.IsUnit : true
  @Common.Label : 'Time unit'
  @Common.Heading : 'TUn'
  @Common.QuickInfo : 'Unit for maximum storage period'
  ProdMaximumStoragePeriodUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Time unit ISO'
  @Common.Heading : 'TmI'
  @Common.QuickInfo : 'Unit for the maximum storage period in ISO code'
  MaximumStoragePeriodISOUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'CC indicator fixed'
  @Common.Heading : 'CC fix'
  @Common.QuickInfo : 'CC indicator is fixed'
  CycleCountingIndicatorIsFixed : Boolean not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one OP_PRODUCT_0001.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant Storage Location'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: Plant,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: StorageLocation,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: WarehouseStorageBin,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: IsMarkedForDeletion,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: LeanWrhsManagementPickingArea,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductPlantStorageLocation {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Storage Location'
  key StorageLocation : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Storage Bin'
  @Common.Heading : 'Bin'
  WarehouseStorageBin : String(10) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'DF stor. loc. level'
  @Common.Heading : 'SL'
  @Common.QuickInfo : 'Flag Material for Deletion at Storage Location Level'
  IsMarkedForDeletion : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Picking area'
  @Common.Heading : 'PAr'
  @Common.QuickInfo : 'Picking area for lean WM'
  LeanWrhsManagementPickingArea : String(3) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one OP_PRODUCT_0001.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant Supply Planning'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: Plant,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: FixedLotSizeQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MaximumLotSizeQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MinimumLotSizeQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: LotSizeRoundingQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: LotSizingProcedure,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MRPType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MRPResponsible,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: SafetyStockQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MinimumSafetyStockQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ConsumptionValueCategory,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MaximumStockQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ReorderThresholdQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: PlanningStrategyGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProcurementType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProcurementSubType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: AvailabilityCheckType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: PlanAndOrderDayDetermination,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: RoundingProfile,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: DfltStorageLocationExtProcmt,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MRPGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: LotSizeIndependentCosts,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MRPPlanningCalendar,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: RangeOfCvrgPrflCode,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductSafetyTimeMRPRelevance,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: SafetyTimePeriodProfile,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: DependentRqmtMRPRelevance,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MRPAvailabilityType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: CrossProjectProduct,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: StorageCostsPercentageCode,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: RepetitiveManufacturingIsAllwd,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: DependentRequirementsType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductIsBulkComponent,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: RepetitiveManufacturingProfile,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProdRqmtsConsumptionMode,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProdFcstRequirementsSplitCode,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: SchedulingFloatProfile,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductDiscontinuationCode,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductRequirementsGrouping,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductionInvtryManagedLoc,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductComponentBackflushCode,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProposedProductSupplyArea,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MRPSafetyStockMethod,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: JITProdnConfProfile,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: PlannedOrderActionControl,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MRPProfile,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProdnPlngAndControlCalendar,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductPlantSupplyPlanning {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Fixed lot size'
  @Common.Heading : 'Fix. lot size'
  FixedLotSizeQuantity : Decimal(13, 3) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Maximum Lot Size'
  @Common.Heading : 'Max. Lot Size'
  MaximumLotSizeQuantity : Decimal(13, 3) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Minimum Lot Size'
  @Common.Heading : 'Min. Lot Sze'
  MinimumLotSizeQuantity : Decimal(13, 3) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Rounding value'
  @Common.Heading : 'Rounding val.'
  @Common.QuickInfo : 'Rounding value for purchase order quantity'
  LotSizeRoundingQuantity : Decimal(13, 3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Lot Sizing Procedure'
  @Common.QuickInfo : 'Lot Sizing Procedure in Materials Planning'
  LotSizingProcedure : String(2) not null;
  @Common.SAPObjectNodeTypeReference : 'MRPType'
  @Common.IsUpperCase : true
  @Common.Label : 'MRP Type'
  @Common.Heading : 'Typ'
  MRPType : String(2) not null;
  @Common.SAPObjectNodeTypeReference : 'MRPController'
  @Common.IsUpperCase : true
  @Common.Label : 'MRP Controller'
  @Common.Heading : 'MRPCn'
  MRPResponsible : String(3) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Safety Stock'
  SafetyStockQuantity : Decimal(13, 3) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Min. Saf. Stock'
  @Common.Heading : 'Minimum Safety Stock'
  @Common.QuickInfo : 'Minimum Safety Stock'
  MinimumSafetyStockQuantity : Decimal(13, 3) not null;
  @Common.IsDigitSequence : true
  @Common.Label : 'Planning time fence'
  PlanningTimeFence : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'ProdConsumptionValueCategory'
  @Common.IsUpperCase : true
  @Common.Label : 'ABC Indicator'
  @Common.Heading : 'ABC'
  ConsumptionValueCategory : String(1) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Maximum Stock Level'
  @Common.Heading : 'Max. Level'
  MaximumStockQuantity : Decimal(13, 3) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Reorder Point'
  ReorderThresholdQuantity : Decimal(13, 3) not null;
  @Common.Label : 'Planned Deliv. Time'
  @Common.Heading : 'PDT'
  @Common.QuickInfo : 'Planned Delivery Time in Days'
  PlannedDeliveryDurationInDays : Decimal(precision: 3) not null;
  @Common.IsDigitSequence : true
  @Common.Label : 'Safety Time'
  @Common.Heading : 'SafetyTime'
  @Common.QuickInfo : 'Safety Time (in Workdays)'
  SafetySupplyDurationInDays : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Strategy Group'
  @Common.Heading : 'SG'
  @Common.QuickInfo : 'Planning Strategy Group'
  PlanningStrategyGroup : String(2) not null;
  @Common.Label : 'Tot. repl. lead time'
  @Common.Heading : 'TRLT'
  @Common.QuickInfo : 'Total replenishment lead time (in workdays)'
  TotalReplenishmentLeadTime : Decimal(precision: 3) not null;
  @Common.SAPObjectNodeTypeReference : 'ProcurementType'
  @Common.IsUpperCase : true
  @Common.Label : 'Procurement Type'
  @Common.Heading : 'ProcType'
  ProcurementType : String(1) not null;
  @Common.SAPObjectNodeTypeReference : 'ProcurementSubType'
  @Common.IsUpperCase : true
  @Common.Label : 'Special Procurement'
  @Common.Heading : 'Special Procurement Type'
  @Common.QuickInfo : 'Special Procurement Type'
  ProcurementSubType : String(2) not null;
  @Common.Label : 'Assembly scrap (%)'
  @Common.Heading : 'A.scrap'
  @Common.QuickInfo : 'Assembly scrap in percent'
  AssemblyScrapPercent : Decimal(5, 2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Availability check'
  @Common.Heading : 'Av'
  @Common.QuickInfo : 'Checking Group for Availability Check'
  AvailabilityCheckType : String(2) not null;
  @Common.Label : 'GR processing time'
  @Common.Heading : 'GRT'
  @Common.QuickInfo : 'Goods receipt processing time in days'
  GoodsReceiptDuration : Decimal(precision: 3) not null;
  @Common.SAPObjectNodeTypeReference : 'MRPPlanningCalendar'
  @Common.IsUpperCase : true
  @Common.Label : 'Planning Cycle'
  @Common.Heading : 'PCy'
  PlanAndOrderDayDetermination : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Rounding Profile'
  @Common.Heading : 'R. Profile'
  RoundingProfile : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'StorageLocation'
  @Common.IsUpperCase : true
  @Common.Label : 'Storage Location'
  @Common.Heading : 'Storage Location for External Procurement'
  @Common.QuickInfo : 'Default Storage Location for External Procurement'
  DfltStorageLocationExtProcmt : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'MRPGroup'
  @Common.IsUpperCase : true
  @Common.Label : 'MRP Group'
  @Common.Heading : 'MRP'
  MRPGroup : String(4) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'LS-Independent Costs'
  @Common.Heading : 'LSI Costs'
  @Common.QuickInfo : 'Lot-Size-Independent Costs'
  LotSizeIndependentCosts : Decimal(11, variable) not null;
  @Common.Label : 'Takt time'
  @Common.Heading : 'TT'
  RqmtQtyRcptTaktTmeInWrkgDays : Decimal(precision: 3) not null;
  @Common.SAPObjectNodeTypeReference : 'MRPPlanningCalendar'
  @Common.IsUpperCase : true
  @Common.Label : 'Planning Calendar'
  MRPPlanningCalendar : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'MatlStkRangeOfCoverageProfile'
  @Common.IsUpperCase : true
  @Common.Label : 'Coverage Profile'
  @Common.Heading : 'Range-of-Coverage Profile'
  @Common.QuickInfo : 'Range-of-Coverage Profile'
  RangeOfCvrgPrflCode : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Safety Time'
  @Common.QuickInfo : 'Safety Time Indicator (with or without safety time)'
  ProductSafetyTimeMRPRelevance : String(1) not null;
  @Common.SAPObjectNodeTypeReference : 'MatlStkSafetyTimePeriodProfile'
  @Common.IsUpperCase : true
  @Common.Label : 'Time Profile'
  @Common.Heading : 'Safety Time Period Profile'
  @Common.QuickInfo : 'Period Profile for Safety Time'
  SafetyTimePeriodProfile : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'MRP Relevant'
  @Common.Heading : 'MRP-Relevant Dependent Requirements'
  @Common.QuickInfo : 'MRP relevancy for dependent requirements'
  DependentRqmtMRPRelevance : String(1) not null;
  @Common.Label : 'Service level (%)'
  @Common.Heading : 'SLev'
  @Common.QuickInfo : 'Service level'
  ProductServiceLevelInPercent : Decimal(3, 1) not null;
  @Common.Label : 'In-house production'
  @Common.Heading : 'IPT'
  @Common.QuickInfo : 'In-house production time'
  ProdInhProdnDurationInWorkDays : Decimal(precision: 3) not null;
  @Common.SAPObjectNodeTypeReference : 'MRPAvailabilityType'
  @Common.IsUpperCase : true
  @Common.Label : 'Mixed MRP'
  @Common.Heading : 'Mx'
  @Common.QuickInfo : 'Mixed MRP indicator'
  MRPAvailabilityType : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Cross-Project'
  @Common.Heading : 'Cross-Project Material'
  @Common.QuickInfo : 'Indicator for Cross-Project Material'
  CrossProjectProduct : String(1) not null;
  @Common.SAPObjectNodeTypeReference : 'StorageCostsPercentageCode'
  @Common.IsUpperCase : true
  @Common.Label : 'Storage Costs Code'
  @Common.Heading : 'Key'
  @Common.QuickInfo : 'Storage Costs Percentage Code'
  StorageCostsPercentageCode : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Follow-Up Material'
  FollowUpProduct : String(40) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Repetitive Manufacturing Enabled'
  RepetitiveManufacturingIsAllwd : Boolean not null;
  @Common.SAPObjectNodeTypeReference : 'ProdDependentRequirementsType'
  @Common.IsUpperCase : true
  @Common.Label : 'Indiv./ Coll.'
  @Common.Heading : 'Individual/ Collective Requirements'
  @Common.QuickInfo : 'Indicator for Individual and Collective Requirements'
  DependentRequirementsType : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Bulk material'
  @Common.Heading : 'Bulk'
  @Common.QuickInfo : 'Indicator: bulk material'
  ProductIsBulkComponent : Boolean not null;
  @Common.SAPObjectNodeTypeReference : 'RepetitiveManufacturingProfile'
  @Common.IsUpperCase : true
  @Common.Label : 'Repetitive Manufacturing Profile'
  RepetitiveManufacturingProfile : String(4) not null;
  @Common.IsDigitSequence : true
  @Common.Label : 'Backward Consumption Period'
  @Common.QuickInfo : 'Consumption Period: Backward'
  BackwardCnsmpnPeriodInWorkDays : String(3) not null;
  @Common.IsDigitSequence : true
  @Common.Label : 'Forward Consumption Period'
  @Common.QuickInfo : 'Consumption period: Forward'
  FwdConsumptionPeriodInWorkDays : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'ProdRqmtsConsumptionMode'
  @Common.IsUpperCase : true
  @Common.Label : 'Consumption mode'
  ProdRqmtsConsumptionMode : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Splitting Indicator'
  ProdFcstRequirementsSplitCode : String(1) not null;
  @Common.Label : 'Effective-Out Date'
  EffectiveOutDate : Date;
  @Common.IsUpperCase : true
  @Common.Label : 'Sched. Margin Key'
  @Common.Heading : 'Scheduling Margin Key'
  @Common.QuickInfo : 'Scheduling Margin Key for Floats'
  SchedulingFloatProfile : String(3) not null;
  @Common.Label : 'Component Scrap (%)'
  @Common.Heading : 'C.scrap'
  @Common.QuickInfo : 'Component Scrap in Percent'
  ComponentScrapInPercent : Decimal(5, 2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Discontinuation ind.'
  @Common.Heading : 'D'
  @Common.QuickInfo : 'Discontinuation indicator'
  ProductDiscontinuationCode : String(1) not null;
  @Common.SAPObjectNodeTypeReference : 'ProdRequirementsGroupingCode'
  @Common.IsUpperCase : true
  @Common.Label : 'Requirements group'
  @Common.Heading : 'G'
  @Common.QuickInfo : 'Indicator for Requirements Grouping'
  ProductRequirementsGrouping : String(1) not null;
  @Common.SAPObjectNodeTypeReference : 'StorageLocation'
  @Common.IsUpperCase : true
  @Common.Label : 'Storage Location'
  @Common.Heading : 'Production Storage Location'
  @Common.QuickInfo : 'Issue Storage Location'
  ProductionInvtryManagedLoc : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductComponentBackflushCode'
  @Common.IsUpperCase : true
  @Common.Label : 'Backflush'
  @Common.Heading : 'B'
  @Common.QuickInfo : 'Indicator: Backflush'
  ProductComponentBackflushCode : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Proposed Supply Area'
  @Common.QuickInfo : 'Proposed Supply Area in Material Master Record'
  ProposedProductSupplyArea : String(10) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductSafetyStockMethod'
  @Common.IsUpperCase : true
  @Common.Label : 'Safety Stock Method'
  @Common.QuickInfo : 'MRP Safety Stock Method'
  MRPSafetyStockMethod : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'JIT Production Confirmation Profile'
  JITProdnConfProfile : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Action Control'
  @Common.Heading : 'AC'
  @Common.QuickInfo : 'Action Control: Planned Order Processing'
  PlannedOrderActionControl : String(2) not null;
  @Common.SAPObjectNodeTypeReference : 'Currency'
  @Common.IsCurrency : true
  @Common.IsUpperCase : true
  @Common.Label : 'Currency'
  @Common.Heading : 'Crcy'
  @Common.QuickInfo : 'Currency Key'
  Currency : String(3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'MRPProfile'
  @Common.IsUpperCase : true
  @Common.Label : 'MRP profile'
  @Common.Heading : 'MRPpr'
  @Common.QuickInfo : 'Material: MRP profile'
  MRPProfile : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Planning Calendar'
  ProdnPlngAndControlCalendar : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one OP_PRODUCT_0001.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Plant Work Scheduling'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: Plant,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductBaseQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: UnlimitedOverDelivIsAllowed,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductionInvtryManagedLoc,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductionOrderBatchCode,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProdIsWithdrawnFrmProdnBin,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: TransitionMatrixProductsGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: OrderChangeManagementProfile,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductComponentBackflushCode,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductionSchedulingProfile,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductionSupervisor,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProdProductionQuantityISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductPlantWorkScheduling {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Base quantity'
  ProductBaseQuantity : Decimal(13, 3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Unltd Overdelivery'
  @Common.Heading : 'Unl'
  @Common.QuickInfo : 'Indicator: Unlimited Overdelivery Allowed'
  UnlimitedOverDelivIsAllowed : Boolean not null;
  @Common.Label : 'Overdely tolerance'
  @Common.Heading : 'OTol'
  @Common.QuickInfo : 'Overdelivery tolerance limit'
  OverDeliveryTolerancePercent : Decimal(3, 1) not null;
  @Common.Label : 'Underdely tolerance'
  @Common.Heading : 'UTol'
  @Common.QuickInfo : 'Underdelivery tolerance limit'
  UnderDeliveryTolerancePercent : Decimal(3, 1) not null;
  @Common.SAPObjectNodeTypeReference : 'StorageLocation'
  @Common.IsUpperCase : true
  @Common.Label : 'Storage Location'
  @Common.Heading : 'Production Storage Location'
  @Common.QuickInfo : 'Issue Storage Location'
  ProductionInvtryManagedLoc : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductionOrderBatchCode'
  @Common.IsUpperCase : true
  @Common.Label : 'Batch entry'
  @Common.Heading : 'Bch'
  @Common.QuickInfo : 'Determination of batch entry in the production/process order'
  ProductionOrderBatchCode : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Withdr.from prod.bin'
  @Common.Heading : 'PBn'
  @Common.QuickInfo : 'Indicator: withdrawal of stock from production bin'
  ProdIsWithdrawnFrmProdnBin : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Material Grouping'
  @Common.QuickInfo : 'Group of Materials for Transition Matrix'
  TransitionMatrixProductsGroup : String(20) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Change overall prof.'
  @Common.QuickInfo : 'Overall profile for order change management'
  OrderChangeManagementProfile : String(6) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductComponentBackflushCode'
  @Common.IsUpperCase : true
  @Common.Label : 'Backflush'
  @Common.Heading : 'B'
  @Common.QuickInfo : 'Indicator: Backflush'
  ProductComponentBackflushCode : String(1) not null;
  @Common.Label : 'Setup time'
  @Common.Heading : 'SetupT'
  @Common.QuickInfo : 'Setup and teardown time'
  SetupAndTeardownTime : Decimal(5, 2) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductionSchedulingProfile'
  @Common.IsUpperCase : true
  @Common.Label : 'Production Scheduling Profile'
  ProductionSchedulingProfile : String(6) not null;
  @Common.Label : 'Interoperation'
  @Common.Heading : 'Interop'
  @Common.QuickInfo : 'Interoperation time'
  TransitionTime : Decimal(5, 2) not null;
  @Common.Label : 'Processing time'
  @Common.Heading : 'PrTime'
  ProcessingTimeInDays : Decimal(5, 2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Prodn Supervisor'
  @Common.Heading : 'ProdS'
  @Common.QuickInfo : 'Production Supervisor'
  ProductionSupervisor : String(3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Production unit'
  @Common.Heading : 'PUn'
  ProductProductionQuantityUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Prod. unit (ISO)'
  @Common.Heading : 'PUnI'
  @Common.QuickInfo : 'Production Unit in ISO Code'
  ProdProductionQuantityISOUnit : String(3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductPlant : Association to one OP_PRODUCT_0001.ProductPlant on _ProductPlant.Plant = Plant;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Procurement'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: PurchaseOrderQuantityISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: VarblPurOrdUnitStatus,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: PurchasingAcknProfile,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductProcurement {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Common.IsUnit : true
  @Common.Label : 'Order Unit'
  @Common.Heading : 'OUn'
  @Common.QuickInfo : 'Purchase Order Unit of Measure'
  PurchaseOrderQuantityUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Order unit in ISO'
  @Common.Heading : 'OUI'
  @Common.QuickInfo : 'Order unit in ISO code'
  PurchaseOrderQuantityISOUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Var. Order Unit'
  @Common.Heading : 'V'
  @Common.QuickInfo : 'Variable Purchase Order Unit Active'
  VarblPurOrdUnitStatus : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Purchasing value key'
  @Common.Heading : 'PV key'
  @Common.QuickInfo : 'Purchasing Value Key'
  PurchasingAcknProfile : String(4) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Quality Management'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: QltyMgmtInProcmtIsActive,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: CatalogProfile,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductQualityManagement {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'QM in Procur. Active'
  @Common.Heading : 'QM'
  @Common.QuickInfo : 'QM in Procurement Is Active'
  QltyMgmtInProcmtIsActive : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Catalog Profile'
  @Common.Heading : 'Cat.Prof.'
  CatalogProfile : String(9) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Sales'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: SalesStatus,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: TransportationGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: PackagingProductType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: AllowedPackagingWeightQty,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: AllowedPackagingWeightQtyUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: AllwdPackagingWeightQtyISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: AllowedPackagingVolumeQty,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: AllowedPackagingVolumeQtyUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: AllwdPackagingVolumeQtyISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: PackggProductIsClosedPackaging,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductSales {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'X-distr.chain status'
  @Common.Heading : 'St'
  @Common.QuickInfo : 'Cross-distribution-chain material status'
  SalesStatus : String(2) not null;
  @Common.Label : 'Cross-Distr. Chain Product Validity'
  @Common.Heading : 'Valid from'
  @Common.QuickInfo : 'Date from which the X-distr.-chain Product status is valid'
  SalesStatusValidityDate : Date;
  @Common.IsUpperCase : true
  @Common.Label : 'Transportation Group'
  @Common.Heading : 'TGroup'
  TransportationGroup : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Packaging Material Type'
  PackagingProductType : String(4) not null;
  @Measures.Unit : AllowedPackagingWeightQtyUnit
  @Measures.UNECEUnit : AllwdPackagingWeightQtyISOUnit
  @Common.Label : 'Allowed Pkg wt'
  @Common.Heading : 'AllowedWeight'
  @Common.QuickInfo : 'Allowed packaging weight'
  AllowedPackagingWeightQty : Decimal(13, 3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Allowed Packaging Unit of Weight'
  @Common.Heading : 'Un.'
  @Common.QuickInfo : 'Unit of weight (allowed packaging weight)'
  AllowedPackagingWeightQtyUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'ISO Code'
  @Common.Heading : 'ISO'
  @Common.QuickInfo : 'ISO Code for Unit of Measurement'
  AllwdPackagingWeightQtyISOUnit : String(3) not null;
  @Measures.Unit : AllowedPackagingVolumeQtyUnit
  @Measures.UNECEUnit : AllwdPackagingVolumeQtyISOUnit
  @Common.Label : 'Allowed Volume'
  @Common.Heading : 'Allowed vol.'
  @Common.QuickInfo : 'Allowed packaging volume'
  AllowedPackagingVolumeQty : Decimal(13, 3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Allowed Packaging Unit of Volume'
  @Common.Heading : 'VUn'
  @Common.QuickInfo : 'Volume unit (allowed packaging volume)'
  AllowedPackagingVolumeQtyUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'ISO Code'
  @Common.Heading : 'ISO'
  @Common.QuickInfo : 'ISO Code for Unit of Measurement'
  AllwdPackagingVolumeQtyISOUnit : String(3) not null;
  @Common.Label : 'Maximum level'
  @Common.Heading : 'MxL'
  @Common.QuickInfo : 'Maximum level (by volume)'
  MaximumLevelByVolumeInPercent : Decimal(precision: 3) not null;
  @Common.Label : 'Excess Weight Tolerance'
  @Common.QuickInfo : 'Excess Weight Tolerance for Handling unit'
  ExcessWeightToleranceValue : Decimal(3, 1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Closed'
  @Common.Heading : 'C'
  @Common.QuickInfo : 'Packaging Material is Closed Packaging'
  PackggProductIsClosedPackaging : Boolean not null;
  @Common.Label : 'Stackability factor'
  @Common.Heading : 'StFtr'
  @Common.QuickInfo : 'Stacking factor'
  ProductStackingFactor : Integer not null;
  @Common.Label : 'Excess Volume Tolerance'
  @Common.QuickInfo : 'Excess Volume Tolerance of the Handling Unit'
  ProdExcessVolumeToleranceValue : Decimal(3, 1) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Sales Delivery'
@Capabilities.NavigationRestrictions.RestrictedProperties : [
  {
    NavigationProperty: _ProdSalesDeliverySalesTax,
    InsertRestrictions: { Insertable: true }
  }
]
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: ProductSalesOrg,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductDistributionChnl,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MinimumOrderQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: SupplyingPlant,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: PriceSpecificationProductGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: AccountDetnProductGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: DeliveryNoteProcMinDelivQty,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ItemCategoryGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: DeliveryQuantityUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: DeliveryQuantityISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: DeliveryQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductSalesStatus,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: SalesMeasureISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: IsMarkedForDeletion,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: FirstSalesSpecProductGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: SecondSalesSpecProductGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ThirdSalesSpecProductGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: FourthSalesSpecProductGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: FifthSalesSpecProductGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: LogisticsStatisticsGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: VolumeRebateGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: CashDiscountIsDeductible,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: RoundingProfile,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: VariableSalesUnitIsNotAllowed,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductCommissionGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductHasAttributeID01,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductHasAttributeID02,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductHasAttributeID03,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductHasAttributeID04,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductHasAttributeID05,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductHasAttributeID06,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductHasAttributeID07,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductHasAttributeID08,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductHasAttributeID09,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductHasAttributeID10,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProdIsEntlmntRlvt,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductHierarchy,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductSalesDelivery {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Common.FieldControl : #Mandatory
  @Common.IsUpperCase : true
  @Common.Label : 'Sales Organization'
  @Common.Heading : 'SOrg.'
  key ProductSalesOrg : String(4) not null;
  @Common.FieldControl : #Mandatory
  @Common.IsUpperCase : true
  @Common.Label : 'Distribution Channel'
  @Common.Heading : 'DChl'
  key ProductDistributionChnl : String(2) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Minimum order qty'
  @Common.Heading : 'Min.order qty'
  @Common.QuickInfo : 'Minimum order quantity in base unit of measure'
  MinimumOrderQuantity : Decimal(13, 3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Delivering Plant'
  @Common.Heading : 'Plnt'
  SupplyingPlant : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'MaterialPricingGroup'
  @Common.IsUpperCase : true
  @Common.Label : 'Product Price Group'
  @Common.Heading : 'PPG'
  @Common.QuickInfo : 'Product Pricing Group'
  PriceSpecificationProductGroup : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Acct Assmt Grp Mat.'
  @Common.Heading : 'AAGM'
  @Common.QuickInfo : 'Account Assignment Group for Material'
  AccountDetnProductGroup : String(2) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Minimum Delivery Qty'
  @Common.Heading : 'Min. Dely Qty'
  @Common.QuickInfo : 'Minimum Delivery Quantity in Delivery Note Processing'
  DeliveryNoteProcMinDelivQty : Decimal(13, 3) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductItemCategoryGroup'
  @Common.IsUpperCase : true
  @Common.Label : 'Item Category Group'
  @Common.Heading : 'ItCGr'
  @Common.QuickInfo : 'Item Category Group from Material Master'
  ItemCategoryGroup : String(4) not null;
  @Common.IsUnit : true
  @Common.Label : 'Unit of measure'
  @Common.Heading : 'Unit'
  @Common.QuickInfo : 'Unit of measure of delivery unit'
  DeliveryQuantityUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'ISO Code'
  @Common.Heading : 'ISO'
  @Common.QuickInfo : 'ISO Code for Unit of Measurement'
  DeliveryQuantityISOUnit : String(3) not null;
  @Measures.Unit : DeliveryQuantityUnit
  @Measures.UNECEUnit : DeliveryQuantityISOUnit
  @Common.Label : 'Delivery unit'
  DeliveryQuantity : Decimal(13, 3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'DChain-spec. status'
  @Common.Heading : 'St'
  @Common.QuickInfo : 'Distribution-chain-specific material status'
  ProductSalesStatus : String(2) not null;
  @Common.Label : 'Valid from'
  @Common.Heading : 'ValidFrom'
  @Common.QuickInfo : 'Date from which distr.-chain-spec. material status is valid'
  ProductSalesStatusValidityDate : Date;
  @Common.IsUnit : true
  @Common.Label : 'Sales Unit'
  @Common.Heading : 'SU'
  SalesMeasureUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'ISO Code'
  @Common.Heading : 'ISO'
  @Common.QuickInfo : 'ISO Code for Unit of Measurement'
  SalesMeasureISOUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'DF distr. chain lvl'
  @Common.Heading : 'DCh'
  @Common.QuickInfo : 'Ind.: Flag material for deletion at distribution chain level'
  IsMarkedForDeletion : Boolean not null;
  @Common.SAPObjectNodeTypeReference : 'AdditionalProductGroup1'
  @Common.IsUpperCase : true
  @Common.Label : 'Product Group 1'
  @Common.Heading : 'PG 1'
  FirstSalesSpecProductGroup : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'AdditionalProductGroup2'
  @Common.IsUpperCase : true
  @Common.Label : 'Product Group 2'
  @Common.Heading : 'PG 2'
  SecondSalesSpecProductGroup : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'AdditionalProductGroup3'
  @Common.IsUpperCase : true
  @Common.Label : 'Product Group 3'
  @Common.Heading : 'PG 3'
  ThirdSalesSpecProductGroup : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'AdditionalProductGroup4'
  @Common.IsUpperCase : true
  @Common.Label : 'Product Group 4'
  @Common.Heading : 'PG 4'
  FourthSalesSpecProductGroup : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'AdditionalProductGroup5'
  @Common.IsUpperCase : true
  @Common.Label : 'Product Group 5'
  @Common.Heading : 'PG 5'
  FifthSalesSpecProductGroup : String(3) not null;
  @Common.SAPObjectNodeTypeReference : 'MaterialStatisticsGroup'
  @Common.IsUpperCase : true
  @Common.Label : 'Matl statistics grp'
  @Common.Heading : 'Material statistics group'
  @Common.QuickInfo : 'Material statistics group'
  LogisticsStatisticsGroup : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Volume Rebate Group'
  @Common.Heading : 'VRG'
  @Common.QuickInfo : 'Volume rebate group'
  VolumeRebateGroup : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Cash Discount'
  @Common.Heading : 'CDc'
  @Common.QuickInfo : 'Cash Discount Indicator'
  CashDiscountIsDeductible : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Rounding Profile'
  @Common.Heading : 'R. Profile'
  RoundingProfile : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Sales unit not var.'
  @Common.Heading : 'S'
  @Common.QuickInfo : 'Variable Sales Unit Not Allowed'
  VariableSalesUnitIsNotAllowed : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Commission Group'
  @Common.Heading : 'Com'
  ProductCommissionGroup : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Pricing Ref. Matl'
  @Common.QuickInfo : 'Pricing Reference Material'
  PricingReferenceProduct : String(40) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Product Attribute 1'
  @Common.QuickInfo : 'ID for product attribute 1'
  ProductHasAttributeID01 : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Product Attribute 2'
  @Common.QuickInfo : 'ID for product attribute 2'
  ProductHasAttributeID02 : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Product Attribute 3'
  @Common.QuickInfo : 'ID for product attribute 3'
  ProductHasAttributeID03 : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Product Attribute 4'
  @Common.QuickInfo : 'ID for product attribute 4'
  ProductHasAttributeID04 : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Product Attribute 5'
  @Common.QuickInfo : 'ID for product attribute 5'
  ProductHasAttributeID05 : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Product Attribute 6'
  @Common.QuickInfo : 'ID for product attribute 6'
  ProductHasAttributeID06 : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Product Attribute 7'
  @Common.QuickInfo : 'ID for product attribute 7'
  ProductHasAttributeID07 : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Product Attribute 8'
  @Common.QuickInfo : 'ID for product attribute 8'
  ProductHasAttributeID08 : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Product Attribute 9'
  @Common.QuickInfo : 'ID for product attribute 9'
  ProductHasAttributeID09 : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Product Attribute 10'
  @Common.QuickInfo : 'ID for product attribute 10'
  ProductHasAttributeID10 : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Rel. Entitlement Gen'
  @Common.QuickInfo : 'Relevant for Entitlement Generation'
  ProdIsEntlmntRlvt : Boolean not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Product Hierarchy'
  ProductHierarchy : String(18) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'ISO Code'
  @Common.Heading : 'ISO'
  @Common.QuickInfo : 'ISO Code for Unit of Measurement'
  BaseISOUnit : String(3) not null;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProdSalesDeliverySalesTax : Composition of many OP_PRODUCT_0001.ProdSalesDeliverySalesTax;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Storage'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: StorageConditions,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProdTemperatureConditionCode,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: HazardousProduct,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: NmbrOfGROrGISlipsToPrintQty,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: LabelType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: LabelForm,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductExpirationDateType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: StorageBinInstruction,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ShelfLifeExpirationDatePeriod,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ShelfLifeExprtnDateRndngRule,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductStorage {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Storage conditions'
  @Common.Heading : 'SC'
  StorageConditions : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Temp. conditions'
  @Common.Heading : 'Temp'
  @Common.QuickInfo : 'Temperature conditions indicator'
  ProdTemperatureConditionCode : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Haz. material number'
  @Common.Heading : 'Haz. material no.'
  @Common.QuickInfo : 'Hazardous material number'
  HazardousProduct : String(40) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'GR slips quantity'
  @Common.Heading : 'Number of GR slips'
  @Common.QuickInfo : 'Quantity: Number of GR/GI slips to be printed'
  NmbrOfGROrGISlipsToPrintQty : Decimal(13, 3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Label type'
  @Common.Heading : 'LT'
  LabelType : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Label form'
  @Common.Heading : 'LF'
  LabelForm : String(2) not null;
  @Common.Label : 'Min. Rem. Shelf Life'
  @Common.Heading : 'RShLi'
  @Common.QuickInfo : 'Minimum Remaining Shelf Life'
  MinRemainingShelfLife : Decimal(precision: 4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Expiration Date'
  ProductExpirationDateType : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Container reqmts'
  @Common.Heading : 'CR'
  @Common.QuickInfo : 'Container requirements'
  StorageBinInstruction : String(2) not null;
  @Common.SAPObjectNodeTypeReference : 'ShelfLifeExpirationDatePeriod'
  @Common.IsUpperCase : true
  @Common.Label : 'Period Ind. for SLED'
  @Common.Heading : 'Per. Ind.'
  @Common.QuickInfo : 'Period Indicator for Shelf Life Expiration Date'
  ShelfLifeExpirationDatePeriod : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Rounding rule SLED'
  @Common.Heading : 'Round.rule'
  @Common.QuickInfo : 'Rounding rule for calculation of SLED'
  ShelfLifeExprtnDateRndngRule : String(1) not null;
  @Common.Label : 'Storage percentage'
  @Common.Heading : 'Stge%'
  TotalShelfLifeStoragePercent : Decimal(precision: 3) not null;
  @Common.Label : 'Total shelf life'
  @Common.Heading : 'SLife'
  TotalShelfLife : Decimal(precision: 4) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Unit of Measure'
@Capabilities.NavigationRestrictions.RestrictedProperties : [
  {
    NavigationProperty: _ProductUnitOfMeasureEAN,
    InsertRestrictions: { Insertable: true }
  }
]
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: QuantityNumerator,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: QuantityDenominator,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductVolume,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: VolumeUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: VolumeISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: GrossWeight,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: WeightUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: WeightISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: GlobalTradeItemNumberCategory,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: UnitSpecificProductLength,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: UnitSpecificProductWidth,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: UnitSpecificProductHeight,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductMeasurementUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductMeasurementISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: LowerLevelPackagingISOUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductUnitOfMeasure {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Common.IsUnit : true
  @Common.FieldControl : #Mandatory
  @Common.Label : 'AlternativeUnit'
  @Common.Heading : 'AUn'
  @Common.QuickInfo : 'Alternative Unit of Measure for Stockkeeping Unit'
  key AlternativeUnit : String(3) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Units / Quantity - Base Unit of Measure'
  @Common.QuickInfo : 'Numerator for Conversion to Base Units of Measure'
  QuantityNumerator : Decimal(precision: 5) not null;
  @Measures.Unit : AlternativeUnit
  @Common.Label : 'Units / Quantity - Alt Unit of Measure'
  @Common.Heading : 'Units / Quantity - Alternate Unit of Measure'
  @Common.QuickInfo : 'Denominator for conversion to base units of measure'
  QuantityDenominator : Decimal(precision: 5) not null;
  @Measures.Unit : VolumeUnit
  @Measures.UNECEUnit : VolumeISOUnit
  @Common.Label : 'Volume'
  ProductVolume : Decimal(13, 3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Volume Unit'
  @Common.Heading : 'VUn'
  VolumeUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Volume unit ISO'
  @Common.Heading : 'VUI'
  @Common.QuickInfo : 'Volume unit in ISO code'
  VolumeISOUnit : String(3) not null;
  @Measures.Unit : WeightUnit
  @Measures.UNECEUnit : WeightISOUnit
  @Common.Label : 'Gross Weight'
  GrossWeight : Decimal(13, 3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Unit of Weight'
  @Common.Heading : 'WUn'
  WeightUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Unit of weight ISO'
  @Common.Heading : 'WUn'
  @Common.QuickInfo : 'Unit of weight in ISO code'
  WeightISOUnit : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'EAN/UPC'
  @Common.QuickInfo : 'International Article Number (EAN/UPC)'
  GlobalTradeItemNumber : String(18) not null;
  @Common.SAPObjectNodeTypeReference : 'GlobalTradeItemNumberCategory'
  @Common.IsUpperCase : true
  @Common.Label : 'GTIN Category'
  @Common.Heading : 'Ct'
  @Common.QuickInfo : 'Category of Global Trade Item Number (GTIN)'
  GlobalTradeItemNumberCategory : String(2) not null;
  @Measures.Unit : ProductMeasurementUnit
  @Measures.UNECEUnit : ProductMeasurementISOUnit
  @Common.Label : 'Length'
  UnitSpecificProductLength : Decimal(13, 3) not null;
  @Measures.Unit : ProductMeasurementUnit
  @Measures.UNECEUnit : ProductMeasurementISOUnit
  @Common.Label : 'Width'
  UnitSpecificProductWidth : Decimal(13, 3) not null;
  @Measures.Unit : ProductMeasurementUnit
  @Measures.UNECEUnit : ProductMeasurementISOUnit
  @Common.Label : 'Height'
  UnitSpecificProductHeight : Decimal(13, 3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Unit of Dimension'
  @Common.QuickInfo : 'Unit of Dimension for Length/Width/Height'
  ProductMeasurementUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Dimension unit ISO'
  @Common.Heading : 'DUI'
  @Common.QuickInfo : 'Unit for length/breadth/height in ISO code'
  ProductMeasurementISOUnit : String(3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Lower-level unit'
  @Common.Heading : 'LUn'
  @Common.QuickInfo : 'Lower-Level Unit of Measure in a Packing Hierarchy'
  LowerLevelPackagingUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Lower-level unit ISO'
  @Common.Heading : 'LUnI'
  @Common.QuickInfo : 'Lower-Level Unit of Measure in ISO Code'
  LowerLevelPackagingISOUnit : String(3) not null;
  @odata.Type : 'Edm.Byte'
  @Common.Label : 'Max. Stacking Factor'
  @Common.Heading : 'Max. Stack'
  @Common.QuickInfo : 'Maximum Stacking Factor'
  MaximumStackingFactor : Integer not null;
  @Common.Label : 'Capacity Usage'
  CapacityUsage : Decimal(15, 3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductUnitOfMeasureEAN : Composition of many OP_PRODUCT_0001.ProductUnitOfMeasureEAN;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Unit of Measure EAN'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: ConsecutiveNumber,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InternationalArticleNumberCat,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: IsMainGlobalTradeItemNumber,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductUnitOfMeasureEAN {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Material'
  @Common.QuickInfo : 'Material Number'
  key Product : String(40) not null;
  @Common.IsUnit : true
  @Core.Computed : true
  @Common.Label : 'Display Unit/Measure'
  @Common.Heading : 'UM'
  @Common.QuickInfo : 'Unit of Measure for Display'
  key AlternativeUnit : String(3) not null;
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Consecutive number'
  @Common.Heading : 'ConNo'
  @Common.QuickInfo : 'Consecutive Number'
  key ConsecutiveNumber : String(5) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'EAN/UPC'
  @Common.QuickInfo : 'International Article Number (EAN/UPC)'
  ProductStandardID : String(18) not null;
  @Common.SAPObjectNodeTypeReference : 'GlobalTradeItemNumberCategory'
  @Common.IsUpperCase : true
  @Common.Label : 'GTIN Category'
  @Common.Heading : 'Ct'
  @Common.QuickInfo : 'Category of Global Trade Item Number (GTIN)'
  InternationalArticleNumberCat : String(2) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Main EAN'
  @Common.Heading : 'M'
  @Common.QuickInfo : 'Indicator: Main EAN'
  IsMainGlobalTradeItemNumber : Boolean not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductUnitOfMeasure : Association to one OP_PRODUCT_0001.ProductUnitOfMeasure on _ProductUnitOfMeasure.AlternativeUnit = AlternativeUnit;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Valuation'
@Capabilities.NavigationRestrictions.RestrictedProperties : [
  {
    NavigationProperty: _ProductValuationAccounting,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductValuationCosting,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductValuationLedgerAccount,
    InsertRestrictions: { Insertable: true }
  },
  {
    NavigationProperty: _ProductValuationLedgerPrices,
    InsertRestrictions: { Insertable: true }
  }
]
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: ValuationArea,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ValuationType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ValuationClass,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: PriceDeterminationControl,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: StandardPrice,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductPriceUnitQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: InventoryValuationProcedure,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MovingAveragePrice,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ValuationCategory,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductUsageType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductOriginType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: IsProducedInhouse,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: IsMarkedForDeletion,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ValuationClassSalesOrderStock,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProjectStockValuationClass,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductValuation {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Common.FieldControl : #Mandatory
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Area'
  @Common.Heading : 'ValA'
  key ValuationArea : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductValuationType'
  @Core.Immutable : true
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Type'
  @Common.Heading : 'Val. Type'
  key ValuationType : String(10) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductValuationClass'
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Class'
  @Common.Heading : 'ValCl'
  ValuationClass : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'PriceDeterminationControl'
  @Common.IsUpperCase : true
  @Common.Label : 'Price Determ.'
  @Common.Heading : 'Price Determination'
  @Common.QuickInfo : 'Material Price Determination: Control'
  PriceDeterminationControl : String(1) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Standard price'
  StandardPrice : Decimal(11, variable) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Price unit'
  @Common.Heading : 'per'
  ProductPriceUnitQuantity : Decimal(precision: 5) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductPriceControl'
  @Common.IsUpperCase : true
  @Common.Label : 'Price Control'
  @Common.Heading : 'Pr.'
  InventoryValuationProcedure : String(1) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Moving price'
  @Common.Heading : 'MovAvgPrice'
  @Common.QuickInfo : 'Moving Average Price/Periodic Unit Price'
  MovingAveragePrice : Decimal(11, variable) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductValuationCategory'
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Category'
  @Common.Heading : 'ValCat'
  ValuationCategory : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Product Usage'
  @Common.Heading : 'U'
  @Common.QuickInfo : 'Usage of the Product'
  ProductUsageType : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Product Origin'
  @Common.Heading : 'O'
  @Common.QuickInfo : 'Origin of the Product'
  ProductOriginType : String(1) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Produced in-house'
  @Common.Heading : 'P'
  IsProducedInhouse : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Del. flag val. type'
  @Common.Heading : 'VTy'
  @Common.QuickInfo : 'Deletion flag for all material data of a valuation type'
  IsMarkedForDeletion : Boolean not null;
  @Common.SAPObjectNodeTypeReference : 'ProductValuationClass'
  @Common.IsUpperCase : true
  @Common.Label : 'VC: Sales order stk'
  @Common.Heading : 'VCl S'
  @Common.QuickInfo : 'Valuation Class for Sales Order Stock'
  ValuationClassSalesOrderStock : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductValuationClass'
  @Common.IsUpperCase : true
  @Common.Label : 'Proj. stk val. class'
  @Common.Heading : 'VCl P'
  @Common.QuickInfo : 'Valuation Class for Project Stock'
  ProjectStockValuationClass : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'Currency'
  @Common.IsCurrency : true
  @Common.IsUpperCase : true
  @Common.Label : 'Currency'
  @Common.Heading : 'Crcy'
  @Common.QuickInfo : 'Currency Key'
  Currency : String(3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductValuationAccounting : Composition of one OP_PRODUCT_0001.ProductValuationAccounting;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductValuationCosting : Composition of one OP_PRODUCT_0001.ProductValuationCosting;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductValuationLedgerAccount : Composition of many OP_PRODUCT_0001.ProductValuationLedgerAccount;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _ProductValuationLedgerPrices : Composition of many OP_PRODUCT_0001.ProductValuationLedgerPrices;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Valuation Accounting'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: ValuationArea,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ValuationType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: CommercialPrice1InCoCodeCrcy,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: CommercialPrice2InCoCodeCrcy,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: CommercialPrice3InCoCodeCrcy,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: FuturePrice,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: LIFOValuationPoolNumber,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: TaxPricel1InCoCodeCrcy,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: TaxPrice2InCoCodeCrcy,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: TaxPrice3InCoCodeCrcy,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: TaxBasedPricesPriceUnitQty,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: IsLIFOAndFIFORelevant,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductValuationAccounting {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Area'
  @Common.Heading : 'ValA'
  key ValuationArea : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductValuationType'
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Type'
  @Common.Heading : 'Val. Type'
  key ValuationType : String(10) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Commercial price 1'
  @Common.Heading : 'Comm. pr. 1'
  @Common.QuickInfo : 'Valuation price based on commercial law: level 1'
  CommercialPrice1InCoCodeCrcy : Decimal(11, variable) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Commercial price 2'
  @Common.Heading : 'Comm. pr. 2'
  @Common.QuickInfo : 'Valuation price based on commercial law: level 2'
  CommercialPrice2InCoCodeCrcy : Decimal(11, variable) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Commercial price 3'
  @Common.Heading : 'Coml pr. 3'
  @Common.QuickInfo : 'Valuation price based on commercial law: level 3'
  CommercialPrice3InCoCodeCrcy : Decimal(11, variable) not null;
  @Common.IsDigitSequence : true
  @Common.Label : 'Devaluation Ind.'
  @Common.Heading : 'DevIn'
  @Common.QuickInfo : 'Lowest value: devaluation indicator'
  DevaluationYearCount : String(2) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Future Price'
  FuturePrice : Decimal(11, variable) not null;
  @Common.Label : 'Valid from'
  @Common.Heading : 'Valid fm'
  @Common.QuickInfo : 'Date as of which the price is valid'
  FuturePriceValidityStartDate : Date;
  @Common.IsUpperCase : true
  @Common.Label : 'LIFO Pool'
  @Common.Heading : 'Pool'
  @Common.QuickInfo : 'Pool number for LIFO valuation'
  LIFOValuationPoolNumber : String(4) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Tax price 1'
  @Common.QuickInfo : 'Valuation price based on tax law: level 1'
  TaxPricel1InCoCodeCrcy : Decimal(11, variable) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Tax price 2'
  @Common.QuickInfo : 'Valuation price based on tax law: level 2'
  TaxPrice2InCoCodeCrcy : Decimal(11, variable) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Tax price 3'
  @Common.QuickInfo : 'Valuation price based on tax law: level 3'
  TaxPrice3InCoCodeCrcy : Decimal(11, variable) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Price Unit'
  @Common.Heading : 'PrUnit'
  @Common.QuickInfo : 'Price unit for valuation prices based on tax/commercial law'
  TaxBasedPricesPriceUnitQty : Decimal(precision: 5) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'TRUE'
  @Common.QuickInfo : 'Data element for domain BOOLE: TRUE (=''X'') and FALSE (='' '')'
  IsLIFOAndFIFORelevant : Boolean not null;
  @Common.SAPObjectNodeTypeReference : 'Currency'
  @Common.IsCurrency : true
  @Common.IsUpperCase : true
  @Common.Label : 'Currency'
  @Common.Heading : 'Crcy'
  @Common.QuickInfo : 'Currency Key'
  Currency : String(3) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductValuation : Association to one OP_PRODUCT_0001.ProductValuation on _ProductValuation.ValuationType = ValuationType;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Valuation Costing'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: ValuationArea,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ValuationType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductIsCostedWithQtyStruc,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: IsMaterialRelatedOrigin,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: CostOriginGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: CostingOverheadGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: PlannedPrice1InCoCodeCrcy,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: PlannedPrice2InCoCodeCrcy,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: PlannedPrice3InCoCodeCrcy,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductValuationCosting {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Area'
  @Common.Heading : 'ValA'
  key ValuationArea : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductValuationType'
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Type'
  @Common.Heading : 'Val. Type'
  key ValuationType : String(10) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'With Qty Structure'
  @Common.Heading : 'Cost Est. with Qty Structure'
  @Common.QuickInfo : 'Material Is Costed with Quantity Structure'
  ProductIsCostedWithQtyStruc : Boolean not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Material origin'
  @Common.Heading : 'MO'
  @Common.QuickInfo : 'Material-related origin'
  IsMaterialRelatedOrigin : Boolean not null;
  @Common.SAPObjectNodeTypeReference : 'CostOriginGroup'
  @Common.IsUpperCase : true
  @Common.Label : 'Origin Group'
  @Common.Heading : 'OrGp'
  @Common.QuickInfo : 'Origin Group as Subdivision of Cost Element'
  CostOriginGroup : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Overhead Group'
  @Common.Heading : 'Ovrhd Grp'
  @Common.QuickInfo : 'Costing Overhead Group'
  CostingOverheadGroup : String(10) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Planned price 1'
  @Common.Heading : 'PlanPrice 1'
  @Common.QuickInfo : 'Future Planned Price 1'
  PlannedPrice1InCoCodeCrcy : Decimal(11, variable) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Planned price 2'
  @Common.Heading : 'PlanPrice 2'
  @Common.QuickInfo : 'Future Planned Price 2'
  PlannedPrice2InCoCodeCrcy : Decimal(11, variable) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Planned price 3'
  @Common.Heading : 'PlanPrice 3'
  @Common.QuickInfo : 'Future Planned Price 3'
  PlannedPrice3InCoCodeCrcy : Decimal(11, variable) not null;
  @Common.Label : 'Planned price date 1'
  @Common.Heading : 'PP date 1'
  @Common.QuickInfo : 'Date from Which Future Planned Price 1 Is Valid'
  FuturePlndPrice1ValdtyDate : Date;
  @Common.Label : 'Planned price date 2'
  @Common.Heading : 'PP date 2'
  @Common.QuickInfo : 'Date from Which Future Planned Price 2 Is Valid'
  FuturePlndPrice2ValdtyDate : Date;
  @Common.Label : 'Planned price date 3'
  @Common.Heading : 'PP date 3'
  @Common.QuickInfo : 'Date from Which Future Planned Price 3 Is Valid'
  FuturePlndPrice3ValdtyDate : Date;
  @Common.SAPObjectNodeTypeReference : 'Currency'
  @Common.IsCurrency : true
  @Common.IsUpperCase : true
  @Common.Label : 'Currency'
  @Common.Heading : 'Crcy'
  @Common.QuickInfo : 'Currency Key'
  Currency : String(3) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductValuation : Association to one OP_PRODUCT_0001.ProductValuation on _ProductValuation.ValuationType = ValuationType;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Valuation Ledger Account'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: ValuationArea,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ValuationType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductPriceControl,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductPriceUnitQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MovingAveragePrice,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: StandardPrice,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductValuationLedgerAccount {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Area'
  @Common.Heading : 'ValA'
  key ValuationArea : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductValuationType'
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Type'
  @Common.Heading : 'Val. Type'
  key ValuationType : String(10) not null;
  @Common.SAPObjectNodeTypeReference : 'CurrencyRole'
  @Common.FieldControl : #Mandatory
  @Common.Label : 'Crcy Type/Valn View'
  @Common.Heading : 'CrcyTy./ValView'
  @Common.QuickInfo : 'External Currency Type and Valuation View'
  key CurrencyRole : String(2) not null;
  @Common.FieldControl : #Mandatory
  key Ledger : String(2) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductPriceControl'
  @Common.IsUpperCase : true
  @Common.Label : 'Price control'
  @Common.Heading : 'Pr.'
  @Common.QuickInfo : 'Price control indicator'
  ProductPriceControl : String(1) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Price Unit'
  @Common.Heading : 'Per'
  ProductPriceUnitQuantity : Decimal(precision: 5) not null;
  @Common.SAPObjectNodeTypeReference : 'Currency'
  @Common.IsCurrency : true
  @Common.IsUpperCase : true
  @Common.Label : 'Currency'
  @Common.Heading : 'Crcy'
  @Common.QuickInfo : 'Currency Key'
  Currency : String(3) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Per. Unit Price'
  @Common.Heading : 'Per.Unit Price'
  @Common.QuickInfo : 'Periodic Unit Price'
  MovingAveragePrice : Decimal(11, variable) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Standard Price'
  StandardPrice : Decimal(11, variable) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductValuation : Association to one OP_PRODUCT_0001.ProductValuation on _ProductValuation.ValuationType = ValuationType;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Product Valuation Ledger Prices'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Core.OptimisticConcurrency : [ '_Product/LastChangeDateTime' ]
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: ValuationArea,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ValuationType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ProductPriceUnitQuantity,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: FuturePrice,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseUnit,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: BaseISOUnit,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_PRODUCT_0001.ProductValuationLedgerPrices {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  key Product : String(40) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Area'
  @Common.Heading : 'ValA'
  key ValuationArea : String(4) not null;
  @Common.SAPObjectNodeTypeReference : 'ProductValuationType'
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation Type'
  @Common.Heading : 'Val. Type'
  key ValuationType : String(10) not null;
  @Common.SAPObjectNodeTypeReference : 'CurrencyRole'
  @Common.FieldControl : #Mandatory
  @Common.Label : 'Crcy Type/Valn View'
  @Common.Heading : 'CrcyTy./ValView'
  @Common.QuickInfo : 'External Currency Type and Valuation View'
  key CurrencyRole : String(2) not null;
  @Common.FieldControl : #Mandatory
  key Ledger : String(2) not null;
  @Measures.Unit : BaseUnit
  @Measures.UNECEUnit : BaseISOUnit
  @Common.Label : 'Price Unit'
  @Common.Heading : 'Per'
  ProductPriceUnitQuantity : Decimal(precision: 5) not null;
  @Common.SAPObjectNodeTypeReference : 'Currency'
  @Common.IsCurrency : true
  @Common.IsUpperCase : true
  @Common.Label : 'Currency'
  @Common.Heading : 'Crcy'
  @Common.QuickInfo : 'Currency Key'
  Currency : String(3) not null;
  @Measures.ISOCurrency : Currency
  @Common.Label : 'Future Price'
  FuturePrice : Decimal(11, variable) not null;
  @Common.Label : 'Future Price From'
  @Common.Heading : 'Valid From'
  @Common.QuickInfo : 'Date from Which a Future Valuation Price Is to Be Valid'
  FuturePriceValidityStartDate : Date;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Base unit ISO code'
  @Common.Heading : 'BUI'
  @Common.QuickInfo : 'Base unit of measure in ISO code'
  BaseISOUnit : String(3) not null;
  @cds.ambiguous : 'missing on condition?'
  _Product : Association to one OP_PRODUCT_0001.Product on _Product.Product = Product;
  @cds.ambiguous : 'missing on condition?'
  _ProductValuation : Association to one OP_PRODUCT_0001.ProductValuation on _ProductValuation.ValuationType = ValuationType;
};


/* checksum : c2e7933dff4f2572c490847e279c1117 */
@cds.external : true
type OP_API_MEASURINGPOINT_0001.SAP__Message {
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
service OP_API_MEASURINGPOINT_0001 {};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Measuring Points'
@Common.Messages : SAP__Messages
@Capabilities.NavigationRestrictions.RestrictedProperties : [
  {
    NavigationProperty: _LongText,
    InsertRestrictions: { Insertable: true }
  }
]
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: MeasuringPointObjectIdentifier,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: TechnicalObjectType,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MeasuringPointPositionNumber,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MeasuringPointCategory,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MeasuringPointIsCounter,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MeasuringPointCodeGroup,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: ValuationCodeIsSufficient,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MeasuringPointIsInactive,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MsrgPtIsCountingBackwards,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MeasurementTransferIsSupported,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: FunctionalLocation,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: FunctionalLocationLabelName,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MsmtRdngTransferMode,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_API_MEASURINGPOINT_0001.MeasuringPoint {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Measuring point'
  @Common.Heading : 'MeasPoint'
  @Common.QuickInfo : 'Measuring Point'
  key MeasuringPoint : String(12) not null;
  @Common.Label : 'Description'
  @Common.Heading : 'Description of measuring point'
  @Common.QuickInfo : 'Description of Measuring Point'
  MeasuringPointDescription : String(40);
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'OBjNo.MeasPointObj.'
  @Common.QuickInfo : 'Object Number for the Measuring Point Object'
  MeasuringPointObjectIdentifier : String(22);
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Object Type'
  @Common.Heading : 'ObjectType'
  @Common.QuickInfo : 'Type of Technical Object'
  TechnicalObjectType : String(10);
  @Common.IsUpperCase : true
  @Common.Label : 'Measurement position'
  @Common.QuickInfo : 'Position Number of the Object Measuring Point (Sort Field)'
  MeasuringPointPositionNumber : String(20);
  @Common.FieldControl : #Mandatory
  @Common.IsUpperCase : true
  @Common.Label : 'MeasPointCategory'
  @Common.Heading : 'Cat'
  @Common.QuickInfo : 'Measuring Point Category'
  MeasuringPointCategory : String(1);
  @Core.Computed : true
  @Common.Label : 'Created on'
  @Common.Heading : 'Created'
  @Common.QuickInfo : 'Date on which the object was created'
  CreationDate : Date;
  @Core.Computed : true
  @Common.Label : 'Changed on'
  @Common.Heading : 'Changed'
  @Common.QuickInfo : 'Date on which the object was last changed'
  LastChangeDate : Date;
  @Common.IsUpperCase : true
  @Common.Label : 'MeasPoint is counter'
  @Common.Heading : 'C'
  @Common.QuickInfo : 'Indicator to Show that Measuring Point Is a Counter'
  MeasuringPointIsCounter : Boolean;
  @Common.IsDigitSequence : true
  @Common.Label : 'Characteristic Internal ID'
  MsrgPtInternalCharacteristic : String(10);
  @Common.IsUnit : true
  @Core.Computed : true
  @Common.Label : 'Internal UoM'
  @Common.Heading : 'MU'
  @Common.QuickInfo : 'Unit of Measurement'
  CharcValueUnit : String(3);
  @Common.Label : 'Decimal places'
  @Common.Heading : 'Dec'
  @Common.QuickInfo : 'Number of Decimal Places for Number Display'
  MeasuringPointDecimalPlaces : Integer;
  @Common.Label : 'FloatPointExp.'
  @Common.Heading : 'FPE'
  @Common.QuickInfo : 'Power of Ten Exponent for Floating Point Display'
  MeasuringPointExponent : Integer;
  @Common.IsUpperCase : true
  @Common.Label : 'Code group'
  @Common.Heading : 'CodeGrp'
  @Common.QuickInfo : 'Code Group - Measurement Reading Valuation Code'
  MeasuringPointCodeGroup : String(8);
  @Common.IsUpperCase : true
  @Common.Label : 'ValCode sufficient'
  @Common.Heading : 'C'
  @Common.QuickInfo : 'Indicator: Valuation Code Sufficient for Measurmnt. Document'
  ValuationCodeIsSufficient : Boolean;
  @Common.IsUpperCase : true
  @Common.Label : 'Assembly'
  @Common.QuickInfo : 'Assembly for Localization of Measuring Point'
  Assembly : String(40);
  @Common.IsUpperCase : true
  @Common.Label : 'MeasPoint inactive'
  @Common.Heading : 'I'
  @Common.QuickInfo : 'Indicator: Measuring Point Inactive'
  MeasuringPointIsInactive : Boolean;
  @Common.Label : 'Text'
  @Common.QuickInfo : 'Aditional Short Text for Measuring Point'
  MeasuringPointShortText : String(40);
  @Common.IsUnit : true
  @Common.Label : 'MeasurmntRangeUnit'
  @Common.Heading : 'MRU'
  @Common.QuickInfo : 'Measurement Range Unit'
  MeasurementRangeUnit : String(3);
  @Common.IsUnit : true
  @Core.Computed : true
  @Common.Label : 'SI unit'
  @Common.Heading : 'SI'
  MeasuringPointSIUnitOfMeasure : String(3);
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Reading trans. fr.'
  @Common.Heading : 'Read.cop.fr.'
  @Common.QuickInfo : 'Measuring Point from Which Meas. Reading Was Transferred'
  MsmtRdngSourceMeasuringPoint : String(12);
  @Common.Label : 'Target value'
  @Common.Heading : 'TargVal.'
  @Common.QuickInfo : 'Measuring Point Target Value'
  MeasuringPointTargetValue : Double;
  @Common.Label : 'Upper range limit'
  @Common.QuickInfo : 'Upper Measurement Range Limit/Maximum Total Counter Reading'
  MeasuringPointMaximumThreshold : Double;
  @Common.Label : 'Lower range limit'
  @Common.QuickInfo : 'Lower Measurement Range Limit/Minimum Total Counter Reading'
  MeasuringPointMinimumThreshold : Double;
  @Common.Label : 'Annual estimate'
  @Common.QuickInfo : 'Annual Estimate in SI Unit'
  MeasuringPointAnnualEstimate : Double;
  @Common.Label : 'CountOverflwReadg'
  @Common.QuickInfo : 'Counter Overflow Reading in SI Unit'
  CounterOverflowRdngThreshold : Double;
  @Common.IsUpperCase : true
  @Common.Label : 'Count backwards'
  @Common.Heading : 'B'
  @Common.QuickInfo : 'Indicator: Counter Runs Backwards'
  MsrgPtIsCountingBackwards : Boolean;
  @Common.IsUpperCase : true
  @Common.Label : 'Supported'
  @Common.Heading : 'V'
  @Common.QuickInfo : 'Indicator That Measurement Reading Transfer is Supported'
  MeasurementTransferIsSupported : Boolean;
  @Common.IsUpperCase : true
  @Common.Label : 'Functional location'
  FunctionalLocation : String(30);
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Functional Location'
  @Common.QuickInfo : 'Functional Location Label'
  FunctionalLocationLabelName : String(40);
  @Common.IsUpperCase : true
  @Common.Label : 'Equipment'
  @Common.QuickInfo : 'Equipment Number'
  Equipment : String(18);
  @Common.IsUpperCase : true
  @Common.Label : 'Transfer mode'
  @Common.Heading : 'M'
  @Common.QuickInfo : 'Mode of Counter Reading Transfer'
  MsmtRdngTransferMode : String(1);
  SAP__Messages : many OP_API_MEASURINGPOINT_0001.SAP__Message;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _LongText : Composition of one OP_API_MEASURINGPOINT_0001.MeasuringPointLongText;
} actions {
  action StartMsmtReadingTransfer(
    _it : $self not null,
    MsmtRdngIntervalStartDate : Date,
    MsmtRdngIntervalStartTime : Time not null,
    MsmtRdngIntervalEndDate : Date,
    MsmtRdngIntervalEndTime : Time not null,
    MsmtRdngSourceMeasuringPoint : String(12) not null,
    MsmtRdngTransferMode : String(1) not null
  ) returns OP_API_MEASURINGPOINT_0001.MeasuringPoint not null;
  action DeactivateMeasuringPoint(
    _it : $self not null
  ) returns OP_API_MEASURINGPOINT_0001.MeasuringPoint not null;
  action CancelMsmtReadingTransfer(
    _it : $self not null,
    MsmtRdngIntervalEndDate : Date,
    MsmtRdngIntervalEndTime : Time not null
  ) returns OP_API_MEASURINGPOINT_0001.MeasuringPoint not null;
  action ChangeMeasuringPointCategory(
    _it : $self not null,
    MeasuringPointCategory : String(1) not null
  ) returns OP_API_MEASURINGPOINT_0001.MeasuringPoint not null;
  action ActivateMeasuringPoint(
    _it : $self not null
  ) returns OP_API_MEASURINGPOINT_0001.MeasuringPoint not null;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Measuring Point Text'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.FilterRestrictions.Filterable : true
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: MeasuringPointLongText,
    AllowedExpressions: 'SearchExpression'
  }
]
@Capabilities.SortRestrictions.NonSortableProperties : [ 'MeasuringPointLongText' ]
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity OP_API_MEASURINGPOINT_0001.MeasuringPointLongText {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Measuring point'
  @Common.Heading : 'MeasPoint'
  @Common.QuickInfo : 'Measuring Point'
  key MeasuringPoint : String(12) not null;
  @Common.FieldControl : #Mandatory
  @Common.Label : 'Long Text'
  MeasuringPointLongText : LargeString not null;
  SAP__Messages : many OP_API_MEASURINGPOINT_0001.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _MeasuringPoint : Association to one OP_API_MEASURINGPOINT_0001.MeasuringPoint on _MeasuringPoint.MeasuringPoint = MeasuringPoint;
};


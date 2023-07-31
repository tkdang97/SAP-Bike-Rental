/* checksum : 6ed9da067806a6771ed762f59a557d82 */
@cds.external : true
type MEASUREMENTDOCUMENT_0001.SAP__Message {
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
@Capabilities.KeyAsSegmentSupported : true
@Capabilities.AsynchronousRequestsSupported : true
service MEASUREMENTDOCUMENT_0001 {};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Failed Measurement Document Reading'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.Updatable : false
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity MEASUREMENTDOCUMENT_0001.FailedMeasurementReading {
  @Core.Computed : true
  @Common.Label : 'Date'
  @Common.QuickInfo : 'Date of the Measurement'
  key MsmtRdngDate : Date not null;
  @Core.Computed : true
  @Common.Label : 'Measurement time'
  @Common.Heading : 'Time'
  @Common.QuickInfo : 'Time of Measurement'
  key MsmtRdngTime : Time not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Source document'
  @Common.QuickInfo : 'Source Document for Measurement Reading Transfer'
  key MsmtRdngSourceMeasurementDoc : String(20) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Measuring point'
  @Common.Heading : 'MeasPoint'
  @Common.QuickInfo : 'Measuring Point'
  key MeasuringPoint : String(12) not null;
  @Common.IsDigitSequence : true
  @Common.Label : 'Message Number'
  @Common.Heading : 'Number'
  MsmtRdngTransfFailedMsgNumber : String(3) not null;
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  @Core.Computed : true
  @Common.Label : 'Time Stamp'
  @Common.QuickInfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
  MeasurementReadingDateTime : DateTime;
  SAP__Messages : many MEASUREMENTDOCUMENT_0001.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _MeasurementDocument : Association to one MEASUREMENTDOCUMENT_0001.MeasurementDocument on _MeasurementDocument.MeasurementDocument = MsmtRdngSourceMeasurementDoc;
} actions {
  action RepeatMsmtReadingTransfer(
    _it : $self not null
  ) returns MEASUREMENTDOCUMENT_0001.FailedMeasurementReading not null;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Measurement Documents'
@Common.Messages : SAP__Messages
@Capabilities.NavigationRestrictions.RestrictedProperties : [
  {
    NavigationProperty: _MeasurementDocumentLongText,
    InsertRestrictions: { Insertable: true }
  }
]
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: MeasuringPointPositionNumber,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: Characteristic,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MsmtDocumentReferredOrder,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: RefdMaintOrderOpStatusObject,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MaintenanceOrderOperation,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MaintenanceOrderSubOperation,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MsmtIsDoneAfterTaskCompltn,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MeasurementReading,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MeasurementReadingInEntryUoM,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MeasurementCounterReading,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MsmtCounterReadingDifference,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: TotalMsmtRdngIsSetExternally,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MsmtValuationCode,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MeasurementDocumentHasLongText,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MsmtRdngByUser,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MsmtRdngStatus,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MsmtCntrReadingDiffIsEntered,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MsmtRdngIsReversed,
    AllowedExpressions: 'MultiValue'
  },
  {
    Property: MsmtCounterReadingIsReplaced,
    AllowedExpressions: 'MultiValue'
  }
]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity MEASUREMENTDOCUMENT_0001.MeasurementDocument {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Measurement document'
  @Common.QuickInfo : 'Measurement Document'
  key MeasurementDocument : String(20) not null;
  @Common.FieldControl : #Mandatory
  @Common.IsUpperCase : true
  @Common.Label : 'Measuring point'
  @Common.Heading : 'MeasPoint'
  @Common.QuickInfo : 'Measuring Point'
  MeasuringPoint : String(12) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Measurement position'
  @Common.QuickInfo : 'Position Number of the Object Measuring Point (Sort Field)'
  MeasuringPointPositionNumber : String(20);
  @Common.Label : 'Date'
  @Common.QuickInfo : 'Date of the Measurement'
  MsmtRdngDate : Date;
  @Common.Label : 'Measurement time'
  @Common.Heading : 'Time'
  @Common.QuickInfo : 'Time of Measurement'
  MsmtRdngTime : Time;
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  @Core.Computed : true
  @Common.Label : 'Time Stamp'
  @Common.QuickInfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
  MeasurementReadingDateTime : DateTime;
  @odata.Precision : 0
  @odata.Type : 'Edm.DateTimeOffset'
  @Core.Computed : true
  @Common.Label : 'Time Stamp'
  @Common.QuickInfo : 'UTC Time Stamp in Short Form (YYYYMMDDhhmmss)'
  MsmtDocumentCreationDateTime : DateTime;
  @Common.IsUpperCase : true
  @Common.Label : 'Characteristic Name'
  @Common.Heading : 'Char. Name'
  Characteristic : String(30);
  @Common.IsUpperCase : true
  @Common.Label : 'Order object number'
  @Common.QuickInfo : 'Object Number of Order'
  MsmtDocumentReferredOrder : String(22);
  @Common.IsUpperCase : true
  @Common.Label : 'OpObjectNumber'
  @Common.QuickInfo : 'Object Number of Order Operation/Confirmation Counter etc.'
  RefdMaintOrderOpStatusObject : String(22);
  @Common.IsUpperCase : true
  @Common.Label : 'Operation'
  @Common.Heading : 'Order Operation'
  @Common.QuickInfo : 'Order Operation'
  MaintenanceOrderOperation : String(4);
  @Common.IsUpperCase : true
  @Common.Label : 'Operation'
  @Common.Heading : 'Order Operation'
  @Common.QuickInfo : 'Order Operation'
  MaintenanceOrderSubOperation : String(4);
  @Common.IsUpperCase : true
  @Common.Label : 'Documtd after task'
  @Common.Heading : 'A'
  @Common.QuickInfo : 'Indicator: MeasDoc. Created After Associated Task'
  MsmtIsDoneAfterTaskCompltn : Boolean;
  @Common.IsUnit : true
  @Core.Computed : true
  @Common.Label : 'Internal UoM'
  @Common.Heading : 'MU'
  @Common.QuickInfo : 'Unit of Measurement'
  CharcValueUnit : String(3);
  @Common.IsUnit : true
  @Core.Computed : true
  @Common.Label : 'SI unit'
  @Common.Heading : 'SI'
  MsmtDocumentSIUnitOfMeasure : String(3);
  @Measures.Unit : MeasurementReadingEntryUoM
  @Common.Label : 'MeasRdg'
  @Common.QuickInfo : 'Measurement Reading/Total Counter Reading in SI Unit'
  MeasurementReading : Double;
  @Measures.Unit : MeasurementReadingEntryUoM
  @Common.Label : 'MeasRdg in EntryUnit'
  @Common.Heading : 'MeasRdg in entry unit'
  @Common.QuickInfo : 'Measurement Reading in Unit of Entry'
  MeasurementReadingInEntryUoM : Double;
  @Common.IsUnit : true
  @Common.Label : 'Document MeasUnit'
  @Common.Heading : 'DUn'
  @Common.QuickInfo : 'Unit of Measurement for Document Entry'
  MeasurementReadingEntryUoM : String(3);
  @Measures.Unit : MeasurementReadingEntryUoM
  @Common.Label : 'CountReadng'
  @Common.QuickInfo : 'Counter Reading in SI Unit'
  MeasurementCounterReading : Double;
  @Measures.Unit : MeasurementReadingEntryUoM
  @Common.Label : 'Difference'
  @Common.Heading : 'CounterRdgDifference'
  @Common.QuickInfo : 'Counter Reading Difference in SI Unit'
  MsmtCounterReadingDifference : Double;
  @Common.IsUpperCase : true
  @Common.Label : 'Set externally'
  @Common.Heading : 'E'
  @Common.QuickInfo : 'Indicator: Total Counter Reading Set Externally'
  TotalMsmtRdngIsSetExternally : Boolean;
  @Common.Label : 'Target value'
  @Common.Heading : 'TargVal.'
  @Common.QuickInfo : 'Measuring Point Target Value'
  MeasuringPointTargetValue : Double;
  @Common.IsUpperCase : true
  @Common.Label : 'Valuation code'
  @Common.Heading : 'Val.'
  @Common.QuickInfo : 'Valuation Code'
  MsmtValuationCode : String(4);
  @Common.Label : 'Text'
  @Common.QuickInfo : 'Measurement Document Text'
  MeasurementDocumentText : String(40);
  @Common.IsUpperCase : true
  @Common.Label : 'Long text exists'
  @Common.Heading : 'L'
  @Common.QuickInfo : 'Long Text Exists'
  MeasurementDocumentHasLongText : Boolean;
  @Common.IsUpperCase : true
  @Common.Label : 'Reading taken by'
  @Common.Heading : 'Read by'
  @Common.QuickInfo : 'Person who Took the Measurement Reading'
  MsmtRdngByUser : String(12);
  @Common.IsUpperCase : true
  @Common.Label : 'Processing status'
  @Common.Heading : 'P'
  @Common.QuickInfo : 'Processing Status'
  MsmtRdngStatus : String(1);
  @Common.IsUpperCase : true
  @Common.Label : 'Difference entered'
  @Common.Heading : 'D'
  @Common.QuickInfo : 'Indicator: Counter Reading Entered as Difference'
  MsmtCntrReadingDiffIsEntered : Boolean;
  @Common.IsUpperCase : true
  @Common.Label : 'Reversal indicator'
  @Common.Heading : 'R'
  @Common.QuickInfo : 'Reversal Indicator'
  MsmtRdngIsReversed : Boolean;
  @Common.IsUpperCase : true
  @Common.Label : 'Counter replacement'
  @Common.Heading : 'R'
  @Common.QuickInfo : 'Indicator: Counter Replaced'
  MsmtCounterReadingIsReplaced : Boolean;
  SAP__Messages : many MEASUREMENTDOCUMENT_0001.SAP__Message;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _FailedMeasurementReading : Composition of many MEASUREMENTDOCUMENT_0001.FailedMeasurementReading;
  @cds.ambiguous : 'missing on condition?'
  @Common.Composition : true
  _MeasurementDocumentLongText : Composition of one MEASUREMENTDOCUMENT_0001.MsmtDocumentLongText;
} actions {
  action DeactivateReversalIndicator(
    _it : $self not null
  ) returns MEASUREMENTDOCUMENT_0001.MeasurementDocument not null;
  action ActivateReversalIndicator(
    _it : $self not null
  ) returns MEASUREMENTDOCUMENT_0001.MeasurementDocument not null;
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Measurement Document Text'
@Common.Messages : SAP__Messages
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.FilterRestrictions.Filterable : true
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: MeasurementDocumentLongText,
    AllowedExpressions: 'SearchExpression'
  }
]
@Capabilities.SortRestrictions.NonSortableProperties : [ 'MeasurementDocumentLongText' ]
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity MEASUREMENTDOCUMENT_0001.MsmtDocumentLongText {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Measurement document'
  @Common.QuickInfo : 'Measurement Document'
  key MeasurementDocument : String(20) not null;
  @Common.FieldControl : #Mandatory
  @Common.Label : 'Long Text'
  MeasurementDocumentLongText : LargeString not null;
  SAP__Messages : many MEASUREMENTDOCUMENT_0001.SAP__Message not null;
  @cds.ambiguous : 'missing on condition?'
  _MeasurementDocument : Association to one MEASUREMENTDOCUMENT_0001.MeasurementDocument on _MeasurementDocument.MeasurementDocument = MeasurementDocument;
};


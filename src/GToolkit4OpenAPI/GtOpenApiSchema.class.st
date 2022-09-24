Class {
	#name : #GtOpenApiSchema,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject',
	#classTraits : 'TGtOpenApiObject classTrait',
	#instVars : [
		'everything',
		'name'
	],
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #visiting }
GtOpenApiSchema >> accept: aVisitor [
	^ aVisitor visitGtOpenApiSchema: self
]

{ #category : #accessing }
GtOpenApiSchema >> additionalProperties: aValue [
	everything at: #additionalProperties put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> allOf: aValue [
	everything at: #allOf put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> anyOf: aValue [
	everything at: #anyOf put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> default: aValue [
	everything at: #default put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> description: aValue [
	everything at: #description put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> directlyReferencedSchemas [
	^ GtOpenApiSchemaReferenceCollector new
		schema: self;
		beWithDirectReferences;
		beWithoutGivenSchema;
		collect
]

{ #category : #accessing }
GtOpenApiSchema >> enum: aValue [
	everything at: #enum put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> everything [

	^ everything
]

{ #category : #accessing }
GtOpenApiSchema >> exclusiveMaximum: aValue [
	everything at: #exclusiveMaximum put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> exclusiveMinimum: aValue [
	everything at: #exclusiveMinimum put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> format [
	^ everything at: #format ifAbsent: [ nil ]
]

{ #category : #accessing }
GtOpenApiSchema >> format: aValue [
	everything at: #format put: aValue
]

{ #category : #'gt - extensions' }
GtOpenApiSchema >> gtEverythingFor: aView context: aContext [
	<gtView>
	self everything ifNil: [ ^ aView empty ].

	aContext at: #gtTreeExpansionLevel ifAbsentPut: [ true ].

	aContext
		at: #gtTreeValueStyler
		ifAbsentPut: [ [ :aNode | aNode value gtOpenApiStructureViewText ] ].
		
	aContext
		at: #gtTreeSend
		ifAbsentPut: [ [ :aNode | aNode value gtOpenApiViewSendObject ] ].

	^ aView forward
		title: 'Structure';
		priority: 40;
		object: [ self everything ];
		view: #gtTreeFor:context:
]

{ #category : #accessing }
GtOpenApiSchema >> gtOpenApiContentViewResponseItemText [
	^ self name ifNil: [ self type ifNil: [ self ] ]
]

{ #category : #accessing }
GtOpenApiSchema >> gtOpenApiParameterViewText [
	^ self name ifNil: [ self type ifNil: [ self ] ]
]

{ #category : #accessing }
GtOpenApiSchema >> gtOpenApiStructureViewText [
	^ self name ifNil: [ self type ifNil: [ self ] ]
]

{ #category : #'gt - extensions' }
GtOpenApiSchema >> gtPaintSchemaReferencesFor: aView [
	<gtView>
	^ aView mondrian
		title: 'Schema References';
		priority: 5;
		painting: [ :view | self paintSchemaReferences: self withAllReferencedSchemas on: view ]
]

{ #category : #'gt - extensions' }
GtOpenApiSchema >> gtPropertiesFor: aView context: aContext [
	<gtView>
	self everything ifNil: [ ^ aView empty ].

	^ aView columnedTree
		title: 'Properties';
		priority: 1;
		items: [ self properties associations ];
		children: [ :anAssoc | anAssoc value gtPropertiesViewChildren ];
		column: 'Name'
			text: [ :anAssoc | 
				| aName |
				aName := anAssoc key.
				self
					ifProperty: aName
					requiredDo: [ aName asRopedText bold
							append: (' (required)' asRopedText foreground: BrGlamorousColors disabledButtonTextColor) ]
					otherwise: [ aName ] ];
		column: 'Type' text: [ :anAssoc | anAssoc value gtPropertiesViewTypeText ];
		send: [ :anAssoc | anAssoc value gtOpenApiViewSendObject ]
]

{ #category : #'gt - extensions' }
GtOpenApiSchema >> gtPropertiesViewChildren [
	self isObjectType ifTrue: [ ^ self properties associations ].
	(self isArrayType and: [ self items isNotNil ])
		ifTrue: [ ^ self items gtPropertiesViewChildren ].
	^ #()
]

{ #category : #'gt - extensions' }
GtOpenApiSchema >> gtPropertiesViewTypeText [
	| aText |
	aText := (self type ifNil: [ '' ]) asRopedText.

	self isArrayType
		ifTrue: [ | anItemName aItemText |
			anItemName := self items
					ifNotNil: [ :anObject | 
						anObject isReference
							ifTrue: [ anObject gtPropertiesViewTypeText ]
							ifFalse: [ anObject name ] ]
					ifNil: [ '?' ].
			aItemText := (' of ' , anItemName) asRopedText.
			aText append: aItemText ].

	self format
		ifNotNil: [ :aFormat | 
			| aFormatText |
			aFormatText := (' (' , aFormat , ')') asRopedText
					foreground: BrGlamorousColors disabledButtonTextColor.
			aText append: aFormatText ].
	^ aText
]

{ #category : #testing }
GtOpenApiSchema >> ifProperty: aPropertyName requiredDo: aRequiredBlock otherwise: anOtherwiseBlock [
	^ (self isPropertyRequired: aPropertyName)
		ifTrue: aRequiredBlock
		ifFalse: anOtherwiseBlock
]

{ #category : #initiailize }
GtOpenApiSchema >> initialize [
	super initialize.

	everything := OrderedDictionary new
]

{ #category : #'gt - extensions' }
GtOpenApiSchema >> isArrayType [
	^ self type = 'array'
]

{ #category : #testing }
GtOpenApiSchema >> isObjectType [
	^ self type = 'object'
]

{ #category : #testing }
GtOpenApiSchema >> isPropertyRequired: aPropertyName [
	^ self required includes: aPropertyName
]

{ #category : #testing }
GtOpenApiSchema >> isSchema [
	^ true
]

{ #category : #accessing }
GtOpenApiSchema >> items [
	^ everything at: #items ifAbsent: [ nil ]
]

{ #category : #accessing }
GtOpenApiSchema >> items: aValue [
	everything at: #items put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> maxItems: aValue [
	everything at: #maxItems put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> maxLength: aValue [
	everything at: #maxLength put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> maxProperties: aValue [
	everything at: #maxProperties put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> maximum: aValue [
	everything at: #maximum put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> minItems: aValue [
	everything at: #minItems put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> minLength: aValue [
	everything at: #minLength put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> minProperties: aValue [
	everything at: #minProperties put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> minimum: aValue [
	everything at: #minimum put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> multipleOf: aValue [
	everything at: #multipleOf put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> name [

	^ name
]

{ #category : #accessing }
GtOpenApiSchema >> name: anObject [

	name := anObject
]

{ #category : #accessing }
GtOpenApiSchema >> not: aValue [
	everything at: #not put: aValue
]

{ #category : #enumerating }
GtOpenApiSchema >> objectsDo: aBlock [
	"Iterate all OpenApi objects. 
	The block is [ :anOpenApiObject :aParameterName | ].
	aParameterName is a key value in case of dictionaries, 
	e.g., Map[string, Callback Object | Reference Object]."

	self properties
		keysAndValuesDo: [ :aName :anObject | 
			aBlock cull: anObject cull: aName.
			anObject objectsDo: aBlock ].

	self items ifNotNil: [ :anObject | anObject withObjectsDo: aBlock ]
]

{ #category : #accessing }
GtOpenApiSchema >> oneOf: aValue [
	everything at: #oneOf put: aValue
]

{ #category : #'gt - extensions' }
GtOpenApiSchema >> paintSchemaReferences: aCollectionOfSchema on: aView [
	aView nodes
		stencil: [ :aSchema | 
			BrFrame new
				fitContent;
				padding: (BlInsets all: 5);
				addChild: (BrLabel new
						fitContent;
						aptitude: BrGlamorousLabelAptitude;
						text: (aSchema name ifNil: [ aSchema type asString ])) ];
		with: aCollectionOfSchema.

	aView edges
		stencil: [ :aSchema :fromElement :toElement | 
			| aColor |
			aColor := Color gray alpha: 0.2.
			fromElement = toElement
				ifFalse: [ BlLineElement new
						border: (BlBorder paint: aColor width: 1);
						toHead: (BlArrowheadSimpleArrow new border: (BlBorder paint: aColor width: 1)) ]
				ifTrue: [ BlParabollaArcElement new
						zIndex: 0;
						curvatureFraction: 0.5;
						border: (BlBorder paint: aColor width: 1);
						toHead: (BlArrowheadSimpleArrow new border: (BlBorder paint: aColor width: 1)) ] ];
		connectToAll: [ :aSchema | aSchema directlyReferencedSchemas ].

	aView layout force
		strength: 0.15;
		charge: -350;
		length: 100.

	aView
]

{ #category : #accessing }
GtOpenApiSchema >> pattern: aValue [
	everything at: #pattern put: aValue
]

{ #category : #printing }
GtOpenApiSchema >> printOn: aStream [
	| aName |
	super printOn: aStream.
	everything ifNil: [ ^ self ].
	aName := nil.
	(self isObjectType and: [ self name isNotNil ])
		ifTrue: [ aName := self name asString ].
	(self isArrayType and: [ self items isNotNil and: [ self items isReference ] ])
		ifTrue: [ aName := 'array of  ' , self items object name asString ].
	aName ifNil: [ ^ self ].

	aStream
		nextPut: $(;
		nextPutAll: aName;
		nextPut: $)
]

{ #category : #accessing }
GtOpenApiSchema >> properties [
	^ everything at: #properties ifAbsent: [ OrderedDictionary new ]
]

{ #category : #accessing }
GtOpenApiSchema >> properties: aValue [
	everything at: #properties put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> required [
	^ everything at: #required ifAbsent: [ #() ]
]

{ #category : #accessing }
GtOpenApiSchema >> required: aValue [
	everything at: #required put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> title: aValue [
	everything at: #title put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> type [
	^ everything at: #type ifAbsent: [ nil ]
]

{ #category : #accessing }
GtOpenApiSchema >> type: aValue [
	everything at: #type put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> uniqueItems: aValue [
	everything at: #uniqueItems put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> withAllReferencedSchemas [
	^ GtOpenApiSchemaReferenceCollector new
		schema: self;
		beWithNestedReferences;
		beWithGivenSchema;
		collect
]

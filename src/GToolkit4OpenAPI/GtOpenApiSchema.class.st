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

	^ aView forward
		title: 'Structure';
		priority: 40;
		object: [ self everything ];
		view: #gtTreeFor:context:
]

{ #category : #accessing }
GtOpenApiSchema >> gtOpenApiStructureViewText [
	^ self name ifNil: [ self type ifNil: [ self ] ]
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
		send: #value
]

{ #category : #'gt - extensions' }
GtOpenApiSchema >> gtPropertiesViewChildren [
	^ self properties associations
]

{ #category : #'gt - extensions' }
GtOpenApiSchema >> gtPropertiesViewTypeText [
	| aText |
	aText := (self type ifNil: [ '' ]) asRopedText.
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

{ #category : #testing }
GtOpenApiSchema >> isPropertyRequired: aPropertyName [
	^ self required includes: aPropertyName
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
			anObject objectsDo: aBlock ]
]

{ #category : #accessing }
GtOpenApiSchema >> oneOf: aValue [
	everything at: #oneOf put: aValue
]

{ #category : #accessing }
GtOpenApiSchema >> pattern: aValue [
	everything at: #pattern put: aValue
]

{ #category : #printing }
GtOpenApiSchema >> printOn: aStream [
	super printOn: aStream.
	self name ifNil: [ ^ self ].
	aStream
		nextPut: $(;
		nextPutAll: self name asString;
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

Class {
	#name : #GtOpenApiOperation,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject',
	#classTraits : 'TGtOpenApiObject classTrait',
	#instVars : [
		'tags',
		'summary',
		'description',
		'externalDocs',
		'operationId',
		'parameters',
		'requestBody',
		'responses',
		'callbacks',
		'security',
		'servers',
		'isDeprecated',
		'method',
		'endPoint'
	],
	#category : #'GToolkit4OpenAPI-Model'
}

{ #category : #visiting }
GtOpenApiOperation >> accept: aVisitor [
	^ aVisitor visitGtOpenApiOperation: self
]

{ #category : #accessing }
GtOpenApiOperation >> callbacks [

	^ callbacks
]

{ #category : #accessing }
GtOpenApiOperation >> callbacks: anObject [

	callbacks := anObject
]

{ #category : #accessing }
GtOpenApiOperation >> description [

	^ description
]

{ #category : #accessing }
GtOpenApiOperation >> description: anObject [

	description := anObject
]

{ #category : #accessing }
GtOpenApiOperation >> endPoint [

	^ endPoint
]

{ #category : #accessing }
GtOpenApiOperation >> endPoint: anObject [

	endPoint := anObject
]

{ #category : #accessing }
GtOpenApiOperation >> externalDocs [

	^ externalDocs
]

{ #category : #accessing }
GtOpenApiOperation >> externalDocs: anObject [

	externalDocs := anObject
]

{ #category : #'gt - extensions' }
GtOpenApiOperation >> gtDescriptionFor: aView [
	<gtView>
	self description ifNil: [ ^ aView empty ].

	^ aView textEditor
		title: 'Description';
		priority: 1;
		aptitude: BrGlamorousRegularEditorAptitude;
		text: [ self description ]
]

{ #category : #'gt - extensions' }
GtOpenApiOperation >> gtOpenApiPathsViewChildren [
	^ (self requestBody 
		ifNotNil: [ :aRequestBody | 
			{('request' asRopedText
				italic;
				foreground: BrGlamorousColors 
					disabledButtonTextColor)  -> (
						(GtOpenApiViewObject new
								name: '';
								description: aRequestBody description;
								object: aRequestBody))} ]
		ifNil: [ {} ])
	, (self responses
		ifNotNil: [ :aResponses | 
			aResponses dictionary associations
				collect: [ :anAssoc | 
					('response' asRopedText
						italic;
						foreground: BrGlamorousColors disabledButtonTextColor)
						-> (GtOpenApiViewObject new
								name: anAssoc key;
								description: anAssoc value gtPathsViewDescriptionText;
								object: anAssoc value) ] ]
		ifNil: [ #() ])
]

{ #category : #'gt - extensions' }
GtOpenApiOperation >> gtOperationViewDescriptionText [
	^ self description ifNil: [ '' ]
]

{ #category : #'gt - extensions' }
GtOpenApiOperation >> gtParametersFor: aView [
	<gtView>
	self parameters ifEmpty: [ ^ aView empty ].

	^ aView columnedList
		title: 'Parameters';
		priority: 3;
		items: [ self parameters ];
		column: 'Name' text: [ :aParameter | aParameter gtParameterViewNameText ];
		column: 'Location' text: #inLocation;
		column: 'Description'
			text: [ :aParameter | aParameter description ifNil: [ '' ] ]
]

{ #category : #'gt - extensions' }
GtOpenApiOperation >> gtPathsViewDescriptionText [
	^ self description ifNil: [ '' ]
]

{ #category : #'gt - extensions' }
GtOpenApiOperation >> gtPathsViewOperationsText [
	^ self operationId ifNil: [ '' ]
]

{ #category : #'gt - extensions' }
GtOpenApiOperation >> gtResponsesFor: aView [
	<gtView>
	self responses ifNil: [ ^ aView empty ].

	^ aView forward
		title: 'Responses';
		priority: 5;
		object: [ self responses ];
		view: #gtDictionaryFor:
]

{ #category : #'gt - extensions' }
GtOpenApiOperation >> gtTagsFor: aView [
	<gtView>
	self tags ifNil: [ ^ aView empty ].

	^ aView list
		title: 'Tags';
		priority: 10;
		items: [ self tags ]
]

{ #category : #testing }
GtOpenApiOperation >> includesTagNamed: aTagName [
	^ self tags includes: aTagName
]

{ #category : #accessing }
GtOpenApiOperation >> isDeprecated [
	^ isDeprecated ifNil: [ false ]
]

{ #category : #accessing }
GtOpenApiOperation >> isDeprecated: anObject [

	isDeprecated := anObject
]

{ #category : #accessing }
GtOpenApiOperation >> method [

	^ method
]

{ #category : #accessing }
GtOpenApiOperation >> method: anObject [

	method := anObject
]

{ #category : #accessing }
GtOpenApiOperation >> methodAndEndPointString [
	| aMethod anEndPoint |
	aMethod := self method ifNil: [ '?' ].
	anEndPoint := self endPoint ifNil: [ '/?' ].

	^ aMethod , ' ' , anEndPoint
]

{ #category : #enumerating }
GtOpenApiOperation >> objectsDo: aBlock [
	"Iterate all OpenApi objects. 
	The block is [ :anOpenApiObject :aParameterName | ].
	aParameterName is a key value in case of dictionaries, 
	e.g., Map[string, Callback Object | Reference Object]."

	self externalDocs ifNotNil: [ :anObject | anObject withObjectsDo: aBlock ].
	self responses ifNotNil: [ :anObject | anObject withObjectsDo: aBlock ].
	self requestBody ifNotNil: [ :anObject | anObject withObjectsDo: aBlock ].
	self servers do: [ :anObject | anObject withObjectsDo: aBlock ].
]

{ #category : #accessing }
GtOpenApiOperation >> operationId [

	^ operationId
]

{ #category : #accessing }
GtOpenApiOperation >> operationId: anObject [

	operationId := anObject
]

{ #category : #accessing }
GtOpenApiOperation >> parameters [
	^ parameters ifNil: [ #() ]
]

{ #category : #accessing }
GtOpenApiOperation >> parameters: anObject [

	parameters := anObject
]

{ #category : #printing }
GtOpenApiOperation >> printOn: aStream [
	super printOn: aStream.

	self operationId ifNil: [ ^ self ].

	aStream
		nextPut: $(;
		nextPutAll: self operationId asString;
		nextPut: $)
]

{ #category : #accessing }
GtOpenApiOperation >> requestBody [

	^ requestBody
]

{ #category : #accessing }
GtOpenApiOperation >> requestBody: anObject [

	requestBody := anObject
]

{ #category : #accessing }
GtOpenApiOperation >> responses [
	^ responses
]

{ #category : #accessing }
GtOpenApiOperation >> responses: anObject [

	responses := anObject
]

{ #category : #accessing }
GtOpenApiOperation >> security [

	^ security
]

{ #category : #accessing }
GtOpenApiOperation >> security: anObject [

	security := anObject
]

{ #category : #accessing }
GtOpenApiOperation >> servers [
	^ servers ifNil: [ #() ]
]

{ #category : #accessing }
GtOpenApiOperation >> servers: anObject [

	servers := anObject
]

{ #category : #accessing }
GtOpenApiOperation >> summary [

	^ summary
]

{ #category : #accessing }
GtOpenApiOperation >> summary: anObject [

	summary := anObject
]

{ #category : #accessing }
GtOpenApiOperation >> tags [
	^ tags ifNil: [ #() ]
]

{ #category : #accessing }
GtOpenApiOperation >> tags: anObject [

	tags := anObject
]

Class {
	#name : #GtOpenApiPathItem,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject',
	#classTraits : 'TGtOpenApiObject classTrait',
	#instVars : [
		'ref',
		'summary',
		'description',
		'get',
		'put',
		'post',
		'delete',
		'options',
		'head',
		'patch',
		'trace',
		'servers',
		'parameters'
	],
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #visiting }
GtOpenApiPathItem >> accept: aVisitor [
	^ aVisitor visitGtOpenApiPathItem: self
]

{ #category : #accessing }
GtOpenApiPathItem >> delete [

	^ delete
]

{ #category : #accessing }
GtOpenApiPathItem >> delete: anObject [

	delete := anObject
]

{ #category : #accessing }
GtOpenApiPathItem >> description [

	^ description
]

{ #category : #accessing }
GtOpenApiPathItem >> description: anObject [

	description := anObject
]

{ #category : #accessing }
GtOpenApiPathItem >> get [

	^ get
]

{ #category : #accessing }
GtOpenApiPathItem >> get: anObject [

	get := anObject
]

{ #category : #'gt - extensions' }
GtOpenApiPathItem >> gtOperationsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Operations';
		priority: 1;
		items: [ self operations associations ];
		column: 'Operation'
			text: [ :anAssoc | 
				| aName |
				aName := anAssoc key asRopedText.
				anAssoc value isDeprecated
					ifTrue: [ aName
							lineThroughDo: [ :anAttribute |  ];
							italic;
							append: (' (deprecated)' asRopedText
									foreground: BrGlamorousColors disabledButtonTextColor) ].
				aName ]
			width: 110;
		column: 'ID' text: [ :anAssoc | anAssoc value operationId ];
		column: 'Description'
			text: [ :anAssoc | anAssoc value gtOperationViewDescriptionText ]
			weight: 2;
		send: #value
]

{ #category : #'gt - extensions' }
GtOpenApiPathItem >> gtParametersFor: aView [
	<gtView>
	self parameters ifNil: [ ^ aView empty ].

	^ aView columnedList
		title: 'Parameters';
		priority: 10;
		items: [ self parameters ];
		column: ''
			text: [ :_ :anIndex | anIndex asRopedText foreground: BrGlamorousColors disabledButtonTextColor ]
			width: 40;
		column: 'Name' text: [ :aParameter | aParameter name ];
		column: 'In' text: [ :aParameter | aParameter inLocation ];
		column: 'Description'
			text: [ :aParameter | aParameter description ]
			weight: 2;
		column: 'Status'
			text: [ :aParameter | aParameter gtParametersViewStatusText ]
]

{ #category : #'gt - extensions' }
GtOpenApiPathItem >> gtPathsViewDescriptionText [
	^ self description ifNil: [ '' ]
]

{ #category : #'gt - extensions' }
GtOpenApiPathItem >> gtPathsViewOperationsText [
	^ String
		streamContents: [ :aStream | 
			self operations keys
				do: [ :aKey | aStream nextPutAll: aKey ]
				separatedBy: [ aStream nextPutAll: ', ' ] ]
]

{ #category : #accessing }
GtOpenApiPathItem >> head [

	^ head
]

{ #category : #accessing }
GtOpenApiPathItem >> head: anObject [

	head := anObject
]

{ #category : #enumerating }
GtOpenApiPathItem >> objectsDo: aBlock [
	"Iterate all OpenApi objects. 
	The block is [ :anOpenApiObject :aParameterName | ].
	aParameterName is a key value in case of dictionaries, 
	e.g., Map[string, Callback Object | Reference Object]."

	self operations do: [ :eachOperation | eachOperation withObjectsDo: aBlock ].
	self servers do: [ :eachServer | eachServer withObjectsDo: aBlock ].
	self parameters do: [ :eachParameter | eachParameter withObjectsDo: aBlock ].
]

{ #category : #accessing }
GtOpenApiPathItem >> operations [
	^ OrderedDictionary new
		at: #get put: self get;
		at: #put put: self put;
		at: #post put: self post;
		at: #delete put: self delete;
		at: #options put: self options;
		at: #head put: self head;
		at: #patch put: self patch;
		at: #trace put: self traceOp;
		reject: #isNil
]

{ #category : #accessing }
GtOpenApiPathItem >> options [

	^ options
]

{ #category : #accessing }
GtOpenApiPathItem >> options: anObject [

	options := anObject
]

{ #category : #accessing }
GtOpenApiPathItem >> parameters [
	^ parameters ifNil: [ #() ]
]

{ #category : #accessing }
GtOpenApiPathItem >> parameters: anObject [

	parameters := anObject
]

{ #category : #accessing }
GtOpenApiPathItem >> patch [

	^ patch
]

{ #category : #accessing }
GtOpenApiPathItem >> patch: anObject [

	patch := anObject
]

{ #category : #accessing }
GtOpenApiPathItem >> post [

	^ post
]

{ #category : #accessing }
GtOpenApiPathItem >> post: anObject [

	post := anObject
]

{ #category : #accessing }
GtOpenApiPathItem >> put [

	^ put
]

{ #category : #accessing }
GtOpenApiPathItem >> put: anObject [

	put := anObject
]

{ #category : #accessing }
GtOpenApiPathItem >> ref [

	^ ref
]

{ #category : #accessing }
GtOpenApiPathItem >> ref: anObject [

	ref := anObject
]

{ #category : #accessing }
GtOpenApiPathItem >> servers [
	^ servers ifNil: [ #() ]
]

{ #category : #accessing }
GtOpenApiPathItem >> servers: anObject [

	servers := anObject
]

{ #category : #accessing }
GtOpenApiPathItem >> summary [

	^ summary
]

{ #category : #accessing }
GtOpenApiPathItem >> summary: anObject [

	summary := anObject
]

{ #category : #accessing }
GtOpenApiPathItem >> traceOp [
	^ trace
]

{ #category : #accessing }
GtOpenApiPathItem >> traceOp: anOperation [
	trace := anOperation
]

Class {
	#name : #GtOpenApi,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject',
	#classTraits : 'TGtOpenApiObject classTrait',
	#instVars : [
		'openapi',
		'info',
		'servers',
		'paths',
		'components',
		'security',
		'tags',
		'externalDocs'
	],
	#category : #'GToolkit4OpenAPI-New-Core'
}

{ #category : #'api - parsing' }
GtOpenApi class >> fromJsonString: aString [
	^ GtOpenApiParser readString: aString
]

{ #category : #visiting }
GtOpenApi >> accept: aVisitor [
	^ aVisitor visitGtOpenApi: self
]

{ #category : #accessing }
GtOpenApi >> components [

	^ components
]

{ #category : #accessing }
GtOpenApi >> components: anObject [

	components := anObject
]

{ #category : #accessing }
GtOpenApi >> externalDocs [

	^ externalDocs
]

{ #category : #accessing }
GtOpenApi >> externalDocs: anObject [

	externalDocs := anObject
]

{ #category : #'gt - extensions' }
GtOpenApi >> gtComponentSchemasFor: aView [
	<gtView>
	self components ifNil: [ ^ aView empty ].

	^ aView forward
		title: 'Schemas';
		priority: 10;
		object: [ self components ];
		view: #gtSchemasFor:
]

{ #category : #'gt - extensions' }
GtOpenApi >> gtPathsFor: aView [
	<gtView>
	self paths ifNil: [ ^ aView empty ].

	^ aView columnedList
		title: 'Paths';
		priority: 5;
		items: [ self paths associations sorted: [ :a :b | a key < b key ] ];
		column: 'End Point' text: #key;
		column: 'Operations'
			text: [ :anAssoc | anAssoc value gtPathsViewOperationsText ];
		column: 'Description'
			text: [ :anAssoc | anAssoc value gtPathsViewDescriptionText ];
		send: #value
]

{ #category : #'gt - extensions' }
GtOpenApi >> gtServersFor: aView [
	<gtView>
	self paths ifNil: [ ^ aView empty ].

	^ aView columnedList
		title: 'Servers';
		priority: 20;
		items: [ self servers sorted: [ :a :b | a url < b url ] ];
		column: 'URL' text: #url;
		column: 'Description' text: [ :aServer | aServer description ifNil: [ '' ] ]
]

{ #category : #accessing }
GtOpenApi >> info [

	^ info
]

{ #category : #accessing }
GtOpenApi >> info: anObject [

	info := anObject
]

{ #category : #testing }
GtOpenApi >> isOpenApi [
	^ true
]

{ #category : #enumerating }
GtOpenApi >> objectsDo: aBlock [
	"Iterate all OpenApi objects. 
	The block is [ :anOpenApiObject :aParameterName | ].
	aParameterName is a key value in case of dictionaries, 
	e.g., Map[string, Callback Object | Reference Object]."

	self info withObjectsDo: aBlock.
	self servers do: [ :eachServer | eachServer withObjectsDo: aBlock ].
	self paths
		keysAndValuesDo: [ :aName :aPath | 
			aBlock cull: aPath cull: aName.
			aPath objectsDo: aBlock ].
	self components withObjectsDo: aBlock.
	self tags do: [ :eachTag | eachTag withObjectsDo: aBlock ]
]

{ #category : #accessing }
GtOpenApi >> openapi [

	^ openapi
]

{ #category : #accessing }
GtOpenApi >> openapi: anObject [

	openapi := anObject
]

{ #category : #accessing }
GtOpenApi >> paths [

	^ paths
]

{ #category : #accessing }
GtOpenApi >> paths: anObject [

	paths := anObject
]

{ #category : #accessing }
GtOpenApi >> security [

	^ security
]

{ #category : #accessing }
GtOpenApi >> security: anObject [

	security := anObject
]

{ #category : #accessing }
GtOpenApi >> servers [
	^ servers ifNil: [ #() ]
]

{ #category : #accessing }
GtOpenApi >> servers: anObject [

	servers := anObject
]

{ #category : #accessing }
GtOpenApi >> tags [

	^ tags
]

{ #category : #accessing }
GtOpenApi >> tags: anObject [

	tags := anObject
]

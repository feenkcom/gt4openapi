Class {
	#name : #GtOpenApiResponse,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject',
	#classTraits : 'TGtOpenApiObject classTrait',
	#instVars : [
		'description',
		'headers',
		'content',
		'links'
	],
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #visiting }
GtOpenApiResponse >> accept: aVisitor [
	^ aVisitor visitGtOpenApiResponse: self
]

{ #category : #accessing }
GtOpenApiResponse >> content [

	^ content
]

{ #category : #accessing }
GtOpenApiResponse >> content: anObject [

	content := anObject
]

{ #category : #accessing }
GtOpenApiResponse >> description [

	^ description
]

{ #category : #accessing }
GtOpenApiResponse >> description: anObject [

	description := anObject
]

{ #category : #accessing }
GtOpenApiResponse >> gtContentFor: aView context: aContext [
	<gtView>
	self content ifNil: [ ^ aView empty ].

	aContext at: #gtTreeExpansionLevel ifAbsentPut: [ true ].

	^ aView forward
		title: 'Content';
		priority: 1;
		object: [ self content ];
		view: #gtTreeFor:context:
]

{ #category : #accessing }
GtOpenApiResponse >> headers [

	^ headers
]

{ #category : #accessing }
GtOpenApiResponse >> headers: anObject [

	headers := anObject
]

{ #category : #accessing }
GtOpenApiResponse >> links [

	^ links
]

{ #category : #accessing }
GtOpenApiResponse >> links: anObject [

	links := anObject
]

{ #category : #enumerating }
GtOpenApiResponse >> objectsDo: aBlock [
	"Iterate all OpenApi objects. 
	The block is [ :anOpenApiObject :aParameterName | ].
	aParameterName is a key value in case of dictionaries, 
	e.g., Map[string, Callback Object | Reference Object]."

	self headers
		ifNotNil: [ :aDict | 
			aDict
				keysAndValuesDo: [ :aName :aHeader | 
					aBlock cull: aHeader cull: aName.
					aHeader objectsDo: aBlock ] ].
	self flag: #todo
]

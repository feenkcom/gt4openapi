Class {
	#name : #GtOpenApiResponses,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject',
	#classTraits : 'TGtOpenApiObject classTrait',
	#instVars : [
		'dictionary'
	],
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #visiting }
GtOpenApiResponses >> accept: aVisitor [
	^ aVisitor visitGtOpenApiResponses: self
]

{ #category : #accessing }
GtOpenApiResponses >> atCode: aCode [
	self dictionary ifNil: [ ^ nil ].
	^ self dictionary at: aCode asString ifAbsent: [ nil ]
]

{ #category : #accessing }
GtOpenApiResponses >> default [
	self dictionary ifNil: [ ^ nil ].
	^ self dictionary at: #default ifAbsent: [ nil ]
]

{ #category : #accessing }
GtOpenApiResponses >> dictionary [

	^ dictionary
]

{ #category : #accessing }
GtOpenApiResponses >> dictionary: anObject [

	dictionary := anObject
]

{ #category : #'gt - extensions' }
GtOpenApiResponses >> gtDictionaryFor: aView [
	<gtView>
	self dictionary ifNil: [ ^ aView empty ].

	^ aView columnedList
		title: 'Responses';
		priority: 1;
		items: [ self dictionary associations sorted: [ :a :b | a key < b key ] ];
		column: 'Code'
			text: [ :anAssoc | anAssoc key ]
			width: 100;
		column: 'Description' text: [ :anAssoc | anAssoc value description ];
		send: #value
]

{ #category : #enumerating }
GtOpenApiResponses >> objectsDo: aBlock [
	"Iterate all OpenApi objects. 
	The block is [ :anOpenApiObject :aParameterName | ].
	aParameterName is a key value in case of dictionaries, 
	e.g., Map[string, Callback Object | Reference Object]."

	self dictionary
		ifNotNil: [ :aDict | 
			aDict
				keysAndValuesDo: [ :aCode :anObject | 
					aBlock cull: anObject cull: aCode.
					anObject objectsDo: aBlock ] ]
]

{ #category : #accessing }
GtOpenApiResponses >> size [
	^ self dictionary ifNotNil: #size ifNil: [ 0 ]
]

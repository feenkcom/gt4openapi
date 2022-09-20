Class {
	#name : #GtOpenApiResponses,
	#superclass : #Object,
	#instVars : [
		'dictionary'
	],
	#category : #'GToolkit4OpenAPI-New-Model'
}

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
		items: [ self dictionary associations ];
		column: ''
			text: [ :_ :anIndex | anIndex asRopedText foreground: BrGlamorousColors disabledButtonTextColor ]
			width: 40;
		column: 'Code'
			text: [ :anAssoc | anAssoc key ]
			width: 100;
		column: 'Description' text: [ :anAssoc | anAssoc value description ];
		send: #value
]

{ #category : #accessing }
GtOpenApiResponses >> size [
	^ self dictionary ifNotNil: #size ifNil: [ 0 ]
]

Class {
	#name : #GtOpenApiSchema,
	#superclass : #Object,
	#instVars : [
		'type',
		'properties'
	],
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #accessing }
GtOpenApiSchema >> gtPropertiesFor: aView context: aContext [
	<gtView>
	| anIndexStyler |
	self properties ifNil: [ ^ aView empty ].

	anIndexStyler := aContext at: #gtTreeExpansionLevel ifAbsentPut: [ true ].

	^ aView forward
		title: 'Properties';
		priority: 1;
		object: [ self properties ];
		view: #gtTreeFor:context:
]

{ #category : #accessing }
GtOpenApiSchema >> properties [

	^ properties
]

{ #category : #accessing }
GtOpenApiSchema >> properties: anObject [

	properties := anObject
]

{ #category : #accessing }
GtOpenApiSchema >> type [

	^ type
]

{ #category : #accessing }
GtOpenApiSchema >> type: anObject [

	type := anObject
]

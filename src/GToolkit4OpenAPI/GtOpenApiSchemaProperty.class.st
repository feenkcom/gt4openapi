Class {
	#name : #GtOpenApiSchemaProperty,
	#superclass : #Object,
	#instVars : [
		'property',
		'propertyName',
		'schema'
	],
	#category : #'GToolkit4OpenAPI-Support'
}

{ #category : #'gt - extensions' }
GtOpenApiSchemaProperty >> gtOpenApiViewSendObject [
	^ self property gtOpenApiViewSendObject
]

{ #category : #'gt - extensions' }
GtOpenApiSchemaProperty >> gtPropertiesViewChildren [
	^ self property gtPropertiesViewChildren
]

{ #category : #'gt - extensions' }
GtOpenApiSchemaProperty >> gtPropertiesViewName [
	^ self schema
		ifProperty: self propertyName
		requiredDo: [ self propertyName asRopedText bold
				append: (' (required)' asRopedText foreground: BrGlamorousColors disabledButtonTextColor) ]
		otherwise: [ self propertyName ]
]

{ #category : #'gt - extensions' }
GtOpenApiSchemaProperty >> gtPropertiesViewTypeText [
	^ self property gtPropertiesViewTypeText
]

{ #category : #accessing }
GtOpenApiSchemaProperty >> property [

	^ property
]

{ #category : #accessing }
GtOpenApiSchemaProperty >> property: anObject [

	property := anObject
]

{ #category : #accessing }
GtOpenApiSchemaProperty >> propertyName [

	^ propertyName
]

{ #category : #accessing }
GtOpenApiSchemaProperty >> propertyName: anObject [

	propertyName := anObject
]

{ #category : #accessing }
GtOpenApiSchemaProperty >> schema [

	^ schema
]

{ #category : #accessing }
GtOpenApiSchemaProperty >> schema: anObject [

	schema := anObject
]

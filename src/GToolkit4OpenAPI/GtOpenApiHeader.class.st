Class {
	#name : #GtOpenApiHeader,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject',
	#classTraits : 'TGtOpenApiObject classTrait',
	#instVars : [
		'description',
		'isRequired',
		'isDeprecated',
		'allowEmptyValue'
	],
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #accessing }
GtOpenApiHeader >> accept: aVisitor [
	^ aVisitor visitGtOpenApiHeader: self
]

{ #category : #accessing }
GtOpenApiHeader >> allowEmptyValue [

	^ allowEmptyValue
]

{ #category : #accessing }
GtOpenApiHeader >> allowEmptyValue: anObject [

	allowEmptyValue := anObject
]

{ #category : #accessing }
GtOpenApiHeader >> description [

	^ description
]

{ #category : #accessing }
GtOpenApiHeader >> description: anObject [

	description := anObject
]

{ #category : #accessing }
GtOpenApiHeader >> isDeprecated [
	^ isDeprecated ifNil: [ false ]
]

{ #category : #accessing }
GtOpenApiHeader >> isDeprecated: anObject [

	isDeprecated := anObject
]

{ #category : #accessing }
GtOpenApiHeader >> isRequired [
	^ isRequired ifNil: [ false ]
]

{ #category : #accessing }
GtOpenApiHeader >> isRequired: anObject [

	isRequired := anObject
]

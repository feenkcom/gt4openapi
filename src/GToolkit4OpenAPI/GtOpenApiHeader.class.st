Class {
	#name : #GtOpenApiHeader,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject + TGtOpenApiWithFields',
	#classTraits : 'TGtOpenApiObject classTrait + TGtOpenApiWithFields classTrait',
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #accessing }
GtOpenApiHeader >> accept: aVisitor [
	^ aVisitor visitGtOpenApiHeader: self
]

{ #category : #accessing }
GtOpenApiHeader >> allowEmptyValue [
	^ self fieldAt: #allowEmptyValue ifAbsent: [ false ]
]

{ #category : #accessing }
GtOpenApiHeader >> isDeprecated [
	^ self fieldAt: #isDeprecated ifAbsent: [ false ]
]

{ #category : #accessing }
GtOpenApiHeader >> isRequired [
	^ self fieldAt: #isRequired ifAbsent: [ false ]
]

{ #category : #enumerating }
GtOpenApiHeader >> objectsDo: aBlock [
	"Iterate all OpenApi objects. 
	The block is [ :anOpenApiObject :aParameterName | ].
	aParameterName is a key value in case of dictionaries, 
	e.g., Map[string, Callback Object | Reference Object]."

	self schema ifNotNil: [ :aSchema | aSchema withObjectsDo: aBlock ].
	self flag: #todo
]

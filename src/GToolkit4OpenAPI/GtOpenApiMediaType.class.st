Class {
	#name : #GtOpenApiMediaType,
	#superclass : #Object,
	#traits : 'TGtOpenApiObject + TGtOpenApiWithFields',
	#classTraits : 'TGtOpenApiObject classTrait + TGtOpenApiWithFields classTrait',
	#category : #'GToolkit4OpenAPI-New-Model'
}

{ #category : #accessing }
GtOpenApiMediaType >> accept: aVisitor [
	^ aVisitor visitGtOpenApiMediaType: self
]

{ #category : #accessing }
GtOpenApiMediaType >> gtOpenApiContentViewResponseItemText [
	^ self schema
		ifNotNil: [ :aSchema | aSchema gtOpenApiContentViewResponseItemText ]
		ifNil: [ self asString ]
]

{ #category : #enumerating }
GtOpenApiMediaType >> objectsDo: aBlock [
	"Iterate all OpenApi objects. 
	The block is [ :anOpenApiObject :aParameterName | ].
	aParameterName is a key value in case of dictionaries, 
	e.g., Map[string, Callback Object | Reference Object]."

	self schema ifNotNil: [ :aSchema | aSchema withObjectsDo: aBlock ]
]

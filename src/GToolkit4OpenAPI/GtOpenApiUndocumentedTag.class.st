Class {
	#name : #GtOpenApiUndocumentedTag,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'GToolkit4OpenAPI-Support'
}

{ #category : #'gt - extensions' }
GtOpenApiUndocumentedTag >> gtPathsViewDescriptionText [
	^ ''
]

{ #category : #'gt - extensions' }
GtOpenApiUndocumentedTag >> gtPathsViewOperationsText [
	^ ''
]

{ #category : #'gt - extensions' }
GtOpenApiUndocumentedTag >> gtPathsViewSendObject [
	^ self
]

{ #category : #testing }
GtOpenApiUndocumentedTag >> isTag [
	^ true
]

{ #category : #accessing }
GtOpenApiUndocumentedTag >> name [

	^ name
]

{ #category : #accessing }
GtOpenApiUndocumentedTag >> name: anObject [

	name := anObject
]

{ #category : #printing }
GtOpenApiUndocumentedTag >> printOn: aStream [
	super printOn: aStream.

	self name ifNil: [ ^ self ].

	aStream
		nextPut: $(;
		nextPutAll: self name asString;
		nextPut: $)
]

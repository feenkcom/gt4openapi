Class {
	#name : #GtOpenApiViewObject,
	#superclass : #Object,
	#instVars : [
		'name',
		'object',
		'description',
		'children'
	],
	#category : #'GToolkit4OpenAPI-New-Support'
}

{ #category : #accessing }
GtOpenApiViewObject >> children [
	^ children value ifNil: [ #() ]
]

{ #category : #accessing }
GtOpenApiViewObject >> children: anObject [

	children := anObject
]

{ #category : #accessing }
GtOpenApiViewObject >> description [

	^ description
]

{ #category : #accessing }
GtOpenApiViewObject >> description: anObject [

	description := anObject
]

{ #category : #'gt - extensions' }
GtOpenApiViewObject >> gtOpenApiPathsViewChildren [
	^ self children
]

{ #category : #'gt - extensions' }
GtOpenApiViewObject >> gtOpenApiViewSendObject [
	^ self object
]

{ #category : #'gt - extensions' }
GtOpenApiViewObject >> gtPathsViewDescriptionText [
	^ self description ifNil: [ '' ]
]

{ #category : #'gt - extensions' }
GtOpenApiViewObject >> gtPathsViewOperationsText [
	^ self name ifNil: [ '' ]
]

{ #category : #'gt - extensions' }
GtOpenApiViewObject >> gtPathsViewSendObject [
	^ self object
]

{ #category : #testing }
GtOpenApiViewObject >> isTag [
	^ false
]

{ #category : #accessing }
GtOpenApiViewObject >> name [

	^ name
]

{ #category : #accessing }
GtOpenApiViewObject >> name: anObject [

	name := anObject
]

{ #category : #accessing }
GtOpenApiViewObject >> object [

	^ object
]

{ #category : #accessing }
GtOpenApiViewObject >> object: anObject [

	object := anObject
]

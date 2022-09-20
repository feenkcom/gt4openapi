Class {
	#name : #GtOpenApi,
	#superclass : #Object,
	#instVars : [
		'openapi',
		'info',
		'servers',
		'paths'
	],
	#category : #'GToolkit4OpenAPI-New-Core'
}

{ #category : #accessing }
GtOpenApi >> info [

	^ info
]

{ #category : #accessing }
GtOpenApi >> info: anObject [

	info := anObject
]

{ #category : #accessing }
GtOpenApi >> openapi [

	^ openapi
]

{ #category : #accessing }
GtOpenApi >> openapi: anObject [

	openapi := anObject
]

{ #category : #accessing }
GtOpenApi >> paths [

	^ paths
]

{ #category : #accessing }
GtOpenApi >> paths: anObject [

	paths := anObject
]

{ #category : #accessing }
GtOpenApi >> servers [

	^ servers
]

{ #category : #accessing }
GtOpenApi >> servers: anObject [

	servers := anObject
]

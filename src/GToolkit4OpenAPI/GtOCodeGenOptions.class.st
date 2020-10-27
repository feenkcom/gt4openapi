Class {
	#name : #GtOCodeGenOptions,
	#superclass : #Object,
	#instVars : [
		'modelClassPrefix',
		'modelPackageName'
	],
	#category : #GToolkit4OpenAPI
}

{ #category : #accessing }
GtOCodeGenOptions >> modelClassPrefix [ 
	^ modelClassPrefix
]

{ #category : #accessing }
GtOCodeGenOptions >> modelClassPrefix: aString [
	modelClassPrefix := aString.
]

{ #category : #accessing }
GtOCodeGenOptions >> modelPackage: anObject [ 
	modelPackageName := anObject
]

{ #category : #accessing }
GtOCodeGenOptions >> modelPackageName [
	^ modelPackageName
]

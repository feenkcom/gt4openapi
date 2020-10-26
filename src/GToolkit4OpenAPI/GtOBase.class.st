Class {
	#name : #GtOBase,
	#superclass : #Object,
	#instVars : [
		'rawData',
		'name'
	],
	#category : #'GToolkit4OpenAPI-Model'
}

{ #category : #accessing }
GtOBase >> name [
	^ name
]

{ #category : #accessing }
GtOBase >> name: aName [
	name := aName
]

{ #category : #accessing }
GtOBase >> rawData [
	^ rawData
]

{ #category : #accessing }
GtOBase >> rawData: dictionary [ 
	rawData := dictionary
]

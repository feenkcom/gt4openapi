Class {
	#name : #GtCodeGenExporterConfiguration,
	#superclass : #Object,
	#instVars : [
		'packageName',
		'packageTagName',
		'modelClassPrefix',
		'modelRootClassName'
	],
	#category : #'GToolkit4OpenAPI-Exporter'
}

{ #category : #accessing }
GtCodeGenExporterConfiguration >> modelClassPrefix [

	^ modelClassPrefix
]

{ #category : #accessing }
GtCodeGenExporterConfiguration >> modelClassPrefix: anObject [

	modelClassPrefix := anObject
]

{ #category : #accessing }
GtCodeGenExporterConfiguration >> modelRootClassName [

	^ modelRootClassName
]

{ #category : #accessing }
GtCodeGenExporterConfiguration >> modelRootClassName: anObject [

	modelRootClassName := anObject
]

{ #category : #accessing }
GtCodeGenExporterConfiguration >> packageName [

	^ packageName
]

{ #category : #accessing }
GtCodeGenExporterConfiguration >> packageName: anObject [

	packageName := anObject
]

{ #category : #accessing }
GtCodeGenExporterConfiguration >> packageTagName [

	^ packageTagName
]

{ #category : #accessing }
GtCodeGenExporterConfiguration >> packageTagName: anObject [

	packageTagName := anObject
]

Class {
	#name : #GtCodeGenNamingStrategy,
	#superclass : #Object,
	#instVars : [
		'modelExporter'
	],
	#category : #'GToolkit4OpenAPI-Exporter'
}

{ #category : #accessing }
GtCodeGenNamingStrategy >> modelExporter [
	^ modelExporter
]

{ #category : #accessing }
GtCodeGenNamingStrategy >> modelExporter: aModelExporter [
	modelExporter := aModelExporter
]

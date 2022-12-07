Class {
	#name : #GtCodeGenExporterExtension,
	#superclass : #Object,
	#instVars : [
		'modelExporter'
	],
	#category : #'GToolkit4OpenAPI-Exporter'
}

{ #category : #actions }
GtCodeGenExporterExtension >> build [
	self subclassResponsibility
]

{ #category : #accessing }
GtCodeGenExporterExtension >> configuration [ 
	^ self modelExporter configuration
]

{ #category : #'building - model' }
GtCodeGenExporterExtension >> ensureClassAndMetaClassNamed: aString [
	^ self modelBuilder ensureClassAndMetaClassNamed: aString
]

{ #category : #accessing }
GtCodeGenExporterExtension >> modelBuilder [ 
	^ self modelExporter modelBuilder
]

{ #category : #accessing }
GtCodeGenExporterExtension >> modelClassDefinitions [
	^ self modelExporter modelClassDefinitions
]

{ #category : #enumerating }
GtCodeGenExporterExtension >> modelDefinitionAndClassesDo: aBlock [
	self modelExporter modelDefinitionAndClassesDo: aBlock
]

{ #category : #accessing }
GtCodeGenExporterExtension >> modelExporter [

	^ modelExporter
]

{ #category : #accessing }
GtCodeGenExporterExtension >> modelExporter: aModelExporter [

	modelExporter := aModelExporter
]

{ #category : #'accessing - model' }
GtCodeGenExporterExtension >> modelPackage [
	<return: #RGPackageDefinition>
	^ self modelExporter modelPackage
]

{ #category : #'accessing - model' }
GtCodeGenExporterExtension >> modelRootClass [
	<return: #RGClass>
	
	^ self modelExporter modelRootClass
]

{ #category : #accessing }
GtCodeGenExporterExtension >> namingStrategy [
	^ self modelExporter namingStrategy
]

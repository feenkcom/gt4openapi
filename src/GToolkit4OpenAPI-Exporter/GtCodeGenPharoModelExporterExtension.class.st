Class {
	#name : #GtCodeGenPharoModelExporterExtension,
	#superclass : #GtCodeGenExporterExtension,
	#category : #'GToolkit4OpenAPI-Exporter'
}

{ #category : #actions }
GtCodeGenPharoModelExporterExtension >> build [
	self buildBehaviors
]

{ #category : #actions }
GtCodeGenPharoModelExporterExtension >> buildBehaviorFrom: aModelClassDefinition [
	| aClassName aClass aSuperClass |
	
	aClassName := self namingStrategy 
		classNameForDefinition: aModelClassDefinition.
	aClass := self ensureClassAndMetaClassNamed: aClassName.
	aClass package: self modelPackage.
	aClass tagWith: self configuration packageTagName.
	
	aSuperClass := self modelRootClass.
	aClass superclass: aSuperClass
]

{ #category : #actions }
GtCodeGenPharoModelExporterExtension >> buildBehaviors [
	self modelClassDefinitions do: [ :aModelClassDefinition |
		self buildBehaviorFrom: aModelClassDefinition ]
]

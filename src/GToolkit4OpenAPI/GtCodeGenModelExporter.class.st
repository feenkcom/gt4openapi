Class {
	#name : #GtCodeGenModelExporter,
	#superclass : #Object,
	#instVars : [
		'configuration',
		'extensions',
		'modelBuilder',
		'metaModel',
		'namingStrategy'
	],
	#category : #'GToolkit4OpenAPI-Exporter'
}

{ #category : #'initialization - extensions' }
GtCodeGenModelExporter >> addExtension: anExtension [
	self 
		assert: [ anExtension isNotNil ] 
		description: [ 'The builder extension must be non-nil' ].
	
	anExtension modelExporter: self.
	self extensions add: anExtension
]

{ #category : #'accessing - model' }
GtCodeGenModelExporter >> behaviorNamed: aString [
	^ self modelBuilder behaviorNamed: aString
]

{ #category : #build }
GtCodeGenModelExporter >> build [
	self buildUsingExtensions.
	self modelBuilder clean.
]

{ #category : #build }
GtCodeGenModelExporter >> buildUsingExtensions [
	self extensions
		do: [ :eachBuilderExtension | eachBuilderExtension build ]
]

{ #category : #accessing }
GtCodeGenModelExporter >> configuration [

	^ configuration
]

{ #category : #accessing }
GtCodeGenModelExporter >> configuration: anExporterConfiguration [

	configuration := anExporterConfiguration
]

{ #category : #'building - model' }
GtCodeGenModelExporter >> ensureClassAndMetaClassNamed: aString [ 
	^ self modelBuilder ensureClassAndMetaClassNamed: aString 
]

{ #category : #'building - model' }
GtCodeGenModelExporter >> ensureObjectAsSuperclassForBehavior: aRGBehavior [ 
	^ self modelBuilder ensureObjectAsSuperclassForBehavior: aRGBehavior 
]

{ #category : #'building - model' }
GtCodeGenModelExporter >> ensurePackageAndTagForBehavior: aRGBehavior [
	self modelBuilder ensurePackage: self modelPackage forBehavior: aRGBehavior. 
	self modelBuilder ensurePackageTagNamed: self packageTagName forBehavior: aRGBehavior
]

{ #category : #accessing }
GtCodeGenModelExporter >> extensions [
	^ extensions
]

{ #category : #initialization }
GtCodeGenModelExporter >> initialize [
	super initialize.
	
	self initializeModelBuilder.
	self initializeDefaultConfiguration.
	
	extensions := OrderedCollection new.
]

{ #category : #initialization }
GtCodeGenModelExporter >> initializeDefaultConfiguration [
	configuration := GtCodeGenExporterConfiguration new.
]

{ #category : #initialization }
GtCodeGenModelExporter >> initializeModelBuilder [
	modelBuilder := DiModelBuilder ring2.
]

{ #category : #accessing }
GtCodeGenModelExporter >> modelBuilder [
	^ modelBuilder
]

{ #category : #'accessing - metamodel' }
GtCodeGenModelExporter >> modelClassDefinitions [
	^ self subclassResponsibility
]

{ #category : #'accessing - configuration' }
GtCodeGenModelExporter >> modelClassPrefix [
	^ self configuration modelClassPrefix
]

{ #category : #'accessing - model' }
GtCodeGenModelExporter >> modelPackage [
	<return: #RGPackageDefinition>
	
	^ self modelBuilder ensurePackageNamed: self packageName
]

{ #category : #'accessing - model' }
GtCodeGenModelExporter >> modelRootClass [
	<return: #RGClass>
	| newClass |
	
	(self behaviorNamed: self modelRootClassName)
		ifNotNil: [ :aClass | ^ aClass ].
	
	newClass := self ensureClassAndMetaClassNamed: self modelRootClassName.
	self ensureObjectAsSuperclassForBehavior: newClass.
	self ensurePackageAndTagForBehavior: newClass.
	
	^ newClass
]

{ #category : #'accessing - configuration' }
GtCodeGenModelExporter >> modelRootClassName [
	^ self configuration modelRootClassName
]

{ #category : #accessing }
GtCodeGenModelExporter >> namingStrategy [
	^ namingStrategy
]

{ #category : #accessing }
GtCodeGenModelExporter >> namingStrategy: aNamingStrategy [

	namingStrategy := aNamingStrategy.
	aNamingStrategy modelExporter: self
]

{ #category : #accessing }
GtCodeGenModelExporter >> packageName [
	^ self configuration packageName
]

{ #category : #'accessing - configuration' }
GtCodeGenModelExporter >> packageTagName [
	^ self configuration packageTagName
]

{ #category : #'initialization - extensions - pharo' }
GtCodeGenModelExporter >> usePharoModelBuilder [
	self addExtension: GtCodeGenPharoModelExporterExtension new.
]

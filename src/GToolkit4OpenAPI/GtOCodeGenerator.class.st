Class {
	#name : #GtOCodeGenerator,
	#superclass : #Object,
	#instVars : [
		'packageOrganizer',
		'codeGenOptions',
		'generatedClasses'
	],
	#category : #GToolkit4OpenAPI
}

{ #category : #accessing }
GtOCodeGenerator >> addClass: generatedClass at: classSymbol [ 
	generatedClasses at: classSymbol put: generatedClass.
]

{ #category : #accessing }
GtOCodeGenerator >> addProperty: a in: generatedClass [ 
	"first create the slot"
	|slotName|
	slotName := a key asSymbol.
	slotName := (slotName first lowercase asString, slotName allButFirst) asSymbol.
	generatedClass classLayout slots detectIndex: [:s | s name = slotName] ifNone: [ 				generatedClass addSlot: slotName => InstanceVariableSlot ].
	"then accessors"
	"'x={1} and y={2}' format: { x. y }."
	
	generatedClass compile: (('{1}: anObject',String lf,'	{1} := anObject') format: {slotName}).
	generatedClass compile: (('{1}',String lf,'	^ {1}') format: {slotName}).
	
]

{ #category : #accessing }
GtOCodeGenerator >> codeGenOptions: aCodeGenOptions [
	codeGenOptions := aCodeGenOptions
]

{ #category : #accessing }
GtOCodeGenerator >> ensureClass: aClassName [ 
	| classSymbol fullPackageName |
	fullPackageName := codeGenOptions modelPackageName.
	classSymbol := codeGenOptions modelClassPrefix, aClassName asSymbol.
	self ensurePackage: fullPackageName.
	^ classSymbol asClassInEnvironment: Smalltalk globals 
		ifAbsent: [ (Object subclass: classSymbol)
								  category: fullPackageName ].
]

{ #category : #accessing }
GtOCodeGenerator >> ensurePackage: aFullPackageName [ 
	^ packageOrganizer ensureExistAndRegisterPackageNamed: aFullPackageName
]

{ #category : #accessing }
GtOCodeGenerator >> generateClassFor: aGtOSchema withProperties: aProperties [
	|generatedClass|
	generatedClass := self ensureClass: aGtOSchema name.
	aProperties associations sorted collect: [:a |
		self addProperty: a in: generatedClass].
	self addClass: generatedClass at: generatedClass name
]

{ #category : #accessing }
GtOCodeGenerator >> generatedClasses [
	^ generatedClasses
]

{ #category : #accessing }
GtOCodeGenerator >> gtGeneratedClassesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Classes' translated;
		priority: 50;
		items: [ generatedClasses associations sorted ];
		column: 'Name' text: [ :eachItem | eachItem key gtDisplayText ];
		column: 'PropertiesCount' text: [ :eachItem | eachItem value slots size ];
		send: [:a | a value];
		actionUpdateButtonTooltip: 'Update item list'
]

{ #category : #accessing }
GtOCodeGenerator >> initialize [
	codeGenOptions := GtOCodeGenOptions new modelClassPrefix: 'MyGtO'; modelPackage:'MyApiModelPackage'.
	packageOrganizer := RPackageOrganizer new.
	generatedClasses := Dictionary new.
]

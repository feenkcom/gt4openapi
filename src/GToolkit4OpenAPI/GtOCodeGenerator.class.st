Class {
	#name : #GtOCodeGenerator,
	#superclass : #Object,
	#instVars : [
		'packageOrganizer',
		'codeGenOptions'
	],
	#category : #GToolkit4OpenAPI
}

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
		ifAbsent: [ (JcModelElement subclass: classSymbol)
								  category: fullPackageName ].
]

{ #category : #accessing }
GtOCodeGenerator >> ensurePackage: aFullPackageName [ 
	^ packageOrganizer ensureExistAndRegisterPackageNamed: aFullPackageName
]

{ #category : #accessing }
GtOCodeGenerator >> generateClassFor: aGtOSchema withProperties: aProperties [
	self ensureClass: aGtOSchema name.
]

{ #category : #accessing }
GtOCodeGenerator >> initialize [
	packageOrganizer := RPackageOrganizer new.
]

'From Cuis 6.0 [latest update: #6054] on 25 October 2023 at 10:06:01 am'!
'Description '!
!provides: 'CuisApp' 1 4!
!requires: 'UI-Components' nil nil nil!
!requires: 'Gettext' nil nil nil!
!requires: 'SVG' nil nil nil!
SystemOrganization addCategory: #CuisApp!
SystemOrganization addCategory: #'CuisApp-Presenter'!
SystemOrganization addCategory: #'CuisApp-Model'!
SystemOrganization addCategory: #'CuisApp-View'!
SystemOrganization addCategory: #'CuisApp-System'!


!classDefinition: #App category: #'CuisApp-Presenter'!
Object subclass: #App
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisApp-Presenter'!
!classDefinition: 'App class' category: #'CuisApp-Presenter'!
App class
	instanceVariableNames: ''!

!classDefinition: #AppControlManager category: #'CuisApp-View'!
Object subclass: #AppControlManager
	instanceVariableNames: 'presenter view icons'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisApp-View'!
!classDefinition: 'AppControlManager class' category: #'CuisApp-View'!
AppControlManager class
	instanceVariableNames: ''!

!classDefinition: #AppIconManager category: #'CuisApp-View'!
Object subclass: #AppIconManager
	instanceVariableNames: 'forms path'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisApp-View'!
!classDefinition: 'AppIconManager class' category: #'CuisApp-View'!
AppIconManager class
	instanceVariableNames: ''!

!classDefinition: #AppPlatform category: #'CuisApp-System'!
Object subclass: #AppPlatform
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisApp-System'!
!classDefinition: 'AppPlatform class' category: #'CuisApp-System'!
AppPlatform class
	instanceVariableNames: ''!

!classDefinition: #AppDevelopment category: #'CuisApp-System'!
AppPlatform subclass: #AppDevelopment
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisApp-System'!
!classDefinition: 'AppDevelopment class' category: #'CuisApp-System'!
AppDevelopment class
	instanceVariableNames: ''!

!classDefinition: #AppSystem category: #'CuisApp-System'!
Object subclass: #AppSystem
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisApp-System'!
!classDefinition: 'AppSystem class' category: #'CuisApp-System'!
AppSystem class
	instanceVariableNames: 'platform'!


!AppControlManager commentStamp: '<historical>' prior: 0!
A manager for the CuisApp user interface : windows,  toolbars, controls and other widgets!

!AppIconManager commentStamp: '<historical>' prior: 0!
I load icons from files (both PNG and SVG) and cached them in a dictionary (forms instance variable).
I can manage different size of the same icon. 
When asked for an icon with the message get: #blank32, I will search in the path for blank.svg, fallback to blank.png, then scale at squared size 32.!

!AppControlManager methodsFor: 'accessing' stamp: 'hlsf 8/16/2023 21:15:48'!
presenter: aPresenter
	presenter := aPresenter ! !

!AppControlManager methodsFor: 'accessing' stamp: 'hlsf 8/16/2023 21:17:57'!
view
	^ view! !

!AppControlManager methodsFor: 'controls data' stamp: 'hlsf 8/14/2023 22:29:54'!
binderButtonData
" label - iconName - callback - description "
	^ {'Binders' translated . #binder . #goBinder . 'In the Binders, find the documents of your courses and start a new one.' translated }! !

!AppControlManager methodsFor: 'controls data' stamp: 'hlsf 8/14/2023 22:25:02'!
settingsButtonData
" label - iconName - callback - description "
	^ {'Settings' translated . #settings . #goSettings . 'In the Settings, edit your course and student lists.' translated }! !

!AppControlManager methodsFor: 'controls data' stamp: 'hlsf 8/15/2023 21:24:57'!
startButtonData
" label - iconName - callback - description "
	^ {'Start' translated . #start . #goStart . 'In Start, review and search for the recent activities.' translated }! !

!AppControlManager methodsFor: 'controls data' stamp: 'hlsf 8/14/2023 22:25:29'!
taskButtonData
" label - iconName - callback - description "
	^ {'Tasks' translated . #task . #goTask . 'In the Tasks, review forthcoming tasks and assign a new one.' translated }! !

!AppControlManager methodsFor: 'initialization' stamp: 'hlsf 8/13/2023 16:29:22'!
initialize
	icons := DyIconManager path: DySystem iconsPath ! !

!AppControlManager methodsFor: 'tools collection' stamp: 'hlsf 8/15/2023 20:28:48'!
dynabookTools
	^ #(start task binder spacer settings)! !

!AppControlManager methodsFor: 'view' stamp: 'hlsf 8/16/2023 21:14:31'!
installDynabookView
	view := DynabookView for: presenter.
	view 
		addMorph: self dynabookToolbar 
		layoutSpec: (LayoutSpec fixedHeight: DySystem iconToolbarSize + 4).
	self plugStartView! !

!AppControlManager methodsFor: 'view' stamp: 'hlsf 10/9/2023 23:52:20'!
plugBinderView
	self plugInDynabookView: (DyBinderView presenter: presenter)! !

!AppControlManager methodsFor: 'view' stamp: 'hlsf 9/28/2023 21:44:09'!
plugInDynabookView: aMorph
" plug in the dynabook main view this morph, below its toolbar "
	| layout |
	layout := view layoutMorph.
	layout submorphCount = 2 ifTrue: [
		layout removeMorph: layout firstSubmorph].
	layout addMorphUseAll: aMorph.
	view changed! !

!AppControlManager methodsFor: 'view' stamp: 'hlsf 8/16/2023 21:41:44'!
plugSettingsView
	self plugInDynabookView: (
		BreadcrumbsPane 
			on: presenter domain userData 
			with: DyViewerVisitor )! !

!AppControlManager methodsFor: 'view' stamp: 'hlsf 8/16/2023 21:08:23'!
plugStartView
! !

!AppControlManager methodsFor: 'view' stamp: 'hlsf 9/30/2023 17:56:27'!
plugTaskView
	self plugInDynabookView: (DyAgendaView presenter: presenter)! !

!AppControlManager methodsFor: 'widget' stamp: 'hlsf 8/16/2023 21:25:12'!
button: symbol
	"array first = menu label or button label
	array second = button form = section mode
	array third = symbol callback
	array fourth = help string	"	
	| array stateGetter |
	array := self perform: (symbol, #ButtonData) asSymbol.
	^ ButtonMorph 
		model: presenter
		stateGetter: (stateGetter := array at: 5 ifAbsent: [ #isSection: ])
		action: array third ::
		stateArgument: (stateGetter isUnary ifTrue: [nil] ifFalse: [array second]);
		icon: (icons get: array second size: DySystem iconToolbarSize);
		setBalloonText: array fourth;
		color: DySystem buttonColor ;
		selectedColor: DySystem buttonSelectedColor ;
		borderColor: DySystem buttonColor muchDarker;
		borderWidth: 2;
		morphExtent: (DySystem iconToolbarSize + 4) asPoint;
		yourself	! !

!AppControlManager methodsFor: 'widget' stamp: 'hlsf 10/7/2023 15:24:00'!
dynabookToolbar
	| toolbar |
	toolbar := LayoutMorph newRow 
		separation: 5; 
		yourself.
	self dynabookTools do: [:aTool | 
		aTool == #spacer 
			ifTrue: [toolbar addMorphUseAll: self class spacer]
			ifFalse: [	toolbar addMorph: (self button: aTool )] ].
	^ toolbar! !

!AppControlManager class methodsFor: 'instance creation' stamp: 'hlsf 8/16/2023 21:15:18'!
for: aPresenter
	^ self new
		presenter: aPresenter;
		yourself! !

!AppControlManager class methodsFor: 'widget' stamp: 'hlsf 10/7/2023 15:23:51'!
spacer
	^ BoxedMorph new 
		borderWidth: 0;
		color: Color transparent; 
		yourself! !

!AppIconManager methodsFor: 'accessing' stamp: 'hlsf 8/13/2023 16:00:18'!
get: iconSymbolWithSize
" icons get: #blank32 "
	| size |
	(size := iconSymbolWithSize select: [:c | c isDigit ]) 
		ifEmpty: [self error: 'Missing size in icon symbol'].
	^ self 
		get: (iconSymbolWithSize select: [:c | c isLetter ])
		size: size asNumber! !

!AppIconManager methodsFor: 'accessing' stamp: 'hlsf 8/13/2023 16:35:39'!
get: icon size: integer
" Search first for SVG icon, then PNG one "
	^ forms 
		at: (icon, integer asString) asSymbol
		ifAbsentPut: [ | file | 
			(file := path // (icon, '.svg')) exists
				ifTrue: [ |svg|
					svg := [SVGMainMorph fromFile: file] 
						on: SVGWarning 
						do: [:warning | warning resume].
					svg imageForm: integer asPoint depth: 32]									
				ifFalse: [(file := path // (icon , '.png')) exists
					ifTrue: [| form |
						form := PNGReadWriter formFromFileEntry: file.
						form width = integer 
							ifTrue: 	[form] 
							ifFalse: [	form magnifyTo: integer asPoint] ]
					ifFalse: [self error: 'Missing icon file ', icon ] ]
			]! !

!AppIconManager methodsFor: 'accessing' stamp: 'hlsf 8/13/2023 15:20:42'!
path: iconsDirectoryEntry
	path := iconsDirectoryEntry ! !

!AppIconManager methodsFor: 'initialization' stamp: 'hlsf 8/13/2023 16:29:00'!
initialize
	forms := Dictionary new.! !

!AppIconManager class methodsFor: 'instance creation' stamp: 'hlsf 8/13/2023 15:37:01'!
path: aDriectoryEntry
	^ self new ::
		path: aDriectoryEntry;
		yourself! !

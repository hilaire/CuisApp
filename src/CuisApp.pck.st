'From Cuis 6.0 [latest update: #6068] on 2 November 2023 at 3:56:32 pm'!
'Description '!
!provides: 'CuisApp' 1 30!
!requires: 'Goodies' 1 10 nil!
!requires: 'UI-Components' nil nil nil!
!requires: 'Gettext' nil nil nil!
!requires: 'SVG' nil nil nil!
SystemOrganization addCategory: #CuisApp!
SystemOrganization addCategory: #'CuisApp-Presenter'!
SystemOrganization addCategory: #'CuisApp-Model'!
SystemOrganization addCategory: #'CuisApp-View'!
SystemOrganization addCategory: #'CuisApp-System'!


!classDefinition: #AppCommandStack category: #'CuisApp-Presenter'!
ReadWriteStream subclass: #AppCommandStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisApp-Presenter'!
!classDefinition: 'AppCommandStack class' category: #'CuisApp-Presenter'!
AppCommandStack class
	instanceVariableNames: ''!

!classDefinition: #AppView category: #'CuisApp-View'!
SystemWindow subclass: #AppView
	instanceVariableNames: 'image presenter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisApp-View'!
!classDefinition: 'AppView class' category: #'CuisApp-View'!
AppView class
	instanceVariableNames: ''!

!classDefinition: #App category: #'CuisApp-Presenter'!
Object subclass: #App
	instanceVariableNames: 'domain controlManager cmdManager'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisApp-Presenter'!
!classDefinition: 'App class' category: #'CuisApp-Presenter'!
App class
	instanceVariableNames: ''!

!classDefinition: #AppCommand category: #'CuisApp-Presenter'!
Object subclass: #AppCommand
	instanceVariableNames: 'presenter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisApp-Presenter'!
!classDefinition: 'AppCommand class' category: #'CuisApp-Presenter'!
AppCommand class
	instanceVariableNames: ''!

!classDefinition: #AppFlipHCommand category: #'CuisApp-Presenter'!
AppCommand subclass: #AppFlipHCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisApp-Presenter'!
!classDefinition: 'AppFlipHCommand class' category: #'CuisApp-Presenter'!
AppFlipHCommand class
	instanceVariableNames: ''!

!classDefinition: #AppFlipVCommand category: #'CuisApp-Presenter'!
AppCommand subclass: #AppFlipVCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisApp-Presenter'!
!classDefinition: 'AppFlipVCommand class' category: #'CuisApp-Presenter'!
AppFlipVCommand class
	instanceVariableNames: ''!

!classDefinition: #AppRotateCommand category: #'CuisApp-Presenter'!
AppCommand subclass: #AppRotateCommand
	instanceVariableNames: 'degrees'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisApp-Presenter'!
!classDefinition: 'AppRotateCommand class' category: #'CuisApp-Presenter'!
AppRotateCommand class
	instanceVariableNames: ''!

!classDefinition: #AppZoomInCommand category: #'CuisApp-Presenter'!
AppCommand subclass: #AppZoomInCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisApp-Presenter'!
!classDefinition: 'AppZoomInCommand class' category: #'CuisApp-Presenter'!
AppZoomInCommand class
	instanceVariableNames: ''!

!classDefinition: #AppZoomOutCommand category: #'CuisApp-Presenter'!
AppCommand subclass: #AppZoomOutCommand
	instanceVariableNames: 'cacheForm'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisApp-Presenter'!
!classDefinition: 'AppZoomOutCommand class' category: #'CuisApp-Presenter'!
AppZoomOutCommand class
	instanceVariableNames: ''!

!classDefinition: #AppCommandManager category: #'CuisApp-Presenter'!
Object subclass: #AppCommandManager
	instanceVariableNames: 'stack presenter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisApp-Presenter'!
!classDefinition: 'AppCommandManager class' category: #'CuisApp-Presenter'!
AppCommandManager class
	instanceVariableNames: ''!

!classDefinition: #AppDomain category: #'CuisApp-Model'!
Object subclass: #AppDomain
	instanceVariableNames: 'fileEntry'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CuisApp-Model'!
!classDefinition: 'AppDomain class' category: #'CuisApp-Model'!
AppDomain class
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


!AppView commentStamp: '<historical>' prior: 0!
I am the main view of the application. I am modeled by the AppControlManager to keep out complexity.!

!App commentStamp: '<historical>' prior: 0!
I am the presenter of the CuisApp!

!AppCommand commentStamp: '<historical>' prior: 0!
An abstract Command to undo/redo operation!

!AppZoomOutCommand commentStamp: '<historical>' prior: 0!
It is a destructive command. We have to keep a copy of the original form to restore it.!

!AppDomain commentStamp: '<historical>' prior: 0!
The domain object of the CuisApp, a kind of Model.
It knows about the image file entry.!

!AppControlManager commentStamp: '<historical>' prior: 0!
A manager for the CuisApp user interface : windows,  toolbars, controls and other widgets.
Among other things, I compose the AppView.
When needed, I can be subclassed to design an alternate arrangment of the AppView.!

!AppIconManager commentStamp: '<historical>' prior: 0!
I load icons from files (both PNG and SVG) and cached them in a dictionary (forms instance variable).
I can manage different size of the same icon. 
When asked for an icon with the message get: #blank32, I will search in the path for blank.svg, fallback to blank.png, then scale at squared size 32.!

!AppCommandStack methodsFor: 'private'!
truncate
	|oldReadLimit|
	oldReadLimit _ readLimit.
	readLimit _ position.
	oldReadLimit > readLimit ifTrue:
			[readLimit to: oldReadLimit do:
				[:index| collection at: index + 1 put: nil]]! !

!AppCommandStack methodsFor: 'accessing'!
nextPut: aCommand
	super nextPut: aCommand.
	self truncate.
	^ aCommand ! !

!AppCommandStack methodsFor: 'accessing'!
previous
	self position = 0 ifTrue: [^nil].
	self position: self position - 1.
	^self peek.! !

!AppCommandStack class methodsFor: 'instance creation'!
new
	^self on: Array new! !

!AppView methodsFor: 'initialization'!
initialize
	super initialize.
	image := ImageMorph new.
	image borderWidth: 1.
	self model: self domain.
	self update: #relabel.
	self domain 
		when: #newImageSelected
		send: #loadImage 
		to: self! !

!AppView methodsFor: 'accessing'!
domain
	^ presenter domain! !

!AppView methodsFor: 'accessing'!
imageMorph
	^ image ! !

!AppView methodsFor: 'accessing'!
presenter: aPresenter
	presenter := aPresenter! !

!AppView methodsFor: 'action'!
loadImage
	image image: (ImageReadWriter formFromFileEntry: self domain fileEntry).
	self update: #relabel! !

!AppView class methodsFor: 'instance creation'!
for: aPresenter
	^ self basicNew
		presenter: aPresenter;
		initialize ! !

!AppView class methodsFor: 'instance creation' stamp: 'hlsf 10/27/2023 22:39:52'!
initializedInstance
	| view |
	view := App new.
	^ view! !

!AppView class methodsFor: 'new-morph participation' stamp: 'hlsf 10/27/2023 16:34:12'!
categoryInNewMorphMenu
	^ 'User Interface'! !

!AppView class methodsFor: 'new-morph participation' stamp: 'hlsf 10/27/2023 17:10:34'!
includeInNewMorphMenu
	^ true! !

!App methodsFor: 'initialization' stamp: 'hlsf 10/27/2023 17:16:35'!
initialize
	domain := AppDomain new.
	controlManager := AppControlManager for: self.
	controlManager installAppView.
	cmdManager := AppCommandManager new presenter: self.
	^ self view openInWorld.
! !

!App methodsFor: 'initialization'!
release
	^ cmdManager release! !

!App methodsFor: 'callback'!
flipHorizontally
	cmdManager flipHorizontally ! !

!App methodsFor: 'callback'!
flipVertically
	cmdManager flipVertically ! !

!App methodsFor: 'callback'!
openImage
	| answer |
	answer := (StandardFileMenu new
		oldFileFrom: AppSystem picturesPath withPattern: '*.png *.jpg *.jpeg' excludePattern: '.*') startUpWithCaption: 'Pick up a picture' translated.
	answer ifNotNil: [
		domain fileEntry: answer directory // answer name	.
		cmdManager release]! !

!App methodsFor: 'callback'!
redo
	cmdManager redo! !

!App methodsFor: 'callback'!
rotateLeft
	cmdManager rotateLeft! !

!App methodsFor: 'callback'!
rotateRight
	cmdManager rotateRight ! !

!App methodsFor: 'callback'!
undo
	cmdManager undo! !

!App methodsFor: 'callback'!
zoomIn
	cmdManager zoomIn! !

!App methodsFor: 'callback'!
zoomOut
	cmdManager zoomOut ! !

!App methodsFor: 'accessing'!
domain
	^ domain! !

!App methodsFor: 'accessing'!
view
	^ controlManager view! !

!App methodsFor: 'testing'!
isButtonActive
	^ domain fileEntry notNil! !

!AppCommand methodsFor: 'accessing'!
imageMorph
	^ presenter view imageMorph ! !

!AppCommand methodsFor: 'accessing'!
presenter: aPresenter
	presenter := aPresenter ! !

!AppCommand methodsFor: 'command'!
execute
	self subclassResponsibility ! !

!AppCommand methodsFor: 'command'!
unexecute
	self subclassResponsibility ! !

!AppCommand methodsFor: 'initialize-release'!
release
" Let my subclass instances do clean up if necessary "! !

!AppCommand class methodsFor: 'instance creation'!
presenter: aPresenter
	^ self new
		presenter: aPresenter ;
		yourself! !

!AppFlipHCommand methodsFor: 'command'!
execute
	self imageMorph image: (self imageMorph form flippedBy: #vertical)! !

!AppFlipHCommand methodsFor: 'command'!
unexecute
	self execute! !

!AppFlipVCommand methodsFor: 'command'!
execute
	self imageMorph image: (self imageMorph form flippedBy: #horizontal)! !

!AppFlipVCommand methodsFor: 'command'!
unexecute
	self execute! !

!AppRotateCommand methodsFor: 'accessing'!
degrees: angle
	degrees := angle ! !

!AppRotateCommand methodsFor: 'accessing'!
execute
	self imageMorph image: (self rotatedBy: degrees)! !

!AppRotateCommand methodsFor: 'accessing'!
unexecute
	self imageMorph image: (self rotatedBy: degrees negated)! !

!AppRotateCommand methodsFor: 'transformation'!
rotatedBy:  angle
	| originalForm rot warp r1 pts p center |
	originalForm := self imageMorph form.
	rot := Form extent: originalForm height @ originalForm width depth: originalForm depth.
	center := rot extent // 2.

	"Now compute the sin and cos constants for the rotation angle." 
	warp := (WarpBlt toForm: rot)
		sourceForm: originalForm ;
		colorMap: (originalForm colormapIfNeededFor: rot);
		cellSize: 1;  
		combinationRule: Form over.
	r1 := rot boundingBox aligned: center with: originalForm boundingBox center.

	pts := r1 innerCorners collect: [ :pt |
		p := pt - r1 center.
		(r1 center x asFloat + (p x asFloat*angle degreeCos) + (p y asFloat*angle degreeSin)) @
		(r1 center y asFloat - (p x asFloat*angle degreeSin) + (p y asFloat*angle degreeCos))].
	warp copyQuad: pts toRect: rot boundingBox.
	^ rot! !

!AppZoomInCommand methodsFor: 'command'!
execute
	self imageMorph image: (self imageMorph form magnifyBy: 2)! !

!AppZoomInCommand methodsFor: 'command'!
unexecute
	self imageMorph image: (self imageMorph form magnifyBy: 0.5)! !

!AppZoomOutCommand methodsFor: 'command'!
execute
	cacheForm := self imageMorph form.
	self imageMorph image: (cacheForm magnifyBy: 0.5)! !

!AppZoomOutCommand methodsFor: 'command'!
unexecute
	self imageMorph image: cacheForm! !

!AppZoomOutCommand methodsFor: 'as yet unclassified'!
release
	cacheForm := nil! !

!AppCommandManager methodsFor: 'dependents access'!
release
	stack 	contents do: [:c | c release].
	stack 	resetToStart ! !

!AppCommandManager methodsFor: 'initialization'!
initialize
	stack _ AppCommandStack new! !

!AppCommandManager methodsFor: 'command exec'!
flipHorizontally
	|command|
	command := stack nextPut: (AppFlipHCommand presenter: presenter).
	^command execute! !

!AppCommandManager methodsFor: 'command exec'!
flipVertically
	|command|
	command := stack nextPut: (AppFlipVCommand presenter: presenter).
	^command execute! !

!AppCommandManager methodsFor: 'command exec'!
redo
|command|
	command _ stack next.
	command ifNotNil:	[command execute]! !

!AppCommandManager methodsFor: 'command exec'!
rotateLeft
	|command|
	command := stack nextPut: (AppRotateCommand presenter: presenter).
	command degrees: -90.
	^command execute! !

!AppCommandManager methodsFor: 'command exec'!
rotateRight
	|command|
	command := stack nextPut: (AppRotateCommand presenter: presenter).
	command degrees: 90.
	^command execute! !

!AppCommandManager methodsFor: 'command exec'!
undo
|command|
	command _ stack previous.
	command ifNotNil: [command unexecute]! !

!AppCommandManager methodsFor: 'command exec'!
zoomIn
	|command|
	command := stack nextPut: (AppZoomInCommand presenter: presenter).
	^command execute! !

!AppCommandManager methodsFor: 'command exec'!
zoomOut
	|command|
	command := stack nextPut: (AppZoomOutCommand presenter: presenter).
	^command execute! !

!AppCommandManager methodsFor: 'accessing'!
presenter: aPresenter
	presenter := aPresenter ! !

!AppDomain methodsFor: 'accessing'!
fileEntry
	^ fileEntry ! !

!AppDomain methodsFor: 'accessing'!
fileEntry: aFileEntry
	fileEntry := 	aFileEntry.
	self triggerEvent: #newImageSelected! !

!AppDomain methodsFor: 'accessing'!
labelString
	^ String streamContents: [:str |
		str nextPutAll: 'Image Viewer -- ' translated.
		str nextPutAll:	(
			fileEntry 
				ifNotNil: [fileEntry baseName ] 
				ifNil: [Date today asString] ) ]! !

!AppControlManager methodsFor: 'accessing'!
presenter: aPresenter
	presenter := aPresenter ! !

!AppControlManager methodsFor: 'accessing'!
view
	^ view! !

!AppControlManager methodsFor: 'controls data'!
flipHorizontallyButtonData
" label - iconName - callback - description "
	^ {'Flip H' translated . #mirrorH . #flipHorizontally . 'Flip the picture horizontally.' translated }! !

!AppControlManager methodsFor: 'controls data'!
flipVerticallyButtonData
" label - iconName - callback - description "
	^ {'Flip V' translated . #mirrorV . #flipVertically . 'Flip the picture vertically.' translated }! !

!AppControlManager methodsFor: 'controls data'!
openButtonData
" label - iconName - callback - description "
	^ {'Open' translated . #open . #openImage . 'Select a picture to visualize and to operate with.' translated }! !

!AppControlManager methodsFor: 'controls data'!
redoButtonData
" label - iconName - callback - description "
	^ {'Redo' translated . #redo . #redo . 'Redo the last undone operation.' translated }! !

!AppControlManager methodsFor: 'controls data'!
rotateLeftButtonData
" label - iconName - callback - description "
	^ {'Rotate Left' translated . #rotateLeft . #rotateLeft . 'Rotate the picture of 90 degrees to the left.' translated }! !

!AppControlManager methodsFor: 'controls data'!
rotateRightButtonData
" label - iconName - callback - description "
	^ {'Rotate Right' translated . #rotateRight . #rotateRight . 'Rotate the picture of 90 degrees to the right.' translated }! !

!AppControlManager methodsFor: 'controls data'!
undoButtonData
" label - iconName - callback - description "
	^ {'Undo' translated . #undo . #undo . 'Undo the last operation.' translated }! !

!AppControlManager methodsFor: 'controls data'!
zoomInButtonData
" label - iconName - callback - description "
	^ {'Zoom In' translated . #zoomIn . #zoomIn . 'Zoom in the picture.' translated }! !

!AppControlManager methodsFor: 'controls data'!
zoomOutButtonData
" label - iconName - callback - description "
	^ {'Zoom Out' translated . #zoomOut . #zoomOut . 'Zoom out the picture.' translated }! !

!AppControlManager methodsFor: 'initialization'!
initialize
	icons := AppIconManager path: AppSystem iconsPath ! !

!AppControlManager methodsFor: 'tools collection'!
appTools
	^ #(open spacer undo redo spacer rotateLeft rotateRight flipVertically flipHorizontally zoomIn zoomOut)! !

!AppControlManager methodsFor: 'view'!
installAppView
	| scroller |
	view := AppView for: presenter.
	scroller := PluggableScrollPane new :: 
		layoutSpec: LayoutSpec useAll;
		scroller: view imageMorph.	
	view 
		addMorph: self appToolbar 
		layoutSpec: (LayoutSpec fixedHeight: AppSystem iconToolbarSize + 4).
	view addMorph: scroller
	! !

!AppControlManager methodsFor: 'widget'!
appToolbar
	| toolbar |
	toolbar := LayoutMorph newRow 
		separation: 5; 
		yourself.
	self appTools do: [:aTool | 
		aTool == #spacer 
			ifTrue: [toolbar addMorphUseAll: self class spacer]
			ifFalse: [	toolbar addMorph: (self button: aTool )] ].
	^ toolbar! !

!AppControlManager methodsFor: 'widget'!
button: symbol
	"array first = menu label or button label
	array second = button form = section mode
	array third = symbol callback
	array fourth = help string	"	
	| array |
	array := self perform: (symbol, #ButtonData) asSymbol.
	^ ButtonMorph 
		model: presenter
		action: array third ::
		enableSelector: (symbol == #open ifTrue: [true] ifFalse: [#isButtonActive]);
		icon: (icons get: array second size: AppSystem iconToolbarSize);
		setBalloonText: array fourth;
		color: AppSystem buttonColor ;
		selectedColor: AppSystem buttonSelectedColor ;
		borderColor: AppSystem buttonColor muchDarker;
		borderWidth: 2;
		morphExtent: (AppSystem iconToolbarSize + 4) asPoint;
		yourself	! !

!AppControlManager class methodsFor: 'instance creation'!
for: aPresenter
	^ self new
		presenter: aPresenter;
		yourself! !

!AppControlManager class methodsFor: 'widget'!
spacer
	^ BoxedMorph new 
		borderWidth: 0;
		color: Color transparent; 
		yourself! !

!AppIconManager methodsFor: 'accessing'!
get: iconSymbolWithSize
" icons get: #blank32 "
	| size |
	(size := iconSymbolWithSize select: [:c | c isDigit ]) 
		ifEmpty: [self error: 'Missing size in icon symbol'].
	^ self 
		get: (iconSymbolWithSize select: [:c | c isLetter ])
		size: size asNumber! !

!AppIconManager methodsFor: 'accessing'!
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

!AppIconManager methodsFor: 'accessing'!
path: iconsDirectoryEntry
	path := iconsDirectoryEntry ! !

!AppIconManager methodsFor: 'initialization'!
initialize
	forms := Dictionary new.! !

!AppIconManager class methodsFor: 'instance creation'!
path: aDriectoryEntry
	^ self new ::
		path: aDriectoryEntry;
		yourself! !

!AppPlatform methodsFor: 'ui'!
iconToolbarSize
	^ 64! !

!AppPlatform methodsFor: 'path' stamp: 'hlsf 10/27/2023 17:38:08'!
iconsPath
	^ self rootPath / 'Resources' / 'icons'! !

!AppPlatform methodsFor: 'path' stamp: 'hlsf 10/27/2023 17:38:32'!
picturesPath
	^ self rootPath! !

!AppPlatform methodsFor: 'path'!
rootPath
"CuisApp/ directory"
	^ DirectoryEntry smalltalkImageDirectory parent parent! !

!AppDevelopment methodsFor: 'path'!
iconsPath
	^ self rootPath / 'resources' / 'graphics' / 'icons'! !

!AppDevelopment methodsFor: 'path'!
rootPath
"CuisApp/ directory"
	^ DirectoryEntry smalltalkImageDirectory / 'CuisApp'! !

!AppSystem class methodsFor: 'path'!
iconsPath
	^ platform iconsPath! !

!AppSystem class methodsFor: 'path'!
picturesPath
	^ platform picturesPath ! !

!AppSystem class methodsFor: 'ui'!
buttonColor
	^ Color lightGray ! !

!AppSystem class methodsFor: 'ui'!
buttonSelectedColor
	^ Color gray muchLighter ! !

!AppSystem class methodsFor: 'ui'!
iconToolbarSize
" Size of the squared icons in the top toolbar"
	^ platform iconToolbarSize ! !

!AppSystem class methodsFor: 'class initialization'!
beApplication
	platform := AppPlatform new! !

!AppSystem class methodsFor: 'class initialization'!
beDevelopment
	platform := AppDevelopment new! !

!AppSystem class methodsFor: 'install' stamp: 'hlsf 11/2/2023 15:56:19'!
install
	| world |
	Transcript
 		showOnDisplay: false;
   		logToFile: true;
		logToStdout: true.
	Smalltalk at: #LogStartupDebugAids put: true.
	Preferences at: #logDebuggerStackToFile put: true.
	ChangeSet installNewUpdates.
	'Finalizing installation...' print.
	"Set Locale and text domains"
	Preferences at: #useLocale put: true.
	TextDomainManager registerCategoryPrefix: 'CuisApp' domain: 'cuisapp'.
	self beApplication .
	Smalltalk condenseChanges.
	Smalltalk garbageCollect.
	world := UISupervisor ui.
[
	(Delay forSeconds: 1) wait.
	UISupervisor whenUIinSafeState: [	
		"Remove all morphs"
		(world submorphs reject: [:aMorph | aMorph is: #TaskbarMorph]) 
			do: [:each | each delete].
		'Morphs deleted' print.
		Smalltalk garbageCollect.
		'Image cleaned' print.
		'Installation ended' print.
		'Saving image...' print.
		Smalltalk saveAndQuit]
] fork
! !

| world list area morph extent |
Display fullScreenMode: true.
"Report by any mean error"
Transcript
   showOnDisplay: false;
   logToFile: true;
   logToStdout: true.
Smalltalk at: #LogStartupDebugAids put: true.
"Install change set"
ChangeSet installNewUpdates.
"System configurations"
Utilities setAuthorName: 'Hilaire Fernandes' initials: 'hlsf'.
"System configurations"
Preferences at: #logDebuggerStackToFile put: true.
Preferences at: #autoNumberUserChanges put: false.
"Adjust font size"
Preferences at: #defaultFontSize put: 10.
"Install CuisApp code"
Feature require: 'CuisApp'.
world := UISupervisor ui.
[
	(Delay forSeconds: 1) wait.
	UISupervisor whenUIinSafeState: [
		"Delete all windows but the taskbar"
		list := world submorphs reject: [:aMorph | aMorph is: #TaskbarMorph].
		list do: [:each | each delete].
		"Adjust taskbar size"
		morph := world taskbar.
		morph scale: 1/2.
		"Compute the available free space for windows placement"
		area := RealEstateAgent maximumUsableArea extendBy: 0 @ morph morphHeight negated.
		extent := area extent // 2.
		"Open a few System Browsers"
		Browser open 
			morphPosition: 0@0;
			morphExtent: extent.
		Browser open 
			morphPosition: area width // 2 @ 0; 
			morphExtent: extent.
		"Open a System Browser on a specific class"
		morph := Browser open 
			morphPosition: area extent // 2;
			morphExtent: extent.
		morph model setClass: (Smalltalk at: #App) selector: nil.
		"Open a Workspace with some default contents"
		morph := Workspace open.
		morph model actualContents: 'ChangeSet installNewUpdates.
AppSystem beDevelopment.
App new.
TextDomainManager registerCategoryPrefix: ''CuisApp'' domain: ''cuisapp''.
GetTextExporter exportTemplate'.
		morph 
			morphPosition: 0 @ (area height // 2);
			morphExtent: extent x @ (2 / 3 * extent y).
		"Open a transcript for logs"
		Transcript open 
			morphPosition: 0 @ (area height // 2 + (2 / 3 * extent y));
			morphExtent: extent x @ (1 / 3 * extent y ).
		Smalltalk saveImage
	]
] fork

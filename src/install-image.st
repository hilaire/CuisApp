"Report by any mean installation and run time"
Transcript
   showOnDisplay: false;
   logToFile: true;
   logToStdout: true.
Smalltalk at: #LogStartupDebugAids put: true.
ChangeSet installNewUpdates.
Feature require: 'CuisApp'.
(Smalltalk at: #AppSystem) perform: #install.
'Saving image...' print.
UISupervisor whenUIinSafeState: [Smalltalk saveAndQuit].

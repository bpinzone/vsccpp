## XCode and C++ Projects with Existing External Build Systems
### How to use XCode to debug a project with an existing build system.
* Make a blank xcode project. Cross-Platform -> External Build System
* Quit XCode. Drag the .xcodeproj file into your current project directory.
* Open the xcode project
* Click File -> Add Files to ...
    * Add all your files.
    * Uncheck "copy items if needed"
* Build the project. (Make sure you have your executable file.)
* Go to Product -> Scheme -> Edit Scheme
    * Go to Run -> Info -> Executable
        * Select your executable file.
* You should be able to build, set break points, and debug!

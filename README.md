This repository contains the YCSB benchmark, plus additional code for running it with [CacheManager](https://github.com/jigarkb/CacheManager).

* Make a RAMCloud install directory visible at "ramcloud". RAMCloud itselfis not included in this repository, so you must clone a RAMCloud repository someplace else and build it. Once you've done that, then run "make install" in the RAMCloud directory and create a symbolic from "ramcloud" in this directory to the RAMCloud ddirectory where you ran "make install". Alternatively, you can run "make install INSTALL_DIR=xxx" in the RAMCloud directory, where "xxx" refers to "ramcloud" in this directory.
* Build CacheManager java artifacts and create symbolic from ramcloud/lib/ramcloud to CacheManager.jar.
* Run "make" in this directory to compile YCSB and additional supporting code.
* Edit the file "runYcsbCM" and modify the configuration options near the top of that file to specify the experiments you want to run. 
* Invoke runYcsb from your command-line. Log files and other information
  will be stored in the "logs" subdirectory.

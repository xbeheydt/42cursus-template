# 42 Cursus - Template

This is a 42 project template helps to create and generate a base skeletal project directory. The template is `make` and `cmake` ready.

## Features

- Download template.
- Choice between `lib` and `exe` project type.
- Custom unit tests framework inside
- `make` receipes for build, debug and unit tests.
- `cmake` receipes for build, debug, and unit tests with ctest support.
- GNU/Linux or macOS compatible.

## Usage

### Project downloader and generator

```bash
curl -Ls https://raw.githubusercontent.com/xbeheydt/42cursus-template/master/run.sh \ 
| bash -s -- [lib | exe] <project-name> [--local]
```

### Makefile

**Settings**

Settings could be modified inside project.

- `NAME` : project name.
- `HEADERS` : header files list in projet.
- `INCLUDES` : folders list where find header files, its auto generate from the variable `HEADER`.
- `SRCS` : source files auto added by wildcard from `src` folder.
- `LINKS` : folders list to link libs in compilation with auto add the flag `-L`.
- `LIBS` : lib names without the string `lib`prefix wiith auto add the flag `-l`.
- `TESTS` : test source files list auto added by wildcard from `tests` folder.

**Variables**

Variables helps to configure where targets build project. Some variables could be setted by variable environments.

- `BUILD_DIR` : root dir fo all build files (default : `<current-path>/build`)[1]
- `OBJ_DIR` : folder where object files are generated (default : `<current-path>/build/obj`)[1]
- `INCLUDE_DIR` : folder where header files are copied (default : `<current-path>/build/include`)[1]
- `LIB_DIR` : folder where lib files are generated (default : `<current-path>/build/lib`)[1]
- `EXE_DIR` : folder where executable files are generated : (default : `<current-path>/build/bin`)[1]
- `SRC_DIR` : folder where sources files are located (default : `<project-toplevel>/src`)[2]
- `HEADER_DIR` : folder where header files are located (default : `<project-toplevel>/include`)[2]
- `TEST_DIR` : folder where test files are located (default : `<project-toplevel>/tests`)[2]
- `DISABLE_ERROR`: variable environment defined disables all errors generated by compilator.[3]

[1] : _Variables could be setted by variable environments or inside the Makefile._

[2] : _Variables could be setted only inside the Makefile._

[3] : _Variables could be setted only by variable environments._

**Receipes**

- `all` or `$(NAME)` : builds library or executable, default receipe is `all`.
- `$(OBJ_DIR)/%.o: %c` : compiles object files from source files folder to object files build folder.
- `$(INCLUDE_DIR)/%: ${HEADER_DIR}/%` : copies headers files from include source folder to include build folder.
- `${LINKS}/%` : invokes make in library dependencies.
- `clean` : deletes object files.
- `fclean` : calls the clean receipe and deletes library or executable of project.
- `tclean` : deletes tests executable.
- `norm` : runs norminette on project source files and header files.
- `tests` : runs unit tests and accepts `ARGS` variable environment to pass arguments into tests.
- `ctests` : runs unit tests thru `ctest` and accepts `ARGS` variable environment to pass arguments into ctest.

## TODO

- ADD cmake usage in README.md
- ADD C++ support.
- ADD Documentations ready.
- ADD files generators for sources, headers, test files and documentation files.
- TODO make cunits42 doc in tests/README.md

## Credit

- [Xavier Beheydt](https://github.com/xbeheydt)
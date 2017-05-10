# Fork of eProsima FastCDR that can cross-compile to ARM.
```
$ git clone git@github.com:tedostrem/Fast-CDR.git 
$ cd Fast-CDR
$ make arm # Installs into artifacts/
```

# Introduction #

**eProsima FastCDR** is a C++ library that provides two serialization mechanisms. One is the standard CDR serialization mechanism, while the other is a faster implementation that modifies the standard.

# Build #

**eProsima FastCDR** provides [CMake][cmake] scripts to build and install it. Also in [eProsima][eprosima] you can find packages for Linux using autotools and binaries for Windows.

[cmake]: http://www.cmake.org
[eprosima]: http://www.eprosima.com

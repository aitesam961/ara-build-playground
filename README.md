# ara-build-playground
A repository containing the build workflows and overall working with ara.

- The project in discussion: 
```
https://github.com/pulp-platform/ara
```
- The latest commit in account:

https://github.com/pulp-platform/ara/commit/2364635c379397a3bfbb2c9cd66720b86be41e29

## Build with provided Makefile workflow
The build and simulation scripts are provided but there are several issues, some of them are worked around successfully but some of them provide no clue of how to fix. 

Please check the [Detailed Makefile Build Logs](https://github.com/aitesam961/ara-build-playground/blob/main/readmeI.md) for an in depth log of the process, issues and their fixes.

Additional Link To ReadmeII.md
https://github.com/aitesam961/ara-build-playground/blob/main/readmeI.md


## Manually compile and simulate RTL with Questasim

**[IN-PROGRESS.....]**



The latest release of ara uses a 2 year older fork of CVA6 ([from mp-17](https://github.com/mp-17/cva6)) which was originally forked from [Pulp-platform/cva6](https://github.com/pulp-platform/cva6) and is not compatible with latest original CVA6 from OpenHW.

This makes ara unuseable with any SoC incorporating a newer release on CVA6. So it makes sense to independently simulate, verify and master the use and integration of ARA into another system.

After successful simulation of Ara-SoC (**L2+ARA+CVA6-(old enough to be called Ariane)**), I will try to incorporate ARA into latest release of CVA6 and make it usable with any other SoC.

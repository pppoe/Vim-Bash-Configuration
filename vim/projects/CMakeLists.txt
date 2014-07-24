cmake_minimum_required (VERSION 2.8)

###### Customization #####
set (VAR_ProjectName Binarization)
set (VAR_BIN_PREFIX "")
set (VAR_BINARIES bins/test.cpp)
set (VAR_USE_OpenMP TRUE)
set (VAR_USE_OpenCV TRUE)
set (VAR_USE_MKL FALSE)

###### Begin ######
project (${VAR_ProjectName})

if ("${DEBUG}" STREQUAL "YES")
    message("DEBUG MODE")
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ggdb")
else()
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3")
endif()
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")

##### OpenMP
if ( ${VAR_USE_OpenMP} )
    IF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
        set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fopenmp")
    ENDIF()
ENDIF()

##### OpenCV
find_package(OpenCV)
IF(OpenCV_FOUND)
    message("...using OpenCV ${OpenCV_LIBS}")
    include_directories(${OpenCV_INCLUDE_DIR})
ELSE()
    message("OpenCV is not found. You must install OpenCV")
    # exit early 
    return()
ENDIF()

##### MKL
if ( ${VAR_USE_MKL} )
    add_definitions (-DEIGEN_USE_MKL_ALL)

    IF(DEFINED ENV{MKLROOT})
        message("...using MKL found in $ENV{MKLROOT}")
        include_directories ($ENV{MKLROOT}/include)
    ELSE()
        message("MKLROOT is not defined. You must tell CMake where to find MKL")
        # exit early 
        return()
    ENDIF()

    IF(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
        link_directories ($ENV{MKLROOT}/lib/)
    ELSE()
        link_directories ($ENV{MKLROOT}/lib/intel64)
    ENDIF()

    set (LD_FLAGS_MKL mkl_intel_lp64 mkl_intel_thread mkl_core iomp5)
    set (LD_FLAGS ${LD_FLAGS} ${LD_FLAGS_MKL})
endif()

include_directories(.)
aux_source_directory (./shared/ shared_SRCs)

add_library (shared ${shared_SRCs})
target_link_libraries (shared ${LD_FLAGS} ${OpenCV_LIBS})

foreach (item ${VAR_BINARIES})
    string (REGEX REPLACE ".*/" "" tmp_item ${item})
    string (REGEX REPLACE ".cpp" "" abs_item ${tmp_item})
    set (TARGET ${VAR_BIN_PREFIX}${abs_item})
    add_executable (${TARGET} ${item})
    target_link_libraries (${TARGET}  
        shared
        ${LD_FLAGS}
        ${OpenCV_LIBS})
endforeach()
###### End ######

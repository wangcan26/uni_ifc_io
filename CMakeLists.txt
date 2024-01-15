cmake_minimum_required(VERSION 3.10)
cmake_policy(VERSION 3.10)

project(uni_ifc_io)

set(UNI_IFC_IO ${CMAKE_CURRENT_SOURCE_DIR})

list(APPEND CMAKE_MODULE_PATH
    ${UNI_IFC_IO}/cmake/defaults)

include(CXXDefaults)
add_definitions(${_UNI_CXX_DEFINITIONS})
set(CMAKE_CXX_FLAGS "${_UNI_CXX_FLAGS} ${CMAKE_CXX_FLAGS}")

include(ProjectDefaults)

#platform
set(PLATFORM_WIN32             FALSE CACHE INTERNAL "")
set(PLATFORM_ANDROID           FALSE CACHE INTERNAL "")
set(PLATFORM_MACOS             FALSE CACHE INTERNAL "")

if(WIN32)
  add_definitions(-DUNI_PLATFORM_WINDOWS=1)
else()
  if(${CMAKE_SYSTEM_NAME} STREQUAL "Android")
    add_definitions(-DUNI_PLATFORM_ANDROID=1)
    set(PLATFORM_ANDROID TRUE)
  elseif(${CMAKE_SYSTEM_NAME} STREQUAL "Darwin")
    add_definitions(-DUNI_PLATFORM_MACOS=1)
    set(PLATFORM_MACOS TRUE)
  else()
    message(FATAL_ERROR "Unsupported platform")
  endif()
endif(WIN32)

#options


#source
if(NOT PLATFORM_ANDROID)
    set(UNI_IO_TARGET uni_io)
    set(SOURCES main.cc)
    add_executable(${UNI_IO_TARGET} ${SOURCES})
endif()
cmake_minimum_required(VERSION 3.10)


# Grab the current CBMC version from config.inc
file(
  STRINGS src/config.inc CBMC_VERSION
  REGEX "CBMC_VERSION = (.*)")
string(REGEX REPLACE "CBMC_VERSION = (.*)" "\\1" CBMC_VERSION ${CBMC_VERSION})

# when config.inc changes we’ll need to reconfigure to check if the version changed
set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/src/config.inc")

project(greeting-tool VERSION ${CBMC_VERSION})

include(GNUInstallDirs)

add_library(libgreeter src/greeter.cpp)
target_include_directories(libgreeter
  PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDE_DIR})
target_compile_features(libgreeter PUBLIC cxx_std_17)

add_executable(greeter app/main.cpp)
target_link_libraries(greeter PRIVATE libgreeter)

include(CTest)

if(BUILD_TESTING)
  add_executable(greeter_test test/libgreeter/test.cpp)
  target_link_libraries(greeter_test PRIVATE libgreeter)
  add_test(NAME greeter_test COMMAND greeter_test)
endif()

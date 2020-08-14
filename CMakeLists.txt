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

add_library(greeter src/greeter.cpp)
target_include_directories(greeter
  PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDE_DIR})
target_compile_features(greeter PUBLIC cxx_std_17)

install(
  TARGETS greeter
  DESTINATION "${CMAKE_INSTALL_LIBDIR}")

install(
  DIRECTORY include/
  DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}")

add_executable(greeter-bin app/main.cpp)
target_link_libraries(greeter-bin PRIVATE greeter)
set_target_properties(greeter-bin
  PROPERTIES
    OUTPUT_NAME greeter)

install(
  TARGETS greeter-bin
  DESTINATION "${CMAKE_INSTALL_BINDIR}")


include(CTest)

if(BUILD_TESTING)
  add_executable(greeter_test test/libgreeter/test.cpp)
  target_link_libraries(greeter_test PRIVATE greeter)
  add_test(NAME greeter_test COMMAND greeter_test)
endif()

include(cmake/packaging.cmake)

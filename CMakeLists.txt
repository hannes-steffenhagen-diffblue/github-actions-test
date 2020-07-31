cmake_minimum_required(VERSION 3.10)
project(greeting-tool)


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

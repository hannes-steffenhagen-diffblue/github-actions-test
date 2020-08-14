set(CPACK_PACKAGE_NAME "greeting-tool")
set(CPACK_PACKAGE_VENDOR "Hannes")
set(CPACK_PACKAGE_CONTACT "hannes.steffenhagen@diffblue.com")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "A Hello World Project")

set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})

# This should always be set, just isn’t by default for awkward backward compatibility reasons
set(CPACK_VERBATIM_VARIABLES YES)
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/LICENSE.md")
set(CPACK_PACKAGE_RESOURCE_FILE_README "${CMAKE_CURRENT_SOURCE_DIR}/README.md")

# Automatically find dependencies for shared libraries
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS YES)

if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
  set(CPACK_GENERATOR TGZ DEB)
endif()

# Yes, this has to go at the bottom!
include(CPack)

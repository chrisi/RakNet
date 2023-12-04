cmake_minimum_required(VERSION 3.16)

set(RAKNET_INTERNAL_INCLUDE_DIRS
        ${RakNet_SOURCE_DIR}/Source
        ${RakNet_SOURCE_DIR}/DependentExtensions/openssl-1.0.0d/include
        ${RakNet_SOURCE_DIR}/DependentExtensions
        )

if (RAKNET_ENABLE_STATIC)
    add_subdirectory(LibStatic)
endif ()


if (RAKNET_ENABLE_DLL)
    add_subdirectory(DLL)
endif ()

file(GLOB ALL_HEADER_SRCS ${RakNet_SOURCE_DIR}/Source/*.h)
install(FILES ${ALL_HEADER_SRCS}
        DESTINATION "include/raknet"
)

install(EXPORT ${PROJECT_NAME}Targets
        FILE ${PROJECT_NAME}Targets.cmake
        NAMESPACE gtidev::
        DESTINATION lib/cmake/${PROJECT_NAME}
)

# Create a version file for the library
include(CMakePackageConfigHelpers)

write_basic_package_version_file(
        ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
        VERSION ${PROJECT_VERSION}
        COMPATIBILITY SameMajorVersion
)

# Install the package configuration files
install(FILES
        ${PROJECT_NAME}Config.cmake
        ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
        DESTINATION lib/cmake/${PROJECT_NAME}
)

set(CPACK_GENERATOR "DEB")
set(CPACK_PACKAGE_NAME ${CMAKE_PROJECT_NAME})
set(CPACK_PACKAGE_VENDOR "GTIDEV")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Christian Gebauer")

set(CPACK_PACKAGE_FILE_NAME "raknet") #provide a static name for curl upload in Jenkinsfile

include(CPack)

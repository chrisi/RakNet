include(CMakeFindDependencyMacro)

#TODO: do I actually need the following two lines?
#set(RakNet_INCLUDE_DIRS "${CMAKE_INSTALL_PREFIX}/include/raknet")
#set(RakNet_LIBRARIES "${CMAKE_INSTALL_PREFIX}/lib/libRakNetLibStatic.a")
#TODO: what's put in here in general?

include("${CMAKE_CURRENT_LIST_DIR}/RakNetTargets.cmake")

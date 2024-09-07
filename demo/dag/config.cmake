
# set
set(SOURCE)
set(OBJECT)
set(BINARY demo_nndeploy_dag)
set(DIRECTORY demo)
set(DEPEND_LIBRARY)
set(SYSTEM_LIBRARY)
set(THIRD_PARTY_LIBRARY)

# include
include_directories(${ROOT_PATH}/demo)

# SOURCE
file(GLOB_RECURSE SOURCE
  "${ROOT_PATH}/demo/dag/*.h"
  "${ROOT_PATH}/demo/dag/*.cc"
)
file(GLOB DEMO_SOURCE
  "${ROOT_PATH}/demo/*.h"
  "${ROOT_PATH}/demo/*.cc"
)
set(SOURCE ${SOURCE} ${DEMO_SOURCE})
# OBJECT
# BINARY
add_executable(${BINARY} ${SOURCE} ${SOURCE})
set_target_properties(${BINARY} PROPERTIES LINK_FLAGS "-Wl,--no-as-needed")
# DIRECTORY
set_property(TARGET ${BINARY} PROPERTY FOLDER ${DIRECTORY})
# DEPEND_LIBRARY
list(APPEND DEPEND_LIBRARY ${NNDEPLOY_FRAMEWORK_BINARY})
list(APPEND DEPEND_LIBRARY ${NNDEPLOY_DEPEND_LIBRARY})
list(APPEND DEPEND_LIBRARY ${NNDEPLOY_DEMO_DEPEND_LIBRARY})
target_link_libraries(${BINARY} ${DEPEND_LIBRARY}) 
# SYSTEM_LIBRARY
list(APPEND SYSTEM_LIBRARY ${NNDEPLOY_SYSTEM_LIBRARY})
list(APPEND SYSTEM_LIBRARY ${NNDEPLOY_DEMO_SYSTEM_LIBRARY})
target_link_libraries(${BINARY} ${SYSTEM_LIBRARY}) 
# THIRD_PARTY_LIBRARY
list(APPEND THIRD_PARTY_LIBRARY ${NNDEPLOY_THIRD_PARTY_LIBRARY})
list(APPEND THIRD_PARTY_LIBRARY ${NNDEPLOY_PLUGIN_THIRD_PARTY_LIBRARY})
list(APPEND THIRD_PARTY_LIBRARY ${NNDEPLOY_DEMO_THIRD_PARTY_LIBRARY})
list(APPEND THIRD_PARTY_LIBRARY ${NNDEPLOY_PLUGIN_LIST})
target_link_libraries(${BINARY} ${THIRD_PARTY_LIBRARY}) 
# install
if(SYSTEM.Windows)
  install(TARGETS ${BINARY} RUNTIME DESTINATION ${NNDEPLOY_INSTALL_BIN_PATH})
else() 
  install(TARGETS ${BINARY} RUNTIME DESTINATION ${NNDEPLOY_INSTALL_LIB_PATH})
endif()

# unset
unset(SOURCE)
unset(OBJECT)
unset(BINARY)
unset(DIRECTORY)
unset(DEPEND_LIBRARY)
unset(SYSTEM_LIBRARY)
unset(THIRD_PARTY_LIBRARY)
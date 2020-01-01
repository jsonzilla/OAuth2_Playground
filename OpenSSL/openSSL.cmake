if (WIN32)
  add_library(libcrypto SHARED IMPORTED)
  add_library(libssl SHARED IMPORTED)

  set(BIN_DIR "${CMAKE_CURRENT_LIST_DIR}/bin")
  set(LIB_DIR "${CMAKE_CURRENT_LIST_DIR}/lib")

  set_target_properties(
    libcrypto
    PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_LIST_DIR}/include"
    IMPORTED_LOCATION "${BIN_DIR}/libcrypto-3.dll"
    IMPORTED_IMPLIB   "${LIB_DIR}/libcrypto.lib"
    FOLDER "component"
  )

  set_target_properties(
    libssl
    PROPERTIES
    INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_CURRENT_LIST_DIR}/include"
    IMPORTED_LOCATION "${BIN_DIR}/libssl-3.dll"
    IMPORTED_IMPLIB   "${LIB_DIR}/libssl.lib"
    FOLDER "component"
  )

  if(CMAKE_INSTALL_PREFIX)
    install(
      FILES
      "${BIN_DIR}/libssl-3.dll"
      "${BIN_DIR}/libcrypto-3.dll"
      DESTINATION ${CMAKE_INSTALL_PREFIX}
      OPTIONAL COMPONENT "unity"
    )
  endif(CMAKE_INSTALL_PREFIX)
endif (WIN32)

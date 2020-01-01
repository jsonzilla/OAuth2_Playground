cmake_minimum_required(VERSION 3.8)

project(OAuth2_Playground)
include(gtest.cmake)

get_filename_component(CURRENT_SOURCE_DIR ../ ABSOLUTE)
include("${CURRENT_SOURCE_DIR}/OpenSSL/openSSL.cmake")

file (GLOB_RECURSE headers "${CURRENT_SOURCE_DIR}/cpp-httplib/*.h"
                           "${CURRENT_SOURCE_DIR}/jwt-cpp/include/*.h"
                           "${CURRENT_SOURCE_DIR}/jwt-cpp/include/*.hpp"
                           "${CURRENT_SOURCE_DIR}/OpenSSL/include/*.h")

add_executable(OAuth2_Playground
    main.cpp
    ${headers}
    ${sources}
    )

file(GLOB sourcesTests "unit_fixture.cpp")
file(GLOB headersTests "unit_fixture.h")
add_executable(tests
    "unit_tests.cpp"
    ${headers}
    ${sources}
    ${headersTests}
    ${sourcesTests}
    )

target_include_directories(OAuth2_Playground
    PUBLIC
    "${CURRENT_SOURCE_DIR}/cpp-httplib/"
    "${CURRENT_SOURCE_DIR}/jwt-cpp/include"
    "${CURRENT_SOURCE_DIR}/OpenSSL/include"
)

target_include_directories(tests
    PUBLIC
    "${CURRENT_SOURCE_DIR}/cpp-httplib/"
    "${CURRENT_SOURCE_DIR}/jwt-cpp/include"
    "${CURRENT_SOURCE_DIR}/OpenSSL/include"
)

find_package (Threads)
target_link_libraries(OAuth2_Playground gtest libcrypto libssl ${CMAKE_THREAD_LIBS_INIT})
target_link_libraries(tests gtest libcrypto libssl  ${CMAKE_THREAD_LIBS_INIT})

if (MSVC)
    target_compile_options(tests PRIVATE /std:c++14)

    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} /Ox")
    set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /Od")

    add_definitions(-DGTEST_HAS_TR1_TUPLE=0)
else()
    target_compile_options(OAuth2_Playground PRIVATE -std=c++11 -g -fpermissive)
    target_compile_options(tests PRIVATE -std=c++11 -g -fpermissive)
endif()





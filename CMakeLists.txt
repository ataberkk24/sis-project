cmake_minimum_required(VERSION 3.16)

project(sis
    VERSION 0.1.0
    DESCRIPTION "Student Information System (C++ CLI + PostgreSQL)"
    LANGUAGES CXX)

# Modern C++ (the specification requires C++11 or higher)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)
endif()

# libpqxx (PostgreSQL C++ client) is located through pkg-config
find_package(PkgConfig REQUIRED)
pkg_check_modules(PQXX REQUIRED IMPORTED_TARGET libpqxx)

add_executable(sis-app
    src/main.cpp
)

target_include_directories(sis-app PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)
target_compile_definitions(sis-app PRIVATE SIS_VERSION="${PROJECT_VERSION}")
target_compile_options(sis-app PRIVATE -Wall -Wextra -Wpedantic)
target_link_libraries(sis-app PRIVATE PkgConfig::PQXX)

install(TARGETS sis-app RUNTIME DESTINATION bin)

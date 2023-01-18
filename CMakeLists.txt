cmake_minimum_required(VERSION 3.5)

project(TransInterface)

if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/include/GoInterface.h)
    message(STATUS "Shared lib exists, skip compile golang lib")
else()
    if(CMAKE_HOST_SYSTEM_NAME MATCHES "Linux")
        execute_process(
            COMMAND go build -o libGoInterface.so -buildmode=c-shared cmd/main.go
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
    elseif(CMAKE_HOST_SYSTEM_NAME MATCHES "Windows")
        execute_process(
            COMMAND go build -o libGoInterface.dll -buildmode=c-shared cmd/main.go
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})  
    else()
        message(FATAL_ERROR "Unknown Platform...")  
    endif()
    file(MAKE_DIRECTORY ./include)
    file(RENAME libGoInterface.h include/GoInterface.h)
endif()

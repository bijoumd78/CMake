set(_cache_file "${RunCMake_TEST_BINARY_DIR}/tmp/FOO-cache.cmake")

if(NOT EXISTS "${_cache_file}")
  set(RunCMake_TEST_FAILED "Initial cache not created")
  return()
endif()

file(READ "${_cache_file}" _cache)

if(NOT "${_cache}" MATCHES "set\\(FOO \"BAR\".+\\)") # \(\)
  set(RunCMake_TEST_FAILED "Cannot find FOO argument in cache")
  return()
endif()
if(NOT "${CMAKE_MATCH_0}" MATCHES FORCE)
  set(RunCMake_TEST_FAILED "Expected forced FOO argument")
  return()
endif()

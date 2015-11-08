include (FindPackageHandleStandardArgs)
include (CheckFunctionExists)

find_path(BLOCKS_RUNTIME_PUBLIC_INCLUDE_DIR Block.h
  DOC "Path to Block.h"
)

if (BLOCKS_RUNTIME_PUBLIC_INCLUDE_DIR)
  list (APPEND BLOCKS_RUNTIME_INCLUDE_DIRS ${BLOCKS_RUNTIME_PUBLIC_INCLUDE_DIR})
endif ()

find_path(BLOCKS_RUNTIME_PRIVATE_INCLUDE_DIR Block_private.h
  DOC "Path to Block_private.h"
)
if (BLOCKS_RUNTIME_PRIVATE_INCLUDE_DIR)
  list (APPEND BLOCKS_RUNTIME_INCLUDE_DIRS ${BLOCKS_RUNTIME_PRIVATE_INCLUDE_DIR})
  set (BLOCKS_RUNTIME_PRIVATE_HEADERS_FOUND TRUE)
endif ()

check_function_exists(BLOCKS_RUNTIME_RUNTIME_IN_LIBC _Block_copy)
if (NOT BLOCKS_RUNTIME_RUNTIME_IN_LIBC)
  find_library(BLOCKS_RUNTIME_LIBRARIES "BlocksRuntime")
endif ()

if (BLOCKS_RUNTIME_LIBRARIES OR BLOCKS_RUNTIME_RUNTIME_IN_LIBC)
  set (FOUND_BLOCKS_RUNTIME 1)
else ()
  set (FOUND_BLOCKS_RUNTIME 0)
endif()

find_package_handle_standard_args(BlocksRuntime
  REQUIRED_VARS FOUND_BLOCKS_RUNTIME BLOCKS_RUNTIME_PUBLIC_INCLUDE_DIR)


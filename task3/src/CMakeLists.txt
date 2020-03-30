add_library(buffer SHARED buffer.cpp)
if (ARM_BUILD)
  install(TARGETS buffer DESTINATION lib)
endif()

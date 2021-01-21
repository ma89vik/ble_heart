

list(APPEND SRC_FILES "micro-ecc/uECC.c")

list(APPEND INC_FOLDERS "micro-ecc/")


add_library(micro_ecc STATIC ${SRC_FILES})

target_compile_options(micro_ecc PRIVATE -Os -g3)

target_compile_definitions(micro_ecc PRIVATE uECC_ENABLE_VLI_API=1
                                            uECC_OPTIMIZATION_LEVEL=3
                                            uECC_SQUARE_FUNC=0
                                            uECC_SUPPORT_COMPRESSED_POINT=0
                                            uECC_VLI_NATIVE_LITTLE_ENDIAN=1)

target_include_directories(micro_ecc PUBLIC ${INC_FOLDERS})

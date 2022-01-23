project('ble_heart', 'c')

subdir('external/nrf_sdk')

subdir('src/app')


app_c_args = [
            '-DAPP_TIMER_V2',
            '-DAPP_TIMER_V2_RTC1_ENABLED',
            '-DBOARD_PCA10040',
            '-DCONFIG_GPIO_AS_PINRESET',
            '-DFLOAT_ABI_HARD',
            '-DNRF52',
            '-DNRF52832_XXAA',
            '-DNRF52_PAN_74',
            '-DNRF_SD_BLE_API_VERSION=7',
            '-DS132',
            '-DSOFTDEVICE_PRESENT',
            '-DUSE_APP_CONFIG',
            '-D__HEAP_SIZE=8192',
            '-D__STACK_SIZE=8192',

]

app_linker_args = [
    '-L' + join_paths(meson.current_source_dir(), 'src/'),
    '-T'+ join_paths(meson.current_source_dir(), 'src/app/app.ld')
]

executable('ble_heart_app', sdk_srcs + app_srcs, include_directories : [sdk_incs, app_incs], c_args : [app_c_args ], link_args: app_linker_args)
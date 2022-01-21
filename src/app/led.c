void rgb_led_init()
{
    nrf_gpio_cfg_output(RGB_1_PWR_PIN);
    nrf_gpio_cfg_output(RGB_2_PWR_PIN);

    nrf_gpio_pin_write(RGB_1_PWR_PIN, 0);
    nrf_gpio_pin_write(RGB_2_PWR_PIN, 0);
}
<?php
/**
 *
 * Plugin name: Dwebtech-Bot
 * Plugin URI:  https://dwebtech.net
 * Description: Tạo ra nhưng con BOT đơn hàng cho website .
 * Version:     1.9.6
 * Author:      Dwebtech
 * Author URI:  https://dwebtech.net
 * License:     GPLv2
 * Text Domain: dwebtech
 * Domain Path: /languages
 * WordPress Available:  yes
 * Requires License:    no
 */

function dwebtech_bot(){
  require_once(dirname(__FILE__).'/main.php');
}
add_action( 'wp_footer', 'dwebtech_bot' );
?>
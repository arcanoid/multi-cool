module ApplicationHelper
    def menu_items_in_array
        [
            {
                :name => 'Encoding Tools',
                :sub_menus => [
                    { :name => 'URL Encoder', :path => url_decoding_tool_tools_path },
                    { :name => 'Base64 Encoder', :path => base64_encoder_tools_path },
                    { :name => 'Hash generator', :path => hash_generator_tools_path },
                    { :name => 'Json Beautifier', :path => json_beautifier_tools_path },
                    { :name => 'Json to Ruby class converter', :path => json_to_ruby_class_tools_path },
                    { :name => 'XML Beautifier', :path => xml_beautifier_tools_path },
                    { :name => 'SQL Beautifier', :path => sql_beautifier_tools_path },
                    { :name => 'SSH Generator', :path => ssh_generator_tools_path },
                    { :name => 'Text analysis', :path => text_analysis_tools_path }
                ]
            },
            {
                :name => 'Web resources and Utilites',
                :sub_menus => [
                    { :name => 'URI parser', :path => uri_parser_web_resources_path },
                    { :name => 'Countries info', :path => countries_web_resources_path },
                    { :name => 'JSON comparer', :path => json_comparer_web_resources_path },
                    { :name => 'Date difference', :path => date_diff_web_resources_path },
                    { :name => 'User agent identifier', :path => user_agent_identifier_web_resources_path },
                    { :name => 'User agent info', :path => user_agent_info_web_resources_path }
                ]
            },
            {
                :name => 'UI Utilities',
                :sub_menus => [
                    { :name => 'Screenshot Snapper', :path => screenshot_snapper_utilities_path, :icon => 'fa-photo' },
                    { :name => 'QR code producer', :path => qr_code_producer_utilities_path, :icon => 'fa-qrcode' },
                    { :name => 'Credit Card validator', :path => credit_card_validator_utilities_path, :icon => 'fa-credit-card' },
                    { :name => 'RSS feed validator', :path => rss_feed_validator_utilities_path, :icon => 'fa-rss' },
                    { :name => 'Sprint Calculator', :path => sprint_calculator_utilities_path },
                    { :name => 'Rails log visualizer', :path => rails_logs_visualizer_utilities_path }
                ]
            },
            {
                :name => 'Format Converters',
                :sub_menus => [
                    { :name => 'XML to Json converter', :path => xml_to_json_format_conversions_path },
                    { :name => 'Json to XML converter', :path => json_to_xml_format_conversions_path }
                ]
            },
            {
                :name => 'Unit Converters',
                :sub_menus => [
                    { :name => 'Length converter', :path => length_conversion_conversions_path },
                    { :name => 'Weight converter', :path => weight_conversion_conversions_path },
                    { :name => 'Time converter', :path => time_conversion_conversions_path },
                    { :name => 'Area converter', :path => area_conversion_conversions_path },
                    { :name => 'Speed converter', :path => speed_conversion_conversions_path },
                    { :name => 'Temperature converter', :path => temperature_conversion_conversions_path },
                    { :name => 'Volume converter', :path => volume_conversion_conversions_path },
                    { :name => 'Energy converter', :path => energy_conversion_conversions_path },
                    { :name => 'Pressure converter', :path => pressure_conversion_conversions_path },
                    { :name => 'Power converter', :path => power_conversion_conversions_path }
                ]
            },
            {
                :name => 'Data generators',
                :sub_menus => [
                    { :name => 'Sample data generator', :path => sample_data_data_generation_path },
                    { :name => 'Geographical data generator', :path => geographical_sample_data_data_generation_path },
                    { :name => 'Monetary data generator', :path => monetary_sample_data_data_generation_path },
                    { :name => 'Internet data generator', :path => internet_sample_data_data_generation_path },
                    { :name => 'Commerece and Contact data generator', :path => commerce_and_contact_sample_data_data_generation_path },
                    { :name => 'Date and time generator', :path => date_and_time_sample_data_data_generation_path },
                    { :name => 'Text generator', :path => text_sample_data_data_generation_path }
                ]
            },
            {
                :name => 'Facts',
                :sub_menus => [
                    { :name => 'This day in history', :path => this_day_in_history_facts_path },
                    { :name => 'Random facts', :path => random_facts_facts_path },
                ]
            }
        ]
    end

    def device_literal(user_agent)
        literals = []

        literals << 'Safari' if user_agent.safari?
        literals << 'Opera' if user_agent.opera?
        literals << 'Opera Mini' if user_agent.opera_mini?
        literals << 'Chrome' if user_agent.chrome?
        literals << 'Firefox' if user_agent.firefox?
        literals << 'IE' if user_agent.ie?
        literals << 'Yandex' if user_agent.yandex?
        literals << 'Wechat' if user_agent.wechat?
        literals << 'Weibo' if user_agent.weibo?
        literals << 'Edge MS Browser' if user_agent.edge?

        literals << 'Blackberry Playbook device' if user_agent.device.blackberry_playbook?
        literals << 'Console device' if user_agent.device.console?
        literals << 'iPad device' if user_agent.device.ipad?
        literals << 'iPhone device' if user_agent.device.iphone?
        literals << 'iPod Touch device' if user_agent.device.ipod_touch?
        literals << 'Kindle device' if user_agent.device.kindle?
        literals << 'Kindle Fire device' if user_agent.device.kindle_fire?
        literals << 'Mobile device' if user_agent.device.mobile?
        literals << 'Nintendo device' if user_agent.device.nintendo?
        literals << 'Playstation device' if user_agent.device.playstation?
        literals << 'PS3 device' if user_agent.device.ps3?
        literals << 'PS4 device' if user_agent.device.ps4?
        literals << 'PSP device' if user_agent.device.psp?
        literals << 'Silk device' if user_agent.device.silk?
        literals << 'Surface device' if user_agent.device.surface?
        literals << 'Tablet device' if user_agent.device.tablet?
        literals << 'TV device' if user_agent.device.tv?
        literals << 'Vita device' if user_agent.device.vita?
        literals << 'WII device' if user_agent.device.wii?
        literals << 'WIIU device' if user_agent.device.wiiu?
        literals << 'XBOX device' if user_agent.device.xbox?
        literals << 'XBOX 360 device' if user_agent.device.xbox_360?
        literals << 'XBOX One device' if user_agent.device.xbox_one?

        literals << 'Adobe Air Platform' if user_agent.platform.adobe_air?
        literals << 'Android Platform' if user_agent.platform.android?
        literals << 'Blackberry Platform' if user_agent.platform.blackberry?
        literals << 'ChromeOS Platform' if user_agent.platform.chrome_os?
        literals << 'Firefox Platform' if user_agent.platform.firefox_os?
        literals << 'iOS Platform' if user_agent.platform.ios?
        literals << 'iOS App Platform' if user_agent.platform.ios_app?
        literals << 'iOS Webview Platform' if user_agent.platform.ios_webview?
        literals << 'Linux Platform' if user_agent.platform.linux?
        literals << 'Mac Platform' if user_agent.platform.mac?
        literals << 'Other Platform' if user_agent.platform.other?
        literals << 'Windows 10 Platform' if user_agent.platform.windows10?
        literals << 'Windows 7 Platform' if user_agent.platform.windows7?
        literals << 'Windows 8 Platform' if user_agent.platform.windows8?
        literals << 'Windows 8.1 Platform' if user_agent.platform.windows8_1?
        literals << 'Windows Platform' if user_agent.platform.windows?
        literals << 'Windows Mobile Platform' if user_agent.platform.windows_mobile?
        literals << 'Windows Phone Platform' if user_agent.platform.windows_phone?
        literals << 'Windows RT Platform' if user_agent.platform.windows_rt?
        literals << 'Touchscreen Desktop Platform' if user_agent.platform.windows_touchscreen_desktop?
        literals << 'Windows Vista Platform' if user_agent.platform.windows_vista?
        literals << 'Windows wow64 Platform' if user_agent.platform.windows_wow64?
        literals << 'Windows x64 Platform' if user_agent.platform.windows_x64?
        literals << 'Windows x64 Inclusive Platform' if user_agent.platform.windows_x64_inclusive?
        literals << 'Windows XP Platform' if user_agent.platform.windows_xp?

        literals.join(', ')
    end
end

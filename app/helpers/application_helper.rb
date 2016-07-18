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
                :name => 'Format Converters',
                :sub_menus => [
                    { :name => 'XML to Json converter', :path => xml_to_json_format_conversions_path },
                    { :name => 'Json to XML converter', :path => json_to_xml_format_conversions_path }
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
        literals << 'Chrome' if user_agent.chrome?
        literals << 'Firefox' if user_agent.firefox?
        literals << 'IE' if user_agent.ie?
        literals << 'Edge MS Browser' if user_agent.edge?
        literals << 'Chrome OS' if user_agent.chrome_os?
        literals << 'Mobile device' if user_agent.mobile?
        literals << 'Tablet device' if user_agent.tablet?
        literals << 'Console' if user_agent.console?
        literals << 'iOS' if user_agent.ios?
        literals << 'ios\' app webview' if user_agent.ios_webview?
        literals << 'Android' if user_agent.android?
        literals << 'Blackberry' if user_agent.blackberry?

        literals.join(', ')
    end
end

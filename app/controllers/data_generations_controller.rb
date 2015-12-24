class DataGenerationsController < ApplicationController
  def sample_data
    @basic_data = []

    @basic_data << { :type => 'Boolean', :value => Forgery('basic').boolean }
    @basic_data << { :type => 'Color', :value => Forgery('basic').color }
    @basic_data << { :type => 'Encrypt', :value => Forgery('basic').encrypt }
    @basic_data << { :type => 'Frequency', :value => Forgery('basic').frequency }
    @basic_data << { :type => 'HEX color', :value => Forgery('basic').hex_color }
    @basic_data << { :type => 'RGB color', :value => Faker::Color.rgb_color }
    @basic_data << { :type => 'HSL color', :value => Faker::Color.hsl_color }
    @basic_data << { :type => 'HSLA color', :value => Faker::Color.hsla_color }
    @basic_data << { :type => 'Number', :value => Forgery('basic').number }
    @basic_data << { :type => 'Short HEX color', :value => Forgery('basic').short_hex_color }
    @basic_data << { :type => 'Text', :value => Forgery('basic').text }

  end

  def text_sample_data
    @hacker_data = []
    @app_data = []
    @emoji_data = []
    @team_data = []
    @book_data = []
    @university_data = []
    @lorem_ipsum_data = []
    @hipster_data = []

    @hacker_data << { :type => 'Smart talk', :value => Faker::Hacker.say_something_smart }
    @hacker_data << { :type => 'Abbreviation', :value => Faker::Hacker.abbreviation }
    @hacker_data << { :type => 'Adjective', :value => Faker::Hacker.adjective }
    @hacker_data << { :type => 'Noun', :value => Faker::Hacker.noun }
    @hacker_data << { :type => 'Gerund', :value => Faker::Hacker.ingverb }

    @app_data << { :type => 'Name', :value => Faker::App.name }
    @app_data << { :type => 'Version', :value => Faker::App.version }
    @app_data << { :type => 'Author', :value => Faker::App.author }

    @team_data << { :type => 'Creature', :value => Faker::Team.creature }
    @team_data << { :type => 'Name', :value => Faker::Team.name }
    @team_data << { :type => 'State', :value => Faker::Team.state }
    @team_data << { :type => 'Sport', :value => Faker::Team.sport }

    @emoji_data << { :type => 'People', :value => Faker::SlackEmoji.people }
    @emoji_data << { :type => 'Nature', :value => Faker::SlackEmoji.nature }
    @emoji_data << { :type => 'Food and drink', :value => Faker::SlackEmoji.food_and_drink }
    @emoji_data << { :type => 'Celebration', :value => Faker::SlackEmoji.celebration }
    @emoji_data << { :type => 'Activity', :value => Faker::SlackEmoji.activity }
    @emoji_data << { :type => 'Travel and places', :value => Faker::SlackEmoji.travel_and_places }
    @emoji_data << { :type => 'Objects and symbols', :value => Faker::SlackEmoji.objects_and_symbols }
    @emoji_data << { :type => 'Custom', :value => Faker::SlackEmoji.custom }
    @emoji_data << { :type => 'Emoji', :value => Faker::SlackEmoji.emoji }

    @book_data << { :type => 'Title', :value => Faker::Book.title }
    @book_data << { :type => 'Author', :value => Faker::Book.author }
    @book_data << { :type => 'Publisher', :value => Faker::Book.publisher }
    @book_data << { :type => 'Genre', :value => Faker::Book.genre }

    @university_data << { :type => 'Name', :value => Faker::University.name }

    @hipster_data << { :type => 'Words', :value => Faker::Hipster.words }
    @hipster_data << { :type => 'Sentence', :value => Faker::Hipster.sentence }
    @hipster_data << { :type => 'Paragraphs', :value => Faker::Hipster.paragraphs }

    @lorem_ipsum_data << { :type => 'Character', :value => Forgery('lorem_ipsum').character }
    @lorem_ipsum_data << { :type => 'Characters', :value => Forgery('lorem_ipsum').characters }
    @lorem_ipsum_data << { :type => 'Lorem ipsum characters', :value => Forgery('lorem_ipsum').lorem_ipsum_characters }
    @lorem_ipsum_data << { :type => 'Lorem ipsum words', :value => Forgery('lorem_ipsum').lorem_ipsum_words }
    @lorem_ipsum_data << { :type => 'Paragraph', :value => Forgery('lorem_ipsum').paragraph }
    @lorem_ipsum_data << { :type => 'Paragraphs', :value => Forgery('lorem_ipsum').paragraphs }
    @lorem_ipsum_data << { :type => 'Sentence', :value => Forgery('lorem_ipsum').sentence }
    @lorem_ipsum_data << { :type => 'Sentences', :value => Forgery('lorem_ipsum').sentences }
    @lorem_ipsum_data << { :type => 'Text', :value => Forgery('lorem_ipsum').text }
    @lorem_ipsum_data << { :type => 'Title', :value => Forgery('lorem_ipsum').title }
    @lorem_ipsum_data << { :type => 'Word', :value => Forgery('lorem_ipsum').word }
    @lorem_ipsum_data << { :type => 'Words', :value => Forgery('lorem_ipsum').words }
  end

  def geographical_sample_data
    @address_data = []
    @geo_data = []

    @address_data << { :type => 'City', :value => Faker::Address.city }
    @address_data << { :type => 'City prefix', :value => Faker::Address.city_prefix }
    @address_data << { :type => 'City suffix', :value => Faker::Address.city_suffix }
    @address_data << { :type => 'Continent', :value => Forgery('address').continent }
    @address_data << { :type => 'Country', :value => Faker::Address.country }
    @address_data << { :type => 'Country code', :value => Faker::Address.country_code }
    @address_data << { :type => 'Phone', :value => Forgery('address').phone }
    @address_data << { :type => 'Province', :value => Forgery('address').province }
    @address_data << { :type => 'Province abbreviation', :value => Forgery('address').province_abbrev }
    @address_data << { :type => 'State', :value => Faker::Address.state }
    @address_data << { :type => 'State abbreviation', :value => Faker::Address.state_abbr }
    @address_data << { :type => 'Street address', :value => Faker::Address.street_address }
    @address_data << { :type => 'Street name', :value => Faker::Address.street_name }
    @address_data << { :type => 'Street number', :value => Forgery('address').street_number }
    @address_data << { :type => 'Street suffix', :value => Forgery('address').street_suffix }
    @address_data << { :type => 'Street zip', :value => Forgery('address').zip }
    @address_data << { :type => 'Secondary address', :value => Faker::Address.secondary_address }
    @address_data << { :type => 'Building number', :value => Faker::Address.building_number }

    @geo_data << { :type => 'Latitude', :value => Forgery('geo').latitude }
    @geo_data << { :type => 'Latitude degrees', :value => Forgery('geo').latitude_degrees }
    @geo_data << { :type => 'Latitude direction', :value => Forgery('geo').latitude_direction }
    @geo_data << { :type => 'Latitude minutes', :value => Forgery('geo').latitude_minutes }
    @geo_data << { :type => 'Latitude seconds', :value => Forgery('geo').latitude_seconds }
    @geo_data << { :type => 'Longitude', :value => Forgery('geo').longitude }
    @geo_data << { :type => 'Longitude degrees', :value => Forgery('geo').longitude_degrees }
    @geo_data << { :type => 'Longitude direction', :value => Forgery('geo').longitude_direction }
    @geo_data << { :type => 'Longitude minutes', :value => Forgery('geo').longitude_minutes }
    @geo_data << { :type => 'Longitude seconds', :value => Forgery('geo').longitude_seconds }
  end

  def monetary_sample_data
    @monetary_data = []
    @credit_card_data = []
    @currency_data = []

    @monetary_data << { :type => 'Formatted money', :value => Forgery('monetary').formatted_money }
    @monetary_data << { :type => 'Money', :value => Forgery('monetary').money }
    @monetary_data << { :type => 'ISBN', :value => Faker::Code.isbn }
    @monetary_data << { :type => 'EAN', :value => Faker::Code.ean }

    @credit_card_data << { :type => 'Credit card number', :value => Faker::Business.credit_card_number }
    @credit_card_data << { :type => 'Credit card type', :value => Faker::Business.credit_card_type }
    @credit_card_data << { :type => 'Credit card expiry date', :value => Faker::Business.credit_card_expiry_date }

    @currency_data << { :type => 'Currency symbol', :value => Forgery('currency').code }
    @currency_data << { :type => 'Currency description', :value => Forgery('currency').description }
  end

  def internet_sample_data
    @email_data = []
    @internet_data = []

    @email_data << { :type => 'Email address', :value => Forgery('email').address }
    @email_data << { :type => 'Free Email address', :value => Faker::Internet.free_email }
    @email_data << { :type => 'Safe Email address', :value => Faker::Internet.safe_email }
    @email_data << { :type => 'Email subject', :value => Forgery('email').subject }
    @email_data << { :type => 'Email body', :value => Forgery('email').body }

    @internet_data << { :type => 'CCTID', :value => Forgery('internet').cctld }
    @internet_data << { :type => 'Domain name', :value => Forgery('internet').domain_name }
    @internet_data << { :type => 'Domain word', :value => Faker::Internet.domain_word }
    @internet_data << { :type => 'Domain suffix', :value => Faker::Internet.domain_suffix }
    @internet_data << { :type => 'Top level domain', :value => Forgery('internet').top_level_domain }
    @internet_data << { :type => 'IPv4', :value => Forgery('internet').ip_v4 }

    # Guaranteed not to be in 10.0.0.0/8, 127.0.0.0/8, 169.254.0.0/16,
    # 172.16.0.0/12, or 192.168.0.0/16
    @internet_data << { :type => 'IPv4', :value => Faker::Internet.public_ip_v4_address }
    @internet_data << { :type => 'IPv6', :value => Forgery('internet').ip_v6 }
    @internet_data << { :type => 'URL', :value => Faker::Internet.url }
    @internet_data << { :type => 'Slug', :value => Faker::Internet.slug }
    @internet_data << { :type => 'MAC address', :value => Faker::Internet.mac_address }
    @internet_data << { :type => 'Username', :value => Forgery('internet').user_name }
    @internet_data << { :type => 'Password', :value => Faker::Internet.password }
    @internet_data << { :type => 'Bitcoin address', :value => Faker::Bitcoin.address }
    @internet_data << { :type => 'Bitcoin test address', :value => Faker::Bitcoin.testnet_address }
  end

  def commerce_and_contact_sample_data
    @personal_data = []
    @commerce_data = []
    @company_data = []
    @company_logo = Faker::Company.logo
    @phone_data = []

    @personal_data << { :type => 'Company name', :value => Forgery('name').company_name }
    @personal_data << { :type => 'Female first name', :value => Forgery('name').female_first_name }
    @personal_data << { :type => 'First name', :value => Forgery('name').first_name }
    @personal_data << { :type => 'Full name', :value => Forgery('name').full_name }
    @personal_data << { :type => 'Industry', :value => Forgery('name').industry }
    @personal_data << { :type => 'Job title', :value => Forgery('name').job_title }
    @personal_data << { :type => 'Job title suffix', :value => Forgery('name').job_title_suffix }
    @personal_data << { :type => 'Last name', :value => Forgery('name').last_name }
    @personal_data << { :type => 'Location', :value => Forgery('name').location }
    @personal_data << { :type => 'Male first name', :value => Forgery('name').male_first_name }
    @personal_data << { :type => 'Name prefix', :value => Faker::Name.prefix }
    @personal_data << { :type => 'Name suffix', :value => Forgery('name').suffix }
    @personal_data << { :type => 'Name title', :value => Forgery('name').title }
    @personal_data << { :type => 'Abbreviated gender', :value => Forgery('personal').abbreviated_gender }
    @personal_data << { :type => 'Gender', :value => Forgery('personal').gender }
    @personal_data << { :type => 'Language', :value => Forgery('personal').language }
    @personal_data << { :type => 'Race', :value => Forgery('personal').race }
    @personal_data << { :type => 'Shirt size', :value => Forgery('personal').shirt_size }

    @commerce_data << { :type => 'Department', :value => Faker::Commerce.department }
    @commerce_data << { :type => 'Product Name', :value => Faker::Commerce.product_name }
    @commerce_data << { :type => 'Price', :value => Faker::Commerce.price }

    @company_data << { :type => 'Name', :value => Faker::Company.name }
    @company_data << { :type => 'Suffix', :value => Faker::Company.suffix }
    @company_data << { :type => 'Catch-phrase', :value => Faker::Company.catch_phrase }
    @company_data << { :type => 'Company buzzword', :value => Faker::Company.buzzword }
    @company_data << { :type => 'Company bs', :value => Faker::Company.bs }
    @company_data << { :type => 'Company ein', :value => Faker::Company.ein }
    @company_data << { :type => 'Company duns number', :value => Faker::Company.duns_number }
    @company_data << { :type => 'Logo', :value => Faker::Company.logo }
    @company_data << { :type => 'Company swedish organization number', :value => Faker::Company.swedish_organisation_number }
    @company_data << { :type => 'Profession', :value => Faker::Company.profession }

    @phone_data << { :type => 'Phone number', :value => Faker::PhoneNumber.phone_number }
    @phone_data << { :type => 'Cell phone', :value => Faker::PhoneNumber.cell_phone }
    @phone_data << { :type => 'Subscriber number', :value => Faker::PhoneNumber.subscriber_number }
    @phone_data << { :type => 'Extension', :value => Faker::PhoneNumber.extension }
  end

  def date_and_time_sample_data
    @time_data = []
    @date_data = []

    @time_data << { :type => 'Timezone', :value => Forgery('time').zone }
    @time_data << { :type => 'Time @ night', :value => Faker::Time.between(2.days.ago, Time.now, :night) }
    @time_data << { :type => 'Time @ morning', :value => Faker::Time.between(2.days.ago, Time.now, :morning) }
    @time_data << { :type => 'Time @ afternoon', :value => Faker::Time.between(2.days.ago, Time.now, :afternoon) }
    @time_data << { :type => 'Time @ evening', :value => Faker::Time.between(2.days.ago, Time.now, :evening) }
    @time_data << { :type => 'Time @ midnight', :value => Faker::Time.between(2.days.ago, Time.now, :midnight) }

    @date_data << { :type => 'Date', :value => Forgery('date').date }
    @date_data << { :type => 'Day', :value => Forgery('date').day }
    @date_data << { :type => 'Day of week', :value => Forgery('date').day_of_week }
    @date_data << { :type => 'Month', :value => Forgery('date').month }
    @date_data << { :type => 'Year', :value => Forgery('date').year }
  end
end
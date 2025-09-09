
# class User
# 	attr_accessor :fname, :lname, :email
# 	def initialize(attributes = {}) 
# 		@fname = attributes[:fname] 
# 		@lname = attributes[:lname] 
# 		@email = attributes[:email]
# 	end

# 	def full_name
# 		"#{@fname} #{@lname}"
# 	end

# 	def alphabetical_name
# 		full_name.split
# 	end



# 	def formatted_email 
# 		"#{@name} #{@email}"
# 	end 
# end



# TDD: (test driven development)
# => write the test first, watch it fail, then write just enough code to make it pass, and finally refactor.
# [Refactor: Improve the code while keeping tests green.]


# TDD = Red → Green → Refactor
# Red: Write a test and watch it fail.
# Green: Write the minimal code to pass the test.
# Refactor: Improve the code while keeping tests green.

#(Red): Test लिखो → fail होना चाहिए .
#(Green): न्यूनतम कोड लिखो ताकि टेस्ट पास हो .
# (Refactor): कोड क्लीन करो लेकिन टेस्ट पास रहना चाहिए .
# (पहले टेस्ट(फेल) → कोड → पास)

# *** 
# yaml = yml
# YAML = YAML Ain’t Markup Language — "it’s a format for structured data."

# =>.yml files are often used to:

# Store configuration (like config/database.yml).
# Provide test fixtures (sample database records for tests).
# Manage translations (for I18n: config/locales/*.yml).
# types:
# 1. YAML Basics ; YAML uses indentation (spaces only, no tabs!) and key-value pairs.
# 	(i) 
# 	name: John Doe
# 	email: john@example.com
# 	age: 30

# 	(ii) 
# 	user:
# 	  first_name: John
# 	  last_name: Doe
# 	  email: john@example.com

# 	(iii)   
# 	fruits:
# 	  - apple
# 	  - banana
# 	  - orange

# 2. Rails uses YAML: 
#   (a) Database configuration — config/database.yml
#   (This tells Rails how to connect to the database:)

#   default: &default
# 	  adapter: postgresql
# 	  encoding: unicode
# 	  pool: 5

# 	development:
# 	  <<: *default
# 	  database: myapp_development

# 	test:
# 	  <<: *default
# 	  database: myapp_test

# 	(b) Fixtures for testing — test/fixtures/*.yml  
# 	# test/fixtures/users.yml
# 	one:
# 	  first_name: John
# 	  last_name: Doe
# 	  email: john@example.com

# 	two:
# 	  first_name: Jane
# 	  last_name: Smith
# 	  email: jane@example.com

# 	  test will like: 
# 	  users(:one)  # fetches John Doe
# 		users(:two)  # fetches Jane Smith

# 	(c) Translations — config/locales/en.yml
#   For internationalization (I18n):

#   en:
#   hello: "Hello world"
#   pages:
#     contact: "Contact Us"

#     In your view:
#     <%= t('pages.contact') %>

# Why use YML in testing?
# 	Rails में fixtures (YAML फाइलें) का इस्तेमाल इस लिए किया जाता है ताकि आप हर बार टेस्ट केस चलाते समय मैन्युअली डाटा न डालना पड़े। 
# 	Fixtures आपके लिए सैंपल डाटा पहले से लोड कर देती हैं और टेस्ट केस सीधे उसी डाटा पर काम कर सकते हैं।

# example: 
# 	अगर आप हर टेस्ट में ये डाटा खुद (manualy) बनाएंगे, तो ऐसा करना पड़ेगा:
# 	user = User.create(first_name: "John", last_name: "Doe", email: "john@example.com")

# लेकिन अगर आप fixtures का इस्तेमाल करते हैं, तो आप ये डाटा एक बार YAML फाइल में डाल देंगे।

# Step 1: Fixture बनाइए (test/fixtures/users.yml)

# one:
#   first_name: John
#   last_name: Doe
#   email: john@example.com

# two:
#   first_name: Jane
#   last_name: Smith
#   email: jane@example.com

# Step 2: टेस्ट में डाटा सीधे इस्तेमाल करें

# require "test_helper"

# class ContactPageTest < ActionDispatch::IntegrationTest
#   test "contact page shows user info" do
#     user = users(:one)   # यह डाटा YAML से ऑटोमैटिक आएगा
#     get "/contact"
#     assert_response :success
#     assert_select "body", /#{user.email}/
#   end
# end

# users(:one) → इसका मतलब है users.yml फाइल का one रिकॉर्ड ऑटोमैटिक लोड होगा।

# => Fixtures का मतलब है:
# डाटा एक YAML फाइल में लिखो
# टेस्ट में नाम से कॉल करो
# हर टेस्ट रन के वक्त Rails ये डाटा टेस्ट डेटाबेस में डाल देगा।





# BOOTSTRAP : Bootstrap is the most popular HTML, CSS, and JS framework for developing responsive, 
# mobile first projects on the web.
# Bootstrap एक मुफ़्त और ओपन-सोर्स फ्रंट-एंड फ्रेमवर्क है, जो CSS (Cascading Style Sheets) के साथ HTML और JavaScript का उपयोग करता है ताकि वेब डेवलपमेंट को तेज़ और आसान बनाया जा सके।
# पहले से बने हुए CSS क्लासेस और JavaScript components उपलब्ध कराता है।
# जहाँ CSS में हमें खुद स्टाइल लिखनी पड़ती है, वहीं Bootstrap तैयार क्लासेस का इस्तेमाल करने देता है।
# फायदे:
# रेडीमेड डिज़ाइन (Navbar, Button, Card, Modal आदि)
# Responsive grid system
# Cross-browser compatibility (हर ब्राउज़र में सही दिखे)

# site navigation : 
# site navigation refers to the menus, links, and routing logic that help users move around your web application. 
# It’s implemented using a mix of routes, controllers, views (partials/layouts), and helpers.


# navbar partial: a "reusable view file" that contains your navigation bar code. You define it once, 
#                 then render it on every page (usually from the layout), instead of duplicating the navigation code in each view.


# 1. What is a Partial?

# A partial is a view file whose name starts with an underscore (_).
# It’s stored like any other view file (e.g., app/views/shared/_navbar.html.erb).
# You insert it into other views/layouts with <%= render "shared/navbar" %> (Rails automatically looks for _navbar.html.erb).

# Define a Navbar Partial:
# File: app/views/shared/_navbar.html.erb
# <nav>
#   <%= link_to "Home", root_path, class: ("active" if current_page?(root_path)) %> 
# </nav>

# link_to => generates <a> tags with proper Rails routes.
# current_page? => highlights the active link.
# No controller is required for a partial — it’s just HTML/ERB.

# Render the Partial in Your Layout
# Open app/views/layouts/application.html.erb and add:

# <body>
#   <%= render "shared/navbar" %>
#   <%= yield %>
# </body>

# render "shared/navbar" pulls in the partial.
# yield inserts page-specific content below the navbar.



# Rails में पेज लोड कैसे होता है?

#1 जब आप ब्राउज़र में कोई URL खोलते हैं (जैसे /about), तो Rails यह क्रम फॉलो करता है:

#2 Browser Request → आप /about खोलते हैं।

#3 Routes Check → config/routes.rb देखता है कि /about किस controller#action से जुड़ा है।

#4 Controller Action → PagesController#about चलता है।

#5 View Render → Rails app/views/pages/about.html.erb फाइल चुनता है।

#6 Layout Apply → इस view को app/views/layouts/application.html.erb layout में yield के अंदर डाल दिया जाता है।

#7 Final HTML → Browser → ब्राउज़र को तैयार HTML भेजा जाता है और पेज दिखता है।


# [ Browser: /about ] 
#        |
#        v
# [ Rails Router (routes.rb) ]
#        |
#        v
# [ PagesController#about ]
#        |
#        v
# [ View File: app/views/pages/about.html.erb ]
#        |
#    merged inside
#        |
# [ Layout: app/views/layouts/application.html.erb ]
#        |
#     (yield जगह पर page का content डलता है)
#        |
#        v
# [ Final HTML भेजा Browser को ]


# application.html.erb → इसमें हेडर, navbar, footer, और <%= yield %> होता है।
# about.html.erb → सिर्फ About पेज का main content होता है।
# जब /about ओपन करते हैं, Rails layout + page content को जोड़कर पूरा HTML बनाता है।




# *Integration Tests

# ये टेस्ट ब्राउज़र जैसा काम करते हैं — link click करना, पेज चेक करना।

# chapter 5
# HTML5 + CSS + Bootstrap से layout बनता है,
# Rails partials से code reuse होता है, 
# Sass से styling आसान होती है, 
# routes से named paths मिलते हैं, 
# और integration tests से पूरा flow test किया जा सकता है। (link click करना, पेज चेक करना।)

# routes से named paths मिलते हैं, 
# अगर आपने routes.rb में लिखा:
# get '/about', to: 'static_pages#about'

# तो view या controller में लिंक बनाने के लिए आपको ये लिखना पड़ेगा:
# <%= link_to "About", '/about' %>
# 👉 यहाँ /about हार्डकोड है। अगर बाद में URL बदलना पड़ा तो हर जगह बदलना पड़ेगा।

# get '/about', to: 'static_pages#about', as: 'about'
# अब Rails अपने आप एक named path helper बना देता है:

# about_path → /about


# View में आप लिख सकते हैं:
# <%= link_to "About", about_path %>





# * persistence = database में save होना

# model + database migration :
# works for: User सिर्फ memory में न रहे, बल्कि database में save हो।
# ताकि console बंद करने पर भी user की info बची रहे।




#  Migration का काम क्या है?

# Rails में migration वह Ruby कोड होता है जो database को बदलने (create/alter/drop) के लिए लिखा जाता है।

# Migration का एक method होता है → change इसमें हम बताते हैं कि database में क्या बदलाव करना है।


class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
    	# create_table यह method database में नई table बनाता है। Table का नाम plural (users) होता है।
		# Rails convention:
		# Model → singular (User)
		# Table → plural (users)
		# 👉 क्योंकि model एक user represent करता है, जबकि table में बहुत सारे users होंगे।	      
      t.string :name
      t.string :email

      t.timestamps
#     Timestamp = किसी घटना का exact समय और तारीख का रिकॉर्ड।
#      Database में timestamp का मतलब है → date + time का value जो बताता है कि कोई row कब बनाई या बदली गई।
    end
  end
end


# Summary of Final Table (users)
# Migration run करने के बाद users table कुछ इस तरह होगी:

Column Name	  Type	    Purpose
id	         integer	primary key (auto-generated)
name	     string	    user का नाम
email	     string   	user का email (unique username की तरह use करेंगे)
created_at	 datetime	 record कब बना
updated_at	 datetime	 record last बार कब बदला
 







# Rails console (rails c) खोलते ही Rails पूरा environment load करता है:

# Models (app/models/*.rb)
# Database connection
# Application configuration
# मतलब अब आपको manually require करने की ज़रूरत नहीं है।
# u = User.new
# => #<User id: nil, name: nil, email: nil, created_at: nil, updated_at: nil>
# यह अपने आप काम करेगा क्योंकि Rails console already आपके models load कर चुका है।





# $ rails console --sandbox


# | कमांड               | Behavior        | Changes                                  |
# | ------------------- | --------------- | ---------------------------------------- |
# | `rails c`           | Normal console  | Changes **permanent**                    |
# | `rails c --sandbox` | Sandbox console | Changes **temporary (rollback on exit)** |

# User.find(3)
# >> User.find_by(email: "michael@example.com")


# Duck typing = "Behavior-based typing"
# Focus on what an object can do, not what it is.





# Updating user objects:
# user
# k = User.new
# k.name
# k.email`
# k.reload.email
# k.save
# k.created_at
# k.created_at
# k.updated_at
# => k.update(name: '', email: "")
# => k.update_attribute(:name, "El Duderino")
# k.name =>  El Duderino
# user.name = "New Name" (→ object में change हुआ।)
# user.save (→ database में change commit हुआ।)
# k.created_at = 1.year.ago
# q.errors.full_messages
# => ["Name can't be blank"]



# अगर आप बिना test के सिर्फ code लिखें, तो कभी-कभी आपको लगेगा सब ठीक है, लेकिन edge cases miss हो जाते हैं।
# इसलिए TDD approach adopt की जाती है:

# 1.पहले test लिखो (fail होना चाहिए)
# 2.फिर validation code लिखो
# 3.Test पास कराओ

# 🔹 Test Strategy (जैसा text में बताया गया है)

# Valid model से शुरुआत करो
# पहले एक User बनाओ जो सही values के साथ valid हो।
# assert user.valid? से check करो।
# Invalid values डालो
# Example: user.name = ""
# अब test करो कि user.valid? false हो।

# Fail → Pass cycle
# पहले test fail होगा क्योंकि validations अभी नहीं लिखे।
# Validation add करने के बाद test pass हो जाएगा।


# TDD => test-driven development

# $ rails test:models

 

 VALIDATION:

# class User < ApplicationRecord
# validates :name, presence: true, length: { maximum: 50 } 
# validates :email, presence: true, length: { maximum: 255 }
# end


# when try to name to long

# q.errors.full_messages
# => ["Name is too long (maximum is 50 characters)", "Email can't be blank"]



# Format validation
# addresses = %w[USER@foo.COM THE_US-ER@foo.bar.org first.last@foo.jp]



# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
# इस regex के हिस्सों का मतलब (Table 6.1 के हिसाब से)
# \A
# → स्ट्रिंग की शुरुआत (यानी ईमेल की शुरुआत से ही मिलान होना चाहिए)।
# [\w+\-.]+
# → ईमेल के local part (यानी @ से पहले वाला हिस्सा) को मैच करता है।
# \w = letters (a-z, A-Z), numbers (0-9), और underscore _
# + = प्लस चिन्ह (+) भी allowed है
# - = हाइफ़न भी allowed है
# . = डॉट भी allowed है
# 👉 मतलब: user.name, alice+bob, foo-bar आदि सब valid हैं।
# @
# → हर ईमेल में एक @ होना ज़रूरी है।
# [a-z\d\-.]+
# → डोमेन नेम (example, gmail, yahoo वगैरह)
# a-z = छोटे अक्षर (case-insensitive होगा क्योंकि regex के अंत में i है)
# \d = digits (0–9)
# - और . भी valid हैं (foo-bar.com, foo.bar.com)
# \.[a-z]+
# → डोमेन एक्सटेंशन (जैसे .com, .org, .jp)
# डॉट के बाद कम-से-कम एक अक्षर होना चाहिए
# केवल अल्फाबेट्स (a-z) allowed हैं, नंबर या symbols नहीं
# \z
# → स्ट्रिंग का अंत (यानि regex ईमेल के अंत तक ही match होना चाहिए, बीच में कुछ extra नहीं होना चाहिए)।
# i (ignore case)
# → case insensitive है। मतलब USER@FOO.COM और user@foo.com दोनों valid हैं।



# IMPORTANT Scenario (जो आपने लिखा):

# Alice form भरकर alice@wonderland.com से sign up करती है।
# गलती से Alice ने दो बार "Submit" दबा दिया
# Rails दोनों requests parallel process करता है:
# Request 1 memory में user बनाता है → validation पास हो गया।
# Request 2 भी memory में user बनाता है → validation पास हो गया।
# Request 1 database में save हो गया।
# Request 2 भी database में save हो गया।
# ✅ अब database में दो बार "alice@wonderland.com" duplicate मौजूद है → जो हम नहीं चाहते।



model-level validation काफी नहीं है, database-level constraint भी ज़रूरी है।


# अगर email column पर index नहीं है, तो database को हर row एक-एक करके देखनी पड़ेगी → जिसे full-table scan कहते हैं।
# Worst case → आखिरी row तक check करना पड़े।
# Performance बहुत slow हो जाएगा।

# अगर हम email column पर index बना दें, तो database email को जल्दी locate कर लेगा।
Index होने पर: index section में जाकर सीधे data मिल जाएँगे।

# Benefits
#1 Fast lookup → login के समय user को email से जल्दी find किया जा सकेगा।
#2 Uniqueness guarantee → duplicate email database में enter नहीं हो पाएगा।
#3 Scalability → बड़े userbase (हजारों या लाखों users) पर भी performance सही रहेगा।


# Model में validation → अच्छा error message users को दिखाने के लिए।
# Database में index → performance और hard uniqueness guarantee के लिए।

#   before_save { self.email = email.downcase }
# before_save block हर बार record save होने से पहले email को lowercase कर देता है।
# अब "FOO@BAR.COM".downcase → "foo@bar.com" save होगा।




# A hashed password: 
# जब आप अपने model (जैसे User) में ये line लिखते हैं:

# class User < ApplicationRecord
#   has_secure_password
# end


# तो Rails आपके लिए बहुत सारा boilerplate काम automatically कर देता है।

# 1. password_digest attribute
# आपके database में password_digest नाम का column होना चाहिए (string type)।
# जब आप user बनाते हैं और password assign करते हैं, तो Rails bcrypt gem का use करके password को securely hash करके password_digest में save करता है।
# यानी plain text password कभी भी database में store नहीं होता।

# 2. Virtual attributes: password और password_confirmation
# ये दोनों attributes database में column नहीं हैं (virtual हैं)।
# जब आप new user बनाते हैं:
# User.new(name: "Example", email: "example@test.com",
#          password: "foobar", password_confirmation: "foobar")


# Rails:

# password को check करेगा कि blank न हो (presence validation)।
# password और password_confirmation match करते हैं या नहीं validate करेगा।
# फिर hash generate करके password_digest में save कर देगा।

# 3. authenticate method

# Rails automatically model पर एक authenticate method देता है।

# Example:

# user = User.find_by(email: "example@test.com")
# user.authenticate("wrongpassword")  # => false
# user.authenticate("foobar")         # => user object (अगर password सही है)


# इससे login system बनाना बहुत आसान हो जाता है।

# Summary

# has_secure_password आपके model में ये सब free में जोड़ता है:
# password_digest column (hashed password storage)
# Virtual attributes: password, password_confirmation (+ validations)
# authenticate method (password check करने के लिए)




# bcrypt क्या है?
# bcrypt एक password hashing algorithm है।
# Plain text password को irreversible hash में बदल देता है → मतलब DB से कभी भी original password वापस नहीं निकाला जा सकता।
# Secure web apps में standard practice है।



# REST का मतलब है कि हर resource (जैसे user) के लिए standard actions होंगे:

# show (profile दिखाना)

# new (signup form)

# create (signup data save करना)
# आगे जाकर edit, update, destroy भी होंगे।





# Context (पृष्ठभूमि)

# अब हम अपने Rails app में पहली बार dynamic pages (गतिशील पेज) बनाने वाले हैं।

# Static page में content हमेशा fix रहता है (जैसे “About” या “Help” page)।

# Dynamic page database से data लेकर user के हिसाब से content दिखाता है (जैसे user profile page: हर user के लिए नाम, email अलग होगा)।

# Debugging क्यों ज़रूरी है?

# जब हम dynamic pages पर काम करते हैं, तो हमें यह देखना पड़ता है कि

# कौन सा data controller से view तक जा रहा है।

# कौन से parameters (params) request के साथ pass हो रहे हैं।

# Ra








# Debug information कैसे काम करता है?

# Rails में built-in <%= debug(params) %> method है।

# यह page पर request parameters को साफ-साफ hash की तरह दिखाता है।

# Example: अगर आप /users/1 page खोलते हैं, तो params में { "controller"=>"users", "action"=>"show", "id"=>"1" } होगा।

# इससे developer को पता चलता है कि Rails backend में कौन सी जानकारी आ रही है।

# Rails environments (डेवलपमेंट, टेस्ट, प्रोडक्शन)

# Rails app अलग-अलग environment में चलता है:

# Development

# आपके local computer पर चलता है।

# Error messages और debug info साफ-साफ दिखाता है।

# Development mode debugging के लिए सबसे अच्छा है।

# Test

# Automated tests चलाने के लिए।

# User सीधे इससे interact नहीं करता।

# Production

# Real users इस environment में app use करते हैं।

# यहाँ पर errors और debug info users को नहीं दिखती (security और user experience के लिए)।

# आसान शब्दों में

# Chapter 7 में जब हम profile pages बनाएँगे, तो database से आने वाला data dynamic होगा।

# Debugging मदद करती है developer को यह देखने में कि Rails को कौन से parameters मिल रहे हैं और वह view तक क्या भेज रहा है।

# Development environment में debug info दिखाना safe और useful है, लेकिन production में इसे बंद रखा जाता है।

# 👉 मतलब: Debugging = developer की आँखें 👀
# यह दिखाता है कि अंदर क्या चल रहा है।





---------------------------------
<%= debug(params) if Rails.env.development? %>
इसका मतलब क्या है?
debug(params)

यह Rails का built-in helper है।

यह HTML <pre> टैग के अंदर request parameters (params) को pretty-format करके दिखाता है।

Example: अगर आप /users/5?foo=bar URL खोलते हैं, तो debug output कुछ ऐसा होगा:

yaml
Copy code
--- !ruby/hash:ActionController::Parameters
controller: users
action: show
id: '5'
foo: bar
if Rails.env.development?

Rails में तीन common environments होते हैं:

development → local coding और debugging के लिए

test → automated testing के लिए

production → real users के लिए

Rails.env.development? सिर्फ development environment में true होता है।

इसका मतलब यह debug info सिर्फ local development के दौरान दिखेगा।

Production में (जहाँ real users होते हैं) यह debug block बिल्कुल render नहीं होगा, ताकि users को internal details न दिखें।

क्यों useful है?
Development के दौरान आपको आसानी से पता चल जाता है कि request में कौन-सा data आया है।

Example: form submit करने के बाद आप debug(params) से check कर सकते हैं कि fields सही तरह से controller तक पहुँची या नहीं।

Production में users को sensitive info दिखाने का risk नहीं रहता।

👉 आसान शब्दों में:
यह line developer के लिए एक चुपचाप debugging tool है — local machine पर तो मदद करता है, लेकिन live site पर automatically छुप जाता है।

-----------------------------------------------


Server अलग environment में चलाना

Normally, rails server development में चलता है।
लेकिन आप इसे किसी और environment में भी चला सकते हैं:

$ rails server --environment production


अब आपका app production mode में चलेगा।

------------------------------------

Database migration अलग environment में

हर environment की अपनी database होती है:

development → db/development.sqlite3

test → db/test.sqlite3

production → db/production.sqlite3

अगर आप server production mode में चलाते हैं तो उसे production database चाहिए।
-----------------------------------------------

Rails में अलग-अलग environments होते हैं: development, test, production।

Rails.env और उसके boolean methods से आप check कर सकते हैं कि app किस environment में चल रहा है।

Console या server को किसी भी environment में run किया जा सकता है।

हर environment का अपना database होता है, इसलिए migrations उसी environment के हिसाब से चलानी पड़ती हैं।
-----------------------------------------------

Rails console (development या production environment) खोलें:
puts user.attributes.to_yaml और y user.attributes दोनों YAML formatted hash print करते हैं।

rails console
user = User.first
user.attributes
# => {"id"=>1, "name"=>"Example User", "email"=>"user@example.com", 
#     "created_at"=>Mon, 02 Sep 2025 10:00:00 UTC +00:00,
#     "updated_at"=>Mon, 02 Sep 2025 10:00:00 UTC +00:00}

puts user.attributes.to_yaml
---
id: 1
name: Example User
email: user@example.com
created_at: 2025-09-02 10:00:00.000000000 Z
updated_at: 2025-09-02 10:00:00.000000000 Z

Rails console में y method shortcut है, जो internally puts obj.to_yaml ही call करता है।

तो अगर आप लिखें:
y user.attributes
तो output बिल्कुल वही होगा जैसा puts user.attributes.to_yaml देता है।
-----------------------------------------------
<% provide(:title, "About") %>
<!DOCTYPE html>
<html>
<head>
	<title><%= yield(:title) %> | Ruby on Rails Sample App</title>
</head>
<body>
	<h1>About</h1>
	<p>This is the About page for the Sample Application</p>

</body>
</html>

-----------------------------------------------
<%= @user.name %>, <%= @user.email %> 
<hr>

<%= @user.created_at %>
<hr>
<%= @user.updated_at %>
<hr>
<%= Time.now %>
<hr>

-------------------------
MD5 Hash क्या होता है?

MD5 का मतलब है Message Digest Algorithm – 5

यह एक hash function है, जो किसी भी टेक्स्ट/डेटा (जैसे email, password, file) को लेता है और उसे एक फिक्स्ड 32-character लंबी string (hexadecimal में) में बदल देता है।

इसका काम है:

Input कितना भी बड़ा हो, output हमेशा 32 hex characters (128-bit) का ही होगा।

Example:

Input: "hello"

Output (MD5): 5d41402abc4b2a76b9719d911017c592


-----------
Rails अपने आप form का action और method कैसे तय करता है।

🔹 Rails को कैसे पता चलता है?

जब हम लिखते हैं:

<%= form_with(model: @user, local: true) do |f| %>


तो Rails देखता है कि:

@user किस class का object है → यहाँ यह User class है।

क्या @user नया record है (new_record? == true) या पहले से database में मौजूद है।

अगर new record है → Rails POST /users action बनाएगा (create के लिए)।

अगर existing record है → Rails PATCH /users/:id action बनाएगा (update के लिए)।

🔹 Form attributes (auto-generated by Rails)

नए user (@user = User.new) के लिए form कुछ ऐसा बनता है:

<form action="/users" class="new_user" id="new_user" method="post">


action="/users" → मतलब form submit होने पर data /users URL पर जाएगा।

method="post" → मतलब यह एक create request है।

🔹 Authenticity token

आपने देखा होगा कि <form> tag के अंदर Rails एक hidden field डाल देता है:

<input type="hidden" name="authenticity_token" value="abc123..." />

यह क्यों होता है?

यह Rails की CSRF protection (Cross-Site Request Forgery) है।

Browser यह hidden token server को भेजता है।

Server verify करता है कि request सच में आपके ही app से आई है, किसी hacker site से नहीं।

👉 यह security feature है, और हमें manually कुछ नहीं करना पड़ता। Rails इसे अपने आप add कर देता है।
और जैसा tutorial में लिखा है: “Knowing when it’s OK to ignore details like this is a good mark of technical sophistication.”
मतलब: अभी हमें इसके अंदर के logic की चिंता नहीं करनी चाहिए, बस इतना समझना काफी है कि Rails यह security के लिए करता है।

🔹 Summary

form_with(model: @user) → Rails auto detect करता है कि नया object है या नहीं।

नया object → POST /users (create action)।

पुराना object → PATCH /users/:id (update action)।

Rails hidden authenticity token add करता है → CSRF attacks से बचाव।
------------------------------------------


resources :users को config/routes.rb में लिखने से Rails अपने आप RESTful routes बना देता है।

-_________-------------------------------
हमने signup form (Section 7.2.2) तो बना लिया, लेकिन अभी तक यह सिर्फ HTML था। अब हमें backend logic लिखना है, ताकि:

User signup form submit करे।

Rails backend उस data को process करे।

अगर data invalid है → signup page दुबारा render हो और error messages दिखें।

अगर data valid है → user database में save हो और profile page पर redirect हो।

🔹 Routes (recap)

resources :users को config/routes.rb में लिखने से Rails अपने आप RESTful routes बना देता है।

POST /users → UsersController#create action को call करेगा।

🔹 Strategy (create action)

Form से data आएगा (params[:user] में)।

हम नया object बनाएंगे:

@user = User.new(params[:user])


(असल में strong parameters use होंगे → user_params)

Save करने की कोशिश करेंगे:

if @user.save
  # success
else
  # failure
end

🔹 Listing 7.18 (UsersController#create)

Tutorial के हिसाब से आपका controller कुछ ऐसा होगा:

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Success: redirect to show page
      redirect_to @user
    else
      # Failure: render signup page again
      render 'new', status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

🔹 Flow of unsuccessful signup

User ने form submit किया (POST /users)।

Rails ने UsersController#create call किया।

Validation check में fail हुआ (जैसे blank name या गलत email)।

@user.save ने false return किया।

Controller ने render 'new' किया → signup page फिर से show हुआ।

अब हम @user.errors.full_messages की मदद से error messages display कर सकते हैं (Figure 7.15 की तरह)।

🔹 Why render (not redirect)?

render 'new' → उसी request में दुबारा signup page दिखाता है (invalid user data के साथ)।

अगर हम redirect_to इस्तेमाल करते तो नया request शुरू हो जाता और @user के errors खो जाते।

🔹 Summary

resources :users → Rails को RESTful routes देता है।

form_with(model: @user) → form data POST /users पर भेजता है।

UsersController#create → नया user बनाने की कोशिश करता है।

@user.save false → signup failure → render 'new' और errors show।

@user.save true → signup success → redirect।

_---------------------------------------------

🔹 params hash क्या है?

Rails में जब भी कोई HTTP request आती है (जैसे GET, POST), उसके साथ आने वाला data Rails controller में params नाम के hash में store होता है।

उदाहरण:

अगर URL है /users/1 → तो params[:id] == "1"

अगर signup form submit हुआ है → तो params में एक nested hash आएगा जिसमें user की जानकारी होगी।

🔹 Form से data कैसे map होता है?

Listing 7.17 में आप input field देखते हो:

<input id="user_email" name="user[email]" type="email" />


👉 यहाँ name="user[email]" बहुत important है।

Rails इसको parse करके nested hash बनाता है।

तो submit के बाद params कुछ ऐसा दिखेगा:

params = {
  "user" => {
    "name" => "Example User",
    "email" => "user@example.com",
    "password" => "[FILTERED]",
    "password_confirmation" => "[FILTERED]"
  }
}

🔹 Controller में इसका use

अब controller में हम यह लिख सकते हैं:

@user = User.new(params[:user])


👉 params[:user] यहाँ hash है:

{
  "name" => "Example User",
  "email" => "user@example.com",
  "password" => "foobar",
  "password_confirmation" => "foobar"
}


Rails इसको User model के attributes से map कर देता है।

🔹 Symbols vs Strings

Debug output में आपको keys "name", "email" string के रूप में दिखेंगी।
लेकिन Rails internally इनको symbol की तरह भी handle कर सकता है।
मतलब आप ऐसे भी लिख सकते हो:

params[:user][:email]


और ये काम करेगा।

🔹 Strong Parameters (Rails 4+ से)

Security के लिए हम सीधे params[:user] नहीं पास करते।
बल्कि strong parameters का इस्तेमाल करते हैं:

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end

@user = User.new(user_params)


✅ Summary:

Form के name="user[...]” attributes → nested hash बनाते हैं।

params[:user] वही hash है → directly User.new में pass किया जा सकता है।

यह Rails का powerful convention है, जो हमें manual parsing से बचाता है।"

-------------------------------------------------------

pluralize helper

Rails का pluralize helper numbers के हिसाब से शब्द को singular/plural बना देता है।

Example:

<%= pluralize(@user.errors.count, "error") %>


अगर errors की संख्या:

0 → "0 errors"

1 → "1 error"

2 → "2 errors"

👉 इस तरह Rails अपने आप सही grammatical form चुन लेता है, और “1 errors” जैसी गलती नहीं होती।

🔹 Error messages block (Listing 7.21)

Rails tutorial में invalid signup पर errors दिखाने के लिए new.html.erb में कुछ ऐसा block use किया जाता है:

<% if @user.errors.any? %>
  <div id="error_explanation">
    <div class="alert alert-danger">
      The form contains <%= pluralize(@user.errors.count, "error") %>.
    </div>
    <ul>
      <% @user.errors.full_messages.each do |msg| %>
        <li><%= msg %></li>
      <% end %>
    </ul>
  </div>
<% end %>

क्या हो रहा है यहाँ?

@user.errors.any? → check करता है कि कोई validation error है या नहीं।

अगर error है तो error_explanation नाम के div में सब error messages दिखाए जाते हैं।

pluralize का use करके header बनता है → e.g. “The form contains 2 errors.”

@user.errors.full_messages से हर error message निकाला जाता है और <li> में दिखाया जाता है।

🔹 Styling (Listing 7.22)

Rails automatically हर invalid field को इस तरह wrap कर देता है:

<div class="field_with_errors">
  <input type="text" ... >
</div>


और ऊपर वाले error box को हमने id="error_explanation" दिया है।

अब SCSS में हम इनको style कर सकते हैं:

#error_explanation {
  color: red;
  ul {
    margin: 0 0 30px 0;
  }
}

.field_with_errors {
  @extend .has-error;
}

Explanation:

#error_explanation → पूरे error box को red color देगा और error list को थोड़ा नीचे करेगा।

.field_with_errors → Sass का @extend use करके Bootstrap की .has-error class inherit करेगा (Bootstrap पहले से ही invalid fields को highlight करने के लिए style देता है)।

🔹 Flow Recap

User ने invalid data submit किया।

@user.save fail हुआ।

Controller ने render 'new' किया।

View (new.html.erb) में @user.errors display हुए।

Rails ने fields को field_with_errors में wrap कर दिया।

SCSS (error_explanation, .field_with_errors) ने errors को सुंदर और readable तरीके से highlight कर दिया।

---------------------------------------

redirect_to is used to tell the browser to make a new HTTP request to another URL (instead of rendering the current view).

------------------------------------------

Signup के बाद flash क्यों चाहिए?

अभी तक आपका UsersController#create ऐसा काम कर रहा है:

अगर user valid है → database में save होता है → फिर redirect हो जाता है @user (यानि उसके profile page पर)।

लेकिन user को कोई message नहीं दिख रहा कि signup successful हुआ।

👉 इसको बेहतर बनाने के लिए Rails में flash messages का इस्तेमाल करते हैं।

Flash message क्या है?

Rails में flash एक temporary hash है:

आप इसमें key–value store कर सकते हो (जैसे flash[:success] = "Welcome!")

यह message सिर्फ अगले request पर दिखेगा।

जैसे ही user दूसरा page खोलेगा या refresh करेगा → message गायब हो जाएगा।

Example (Listing 7.26 update)
def create
  @user = User.new(user_params)
  if @user.save
    flash[:success] = "Welcome to the Sample App!"   # 👈 flash message
    redirect_to @user
  else
    render 'new', status: :unprocessable_entity
  end
end

View में कैसे दिखेगा?

app/views/layouts/application.html.erb में आप add कर सकते हैं:

<% flash.each do |key, message| %>
  <div class="alert alert-<%= key %>"><%= message %></div>
<% end %>


अब जब नया user signup करेगा → profile page पर ऊपर message आएगा:
“Welcome to the Sample App!”
और जैसे ही वो page reload करेगा या कहीं और जाएगा → message गायब हो जाएगा ✅

👉 Summary हिंदी में:

flash Rails का तरीका है temporary messages दिखाने का।

Signup या login के बाद अक्सर "Welcome!" या "Logged in successfully!" जैसे messages इसी से आते हैं।

flash[:success], flash[:danger], flash[:notice] जैसी keys आम तौर पर इस्तेमाल होती हैं।"

----------------------------------------------
Chapter 3 में आपने deployment शुरू तो किया था, लेकिन उस समय आपका app ज़्यादा काम नहीं कर रहा था।

अब signup feature काम कर रहा है, तो deployment को professional-grade बनाने का समय है।

इसका मतलब:

Signup को secure बनाना

Production में user signup के लिए आपको सुरक्षा (जैसे SSL/HTTPS, secure password handling) बढ़ानी होगी।

Default webserver बदलना

Rails development server (WEBrick/Puma default) production के लिए ठीक नहीं है।

Production में ज़्यादातर लोग Nginx + Puma/Passenger जैसे servers का इस्तेमाल करते हैं।

Production database की configuration

Development में SQLite या local DB इस्तेमाल किया, लेकिन production में PostgreSQL जैसी database configure करनी होगी।

Important Note (merge करने की बात):

Deployment से पहले आपको अपनी सभी changes (जो आपने signup feature के लिए बनाए) master branch (main branch) में merge करनी चाहिए।
क्योंकि production server हमेशा master/main branch से code खींचता है।

👉 आसान शब्दों में:
अब आपका signup feature ready है → deployment को सुरक्षित और professional बनाना है → इसके लिए database, webserver, और configuration तैयार करनी है → और सबसे पहले अपने changes को master/main branch में merge करना है ताकि production पर push किया जा सके।


----------------------------------------------


⚠️ Problem (समस्या)

जब कोई user signup form भरता है, तो उसका name, email और password नेटवर्क पर भेजा जाता है।
अगर ये data encrypt (सुरक्षित) नहीं किया गया, तो कोई भी malicious user (हैकर) उसे बीच रास्ते में पकड़ सकता है।
👉 यही एक security flaw है।

🔑 Solution (समाधान: SSL)

SSL (Secure Sockets Layer) data को encrypt करता है, ताकि भेजे जाने के दौरान कोई भी उसे चोरी न कर सके।

इसे आम तौर पर site-wide (पूरी site पर) enable करना बेहतर होता है।

Signup सुरक्षित होगा।

Login (Chapter 8) भी सुरक्षित होगा।

Session hijacking जैसी vulnerabilities (Chapter 9.1) से बचाव होगा।

💡 Heroku और SSL

Heroku पर आपकी Rails app default रूप से SSL support करती है (यानि https URL उपलब्ध रहता है)।

लेकिन, Heroku अपने आप users को http → https redirect नहीं करता।
👉 अगर कोई user URL manually बदलकर http डाल दे, तो site insecure हो जाएगी।

✅ Fix (Rails में SSL force करना)

Rails production configuration में बस एक line enable करनी होती है:

फ़ाइल: config/environments/production.rb

config.force_ssl = true


By default यह line comment की हुई होती है (# के साथ)।

आपको बस इसे uncomment करना है।

🛠️ Effect (क्या होगा?)

अब कोई भी user अगर http://yourapp.com खोलेगा → Rails automatically उसे https://yourapp.com
 पर redirect कर देगा।

पूरा traffic encrypted होगा → data सुरक्षित रहेगा।

👉 आसान शब्दों में: SSL = आपकी app का seatbelt। बिना इसके user data कभी भी चोरी हो सकता है।



----------------------------------------------


🔴 Problem (समस्या)

Rails में by default WEBrick webserver आता है।

WEBrick:

Ruby में लिखा गया है।

Development और testing के लिए अच्छा है।

लेकिन production में बहुत ज्यादा traffic handle नहीं कर सकता।
👉 इसलिए production deployment के लिए WEBrick सही नहीं है।

🟢 Solution (समाधान: Puma webserver)

Puma एक high-performance, multithreaded webserver है।

यह बड़ी संख्या में requests को एक साथ handle कर सकता है।

Heroku officially recommend करता है कि आप production में Puma इस्तेमाल करें।

✅ Implementation Steps
1. Puma Gem

Rails 5 से Puma पहले से Gemfile में शामिल होता है।
👉 मतलब आपको अलग से install नहीं करना पड़ेगा।

2. Puma configuration (config/puma.rb)

Default file को Heroku docs के हिसाब से replace करें।

फ़ाइल: config/puma.rb

# Puma configuration file.

max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { ENV['RACK_ENV'] || "development" }
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

workers ENV.fetch("WEB_CONCURRENCY") { 2 }

preload_app!

plugin :tmp_restart

3. Procfile बनाना

Heroku को बताना होता है कि कौन सा process run करना है। इसके लिए हम Procfile बनाते हैं।

फ़ाइल: Procfile (root directory में, Gemfile के साथ)

web: bundle exec puma -C config/puma.rb

🔧 What happens after this?

जब आप Heroku पर deploy करेंगे → Heroku Procfile पढ़ेगा → Puma को production server के रूप में start करेगा।

अब आपका app production traffic (कई users) को efficiently handle कर सकेगा।

👉 आसान शब्दों में:
WEBrick = एक साधारण Rickshaw 🚲
Puma = एक तेज़, powerful कार 🚗
Production में Rickshaw fail हो जाएगा, लेकिन Puma smooth और fast चलेगा।
----------------------------------------------



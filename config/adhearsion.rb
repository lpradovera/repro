# encoding: utf-8

SOUNDS_PATH = "#{Adhearsion.config.platform[:root]}/sounds/"

Adhearsion.config do |config|

  # Centralized way to specify any Adhearsion platform or plugin configuration
  # - Execute rake config:show to view the active configuration values
  #
  # To update a plugin configuration you can write either:
  #
  #    * Option 1
  #        Adhearsion.config.<plugin-name> do |config|
  #          config.<key> = <value>
  #        end
  #
  #    * Option 2
  #        Adhearsion.config do |config|
  #          config.<plugin-name>.<key> = <value>
  #        end

  config.development do |dev|
    dev.platform.logging.level = :trace
  end

  ##
  # Use with Rayo (eg Voxeo PRISM)
  #
  # config.punchblock.username = "" # Your XMPP JID for use with Rayo
  # config.punchblock.password = "" # Your XMPP password

  ##
  # Use with Asterisk
  #
  config.punchblock.platform = :asterisk # Use Asterisk
  config.punchblock.username = "adhearsion" # Your AMI username
  config.punchblock.password = "ahn123" # Your AMI password
  config.punchblock.host = "127.0.0.1" # Your AMI host
  config.punchblock.port = 5038 # Your AMI port
  #config.punchblock.media_engine = :swift

#  config.voicemail.storage.pstore_location = "/srv/apps/ringplus/shared/voicemail.pstore"
  config.voicemail.storage.pstore_location = "#{Adhearsion.config.platform[:root]}/voicemail.pstore"
  config.voicemail.storage.file_location = "#{Adhearsion.config.platform[:root]}/messages"

  config.voicemail.default_greeting = SOUNDS_PATH + "default_greeting"
  config.voicemail.mailbox.greeting_message = SOUNDS_PATH + "mailbox_greeting_message"
  config.voicemail.mailbox.please_enter_pin = SOUNDS_PATH + "mailbox_please_enter_pin"
  config.voicemail.mailbox.number_before = SOUNDS_PATH + "mailbox_number_before"
  config.voicemail.mailbox.number_after = SOUNDS_PATH + "mailbox_number_after"
  config.voicemail.mailbox.menu_greeting = SOUNDS_PATH + "mailbox_menu_greeting"
  config.voicemail.mailbox.not_found = SOUNDS_PATH + "mailbox_not_found"
  config.voicemail.mailbox.pin_wrong = SOUNDS_PATH + "mailbox_pin_wrong"
  config.voicemail.mailbox.menu_timeout_message = SOUNDS_PATH + "mailbox_menu_timeout_message"
  config.voicemail.mailbox.menu_invalid_message = SOUNDS_PATH + "mailbox_menu_invalid_message"
  config.voicemail.mailbox.menu_failure_message = SOUNDS_PATH + "mailbox_menu_failure_message"
  config.voicemail.set_greeting.prompt = SOUNDS_PATH + "set_greeting_prompt"
  config.voicemail.set_greeting.before_record = SOUNDS_PATH + "set_greeting_before_record"
  config.voicemail.set_greeting.after_record = SOUNDS_PATH + "set_greeting_after_record"
  config.voicemail.set_greeting.no_personal_greeting = SOUNDS_PATH + "set_greeting_no_personal_greeting"
  config.voicemail.set_pin.menu = SOUNDS_PATH + "set_pin_menu"
  config.voicemail.set_pin.prompt = SOUNDS_PATH + "set_pin_prompt"
  config.voicemail.set_pin.repeat_prompt = SOUNDS_PATH + "set_pin_repeat_prompt"
  config.voicemail.set_pin.change_ok = SOUNDS_PATH + "set_pin_change_ok"
  config.voicemail.set_pin.pin_error = SOUNDS_PATH + "set_pin_pin_error"
  config.voicemail.set_pin.match_error = SOUNDS_PATH + "set_pin_match_error"
  config.voicemail.messages.menu = SOUNDS_PATH + "messages_menu"
  config.voicemail.messages.no_new_messages = SOUNDS_PATH + "messages_no_new_messages"
  config.voicemail.messages.message_received_on = SOUNDS_PATH + "messages_message_received_on"
  config.voicemail.messages.from = SOUNDS_PATH + "messages_from"

  config.platform.ad_server_url = "http://localhost:4567/" #slash terminated
  config.platform.mode = :staging
end

Adhearsion::Events.draw do

  # Register global handlers for events
  #
  # eg. Handling Punchblock events
  # punchblock do |event|
  #   ...
  # end
  #
  # eg Handling PeerStatus AMI events
  # ami :name => 'PeerStatus' do |event|
  #   ...
  # end
  #
end

Adhearsion.router do

  #
  # Specify your call routes, directing calls with particular attributes to a controller
  #

  route 'Mbox', SimonGame, :to => '43030'
end

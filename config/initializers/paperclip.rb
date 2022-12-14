# frozen_string_literal: true

Paperclip::Attachment.default_options[:storage] = :fog
Paperclip::Attachment.default_options[:fog_credentials] =
  { provider: 'Local', local_root: "#{Rails.root}/public" }
Paperclip::Attachment.default_options[:fog_directory] = ''
Paperclip::Attachment.default_options[:fog_host] = 'http://localhost:3000/'
Paperclip::Attachment.default_options[:use_timestamp] = false

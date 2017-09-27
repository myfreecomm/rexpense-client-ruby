require 'spec_helper'

describe Rexpense::Entities::WebhookCollection do
  it_behaves_like :entity_collection, Rexpense::Entities::Webhook, 'webhooks'
end

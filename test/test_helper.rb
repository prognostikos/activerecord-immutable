require 'rails'
require 'rails/test_help'
require 'active_record'

$: << 'lib'

require 'active_record/immutable'

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: ":memory:")

silence_stream(STDOUT) do
  ActiveRecord::Schema.define do
    create_table "domain_events", force: true do |t|
      t.timestamps
    end
  end
end

class DomainEvent < ActiveRecord::Base
  include ActiveRecord::Immutable
end

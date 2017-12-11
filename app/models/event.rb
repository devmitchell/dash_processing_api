class Event
  include ActiveModel::Validations

  KNOWN_TYPES = %w(button_press).freeze

  attr_accessor :event_type, :button_mac_address

  validates :event_type, inclusion: { in: KNOWN_TYPES }
  validates :button_mac_address, presence: true

  def initialize(args = {})
    args.each_pair { |attr_name, attr_value| self.public_send("#{attr_name}=", attr_value) }
  end
end

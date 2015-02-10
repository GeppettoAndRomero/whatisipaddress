require "whatisipaddress/version"
require 'socket'
require 'net/http'

module Whatisipaddress
  def self.localip
    udp = UDPSocket.new
    udp.connect("128.0.0.0", 7)
    adrs = Socket.unpack_sockaddr_in(udp.getsockname)[1]
    udp.close
    adrs
  end
  def self.globalip
    Net::HTTP.get('whatisipaddress.herokuapp.com', '/ip')
  end
end

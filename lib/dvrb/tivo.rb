class DVRB::Tivo < DVRB::Base
  
  PORT = 31339
  
  def initialize(host)
    @host = host
  end
  
  def channel_up
    send_to_tivo "CHANNELUP"
  end
  
  def channel_down
    send_to_tivo "CHANNELDOWN"
  end
  
  def pause
    send_to_tivo "PAUSE"
  end
  
  def play
    send_to_tivo "PLAY"
  end
  
  private
  
    def send_to_tivo(command)
      tivo = Net::Telnet.new("Host" => @host, 'Port' => PORT, "Timeout" => 5, "Prompt" => /LOCAL/)
      tivo.cmd "IRCODE #{command}" 
      tivo.close
    end
  
end
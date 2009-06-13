class DVRB::Tivo < DVRB::Base
  
  PORT = 31339
  
  attr_accessor :tivo
  
  def initialize(host)
    @host = host
  end
  
  # Play
  def play
    remote "PLAY"
  end
  
  # Pause
  def pause
    remote "PAUSE"
  end
  
  # Starts recording the current channel
  def record
    remote "RECORD", "SELECT"
  end
  
  # Channel up
  def channel_up
    remote "CHANNELUP"
  end
  
  # Channel down
  def channel_down
    remote "CHANNELDOWN"
  end
  
  def select
    remote "SELECT"
  end
  
  # Input a number
  def number(num)
    remote "NUM#{num}"
  end
  
  # Changes the channel
  def channel(num)
    num.to_s.split("").each { |n| number(n) }
  end
  
  def up
    remote "UP"
  end
     
  def down
    remote "DOWN"
  end
  
  def left
    remote "LEFT"
  end
  
  def right
    remote "RIGHT"
  end

  # TiVo specific functions
  def tivo
    remote "TIVO"
  end
  
  def thumbs_up
    remote "THUMBSUP"
  end
  
  def thumbs_down
    remote "THUMBSDOWN"
  end
  
  def live_tv
    remote "LIVETV"
  end
  
  def now_showing
    remote "NOWSHOWING"
  end



  private
  
    def remote(*commands)
      commands.each do |c|
        send_to_tivo c
        sleep 1
      end
    end
  
    def send_to_tivo(command)
      tivo = Net::Telnet.new("Host" => @host, 'Port' => PORT, "Timeout" => 5, "Prompt" => /LOCAL/)
      tivo.cmd "IRCODE #{command}"
      tivo.close
    end
  
end


 
# DISPLAY 
# DIRECTV 
# ENTER 
# CLEAR 
# SLOW 
# FORWARD 
# REVERSE 
# STANDBY 
# NOWSHOWING 
# REPLAY 
# ADVANCE 
# DELIMITER 
# GUIDE


# DONE
# TIVO
# NUM0 
# NUM1 
# NUM2 
# NUM3 
# NUM4 
# NUM5 
# NUM6 
# NUM7 
# NUM8 
# NUM9
# LIVETV 
# THUMBSUP 
# THUMBSDOWN 
# CHANNELUP 
# CHANNELDOWN
# PLAY 
# PAUSE
# RECORD 
# UP 
# DOWN 
# LEFT 
# RIGHT
# SELECT
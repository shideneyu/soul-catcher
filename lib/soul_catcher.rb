require 'soul_catcher/version'
require 'tempfile'
require 'csv'
require 'digest'
require 'highline/import'
require 'thread'
require 'ruby-progressbar'
require 'choice'
require 'formatador'

module SoulCatcher

  def self.load(options)
    Application.new(options).process_souls
  end

  class Application

    attr_accessor :ssid, :length, :interface

    def initialize(options)
      options.each do |option, value|
        instance_variable_set("@#{option}", value)
      end
    end

    def process_souls

      ctr = 0
      @clients_array = []
      @ap_macs = {}
      scndstatus = 0
      status = 0
      temp_file = Tempfile.new('soul_catcher')
      temp_file_name = temp_file.path.split('/')[-1]

      remaining_part = proc do
        tempfile_real_path = Dir["#{temp_file.path}*-01.csv"][0]
        CSV.foreach(tempfile_real_path) do |row|
          @ssid << row[13][1..-1] if row[13] && status == 0 && @status_ssid == 1
          @ssid.each { |target_ssid| @ap_macs[row[0]] = target_ssid and break if target_ssid == row[13][1..-1]} if row[13] && status == 0
          @ap_macs.each { |ap_mac, target_ssid| @clients_array << Hash.new and @clients_array.last.replace({target_ssid => row[00]})  and break if row[05][1..-1] == ap_mac}  if status == 1 && row[0]
          status = 1 and @status_ssid = 0 if row[0] == "Station MAC"
          @status_ssid = 1 if row[0] == "BSSID" && @ssid.empty?
        end
        Formatador.display_compact_table(@clients_array) unless @clients_array.empty?
        puts "No results" if @clients_array.empty?
      end

      system("sudo ifconfig #{@interface} down")
      system("sudo iwconfig #{@interface} mode monitor")

      counter = Thread.new do
        system("cd /tmp && sudo airodump-ng -w #{temp_file_name} #{@interface} >/dev/null 2>&1")
      end

      prog_b = ProgressBar.create(:format => '%a %B %p%% %t')

      100.times { sleep(@length) ; prog_b.increment }


      remaining_part.call
      system("sudo killall airodump-ng")

    end
  end


end

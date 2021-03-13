class FirebaseDatabaseService
  attr_reader :firebase

  def initialize
    puts "initialize firbase"
    base_uri = 'https://nodemcutest-eba2f.firebaseio.com/'
    auth_path = Dir.pwd + "/config/firebase_auth.json"
    private_key_json_string = File.open(auth_path).read

    @firebase_db = Firebase::Client.new(base_uri, private_key_json_string)
  end

  def get(port)
    @firebase_db.get(port)
  end

  def put(port, state)
    @firebase_db.put(port, state)
  end

  def delete(port)
    @firebase_db.delete(port)
  end

  def push()

    response = @firebase_db.push('testfireRails', {
      :user => "test",
      :created =>  "test"
    })
  end

  def patch(port, state)
    @firebase_db.patch(port, state)
  end


  def getPortValue(port) 
    response = @firebase_db.get("portData/bO194hKhXrcJiDJJb2AuTGygHzq1/#{port}")
    response.body
  end





end

# encoding: utf-8

class SimonGame < Adhearsion::CallController
  def run
	invoke Voicemail::MailboxController, :mailbox =>  100
  end
end

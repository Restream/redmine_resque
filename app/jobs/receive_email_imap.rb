class ReceiveEmailIMAP < NonRequeueableJob
  @queue = :mail

  def self.perform(*args)
    imap_options = args.inject(&:merge).symbolize_keys

    Rails.logger.info "Reading email with IMAP options #{imap_options.except(:password).to_s}..."

    Mailer.with_synched_deliveries do
      Redmine::IMAP.check(imap_options, MailHandler.extract_options_from_env(ENV))
    end
  end
end
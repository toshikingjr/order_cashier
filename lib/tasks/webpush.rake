namespace :webpush do
  task :generate_key do
    vapid_key = Webpush.generate_key
    File.open(Rails.root.join('tmp/vapid_public_key.txt'), mode = "w"){|f|
      f.write("WEB_PUSH_VAPID_PUBLIC_KEY=#{vapid_key.public_key}")# 公開鍵
      f.write("\n")
      f.write("WEB_PUSH_VAPID_PRIVATE_KEY=#{vapid_key.private_key}")# 秘密鍵
    }
  end
end
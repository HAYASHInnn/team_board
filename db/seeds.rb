# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb
# Rails課題管理アプリのダミーデータ

# 既存データをクリア（開発環境のみ）
if Rails.env.development?
  Comment.destroy_all
  Task.destroy_all
  Board.destroy_all
  Profile.destroy_all
  User.destroy_all
end

# ユーザー作成
puts "Creating users..."
users = []

user1 = User.create!(
  email: 'tanaka@company.com',
  password: 'password123',
  password_confirmation: 'password123'
)
users << user1

user2 = User.create!(
  email: 'sato@company.com',
  password: 'password123',
  password_confirmation: 'password123'
)
users << user2

user3 = User.create!(
  email: 'yamada@company.com',
  password: 'password123',
  password_confirmation: 'password123'
)
users << user3

user4 = User.create!(
  email: 'suzuki@company.com',
  password: 'password123',
  password_confirmation: 'password123'
)
users << user4

user5 = User.create!(
  email: 'watanabe@company.com',
  password: 'password123',
  password_confirmation: 'password123'
)
users << user5

# プロフィール作成
puts "Creating profiles..."
Profile.create!(
  user: user1,
  nickname: '田中 寛',
  introduction: 'マーケティング部門でデジタル戦略を担当しています。',
  gender: 1,
  birthday: Date.new(1985, 3, 15),
  subscribed: true
)

Profile.create!(
  user: user2,
  nickname: '佐藤 雪',
  introduction: '人事部でリクルーティングと制度設計を行っています。',
  gender: 2,
  birthday: Date.new(1990, 7, 22),
  subscribed: false
)

Profile.create!(
  user: user3,
  nickname: '山田 健二',
  introduction: '開発チームのリーダーです。フルスタック開発が得意です。',
  gender: 1,
  birthday: Date.new(1988, 11, 8),
  subscribed: true
)

Profile.create!(
  user: user4,
  nickname: '鈴木 マリア',
  introduction: '営業部で新規顧客開拓を担当しています。',
  gender: 2,
  birthday: Date.new(1992, 4, 30),
  subscribed: false
)

Profile.create!(
  user: user5,
  nickname: '渡辺 浩司',
  introduction: '財務部で予算管理と経営分析を行っています。',
  gender: 1,
  birthday: Date.new(1983, 9, 12),
  subscribed: true
)

# ボード作成
puts "Creating boards..."
boards = []

board1 = Board.create!(
  user: user1,
  title: 'マーケティング戦略',
  description: 'デジタルマーケティングと新商品プロモーションに関する課題を議論します。SNS活用、インフルエンサーマーケティング、コンテンツ戦略などを扱います。'
)
boards << board1

board2 = Board.create!(
  user: user2,
  title: '人事制度改革',
  description: '働き方改革、リモートワーク制度、人事評価制度の見直しについて議論します。従業員満足度向上と生産性向上の両立を目指します。'
)
boards << board2

board3 = Board.create!(
  user: user3,
  title: 'システム開発',
  description: 'アプリケーション開発、UI/UX改善、技術的負債の解消に関する課題を扱います。ユーザビリティ向上と開発効率化を目指します。'
)
boards << board3

board4 = Board.create!(
  user: user4,
  title: '営業戦略',
  description: '新規顧客開拓、既存顧客との関係強化、営業プロセスの改善について議論します。売上目標達成に向けた戦略を検討します。'
)
boards << board4

board5 = Board.create!(
  user: user5,
  title: '財務管理',
  description: '予算計画、コスト削減、投資判断に関する課題を議論します。健全な財務体質の維持と成長投資のバランスを考えます。'
)
boards << board5

# タスク作成
puts "Creating tasks..."
tasks = []

task1 = Task.create!(
  user: user1,
  board: board1,
  title: '新商品のプロモーション戦略を検討',
  content: '来月発売予定の新商品について、ターゲット層の分析とプロモーション手法を検討する必要があります。SNS広告、インフルエンサー活用、従来メディアのバランスを考慮してください。予算は月額200万円を想定しています。',
  deadline: 1.week.from_now
)
tasks << task1

task2 = Task.create!(
  user: user2,
  board: board2,
  title: 'リモートワーク制度の見直し',
  content: '現在のリモートワーク制度について、生産性向上と従業員満足度の両立を図るための改善案を検討します。週何日のリモートワークが適切か、コミュニケーションツールの活用方法も含めて議論しましょう。',
  deadline: 2.weeks.from_now
)
tasks << task2

task3 = Task.create!(
  user: user3,
  board: board3,
  title: 'モバイルアプリのUI/UX改善',
  content: 'ユーザーからの要望が多い、モバイルアプリの使いやすさ向上について議論します。特に決済フローの簡素化と、商品検索機能の改善が急務です。ユーザビリティテストの結果も踏まえて検討してください。',
  deadline: 3.weeks.from_now
)
tasks << task3

task4 = Task.create!(
  user: user4,
  board: board4,
  title: '新規顧客開拓の営業戦略',
  content: '第3四半期の営業目標達成に向けて、新規顧客開拓の戦略を練り直す必要があります。既存顧客との関係維持と新規開拓のバランス、営業チームのリソース配分について検討しましょう。目標は新規契約20件です。',
  deadline: 10.days.from_now
)
tasks << task4

task5 = Task.create!(
  user: user5,
  board: board5,
  title: '来年度予算計画の策定',
  content: '来年度の事業計画に基づいた予算計画を策定します。各部門からの要求予算と全社的な投資優先順位を踏まえ、限られたリソースの最適配分を検討する必要があります。売上目標は前年比110%です。',
  deadline: 1.month.from_now
)
tasks << task5

# 追加のタスク（他のユーザーが作成したタスク）
task6 = Task.create!(
  user: user2,
  board: board1,
  title: 'カスタマージャーニーマップの作成',
  content: '顧客の購買行動を可視化し、各タッチポイントでの体験を改善するためのカスタマージャーニーマップを作成します。',
  deadline: 2.weeks.from_now
)
tasks << task6

task7 = Task.create!(
  user: user3,
  board: board2,
  title: '新入社員研修プログラムの改善',
  content: '新入社員の定着率向上を目指し、研修プログラムの内容とスケジュールを見直します。',
  deadline: 3.weeks.from_now
)
tasks << task7

# コメント作成
puts "Creating comments..."

Comment.create!(
  user: user2,
  task: task1,
  content: 'SNS広告については、TikTokやInstagramのリール動画を活用した戦略が効果的だと思います。ターゲット層の年齢を考慮すると、この2つのプラットフォームが最適ではないでしょうか。'
)

Comment.create!(
  user: user3,
  task: task1,
  content: 'インフルエンサー活用については、マイクロインフルエンサーの方がエンゲージメント率が高いデータがあります。予算配分も効率的になりそうです。具体的な人選も進めましょう。'
)

Comment.create!(
  user: user1,
  task: task2,
  content: '週3日のリモートワークが理想的だと思います。チームビルディングの観点から、週2日は出社してface to faceのコミュニケーションを取ることが重要です。'
)

Comment.create!(
  user: user4,
  task: task2,
  content: 'Slackのハドルミーティング機能を活用すれば、リモートワーク時でもカジュアルなコミュニケーションが取りやすくなります。試してみる価値はあると思います。'
)

Comment.create!(
  user: user1,
  task: task3,
  content: '決済フローについては、ワンクリック決済の導入を検討してはどうでしょうか。Amazon PayやApple Payなどの外部決済サービスとの連携も視野に入れると良いと思います。'
)

Comment.create!(
  user: user5,
  task: task3,
  content: 'A/Bテストを実施して、現在のフローと新しいフローの効果を比較検証することをお勧めします。数値で改善効果を測定できます。'
)

Comment.create!(
  user: user2,
  task: task4,
  content: '既存顧客のアップセル・クロスセルにもう少し注力してから新規開拓に力を入れた方が効率的かもしれません。LTV（顧客生涯価値）の観点から検討しましょう。'
)

Comment.create!(
  user: user3,
  task: task4,
  content: 'CRMシステムの活用で、見込み客の管理と営業活動の効率化が図れると思います。データドリブンな営業アプローチを取り入れてみてはいかがでしょうか。'
)

Comment.create!(
  user: user3,
  task: task5,
  content: 'DX推進のための予算確保は必須だと思います。特にAI・機械学習領域への投資は競合他社に遅れを取らないためにも重要です。'
)

Comment.create!(
  user: user4,
  task: task5,
  content: '各部門の予算要求をヒアリングした結果、開発部門とマーケティング部門の投資効果が高そうです。ROIを重視した配分を提案します。'
)

Comment.create!(
  user: user1,
  task: task6,
  content: '顧客アンケートの結果を参考に、購買前の情報収集段階での離脱が多いことが分かりました。この部分の改善が急務ですね。'
)

Comment.create!(
  user: user4,
  task: task7,
  content: 'メンター制度の導入も検討してみてはいかがでしょうか。先輩社員によるサポート体制があると、新入社員の不安軽減につながります。'
)

puts "Seed data created successfully!"
puts "Created #{User.count} users, #{Board.count} boards, #{Task.count} tasks, and #{Comment.count} comments."

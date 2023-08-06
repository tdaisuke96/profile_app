User.create!(
  id: 1,
  email: 'hoge@example.com',
  self_introduction: 'Nice to meet you!',
  password: 'hoge',
  password_confirmation: 'hoge',
  created_at: '2022-03-11 01:53:22',
  updated_at: '2022-03-11 01:53:22'
)

# SkillCategoriesテーブルのデータ

SkillCategory.create!(
  id: 1,
  skill_category: 'バックエンド',
  created_at: '2022-03-11 01:53:22',
  updated_at: '2022-03-11 01:53:22'
)

SkillCategory.create!(
  id: 2,
  skill_category: 'フロントエンド',
  created_at: '2022-03-11 01:53:22',
  updated_at: '2022-03-11 01:53:22'
)

SkillCategory.create!(
  id: 3,
  skill_category: 'インフラ',
  created_at: '2022-03-11 01:53:22',
  updated_at: '2022-03-11 01:53:22'
)


# SkillDetailsテーブルのデータ
SkillDetail.create!(
  id: 1,
  skill_name: 'Ruby on Rails',
  skill_level: 100,
  skill_category_id: 1,
  user_id: 1,
  created_at: '2023-06-11 01:53:22',
  updated_at: '2023-06-11 01:53:22'
)

SkillDetail.create!(
  id: 2,
  skill_name: 'Vue.js',
  skill_level: 50,
  skill_category_id: 2,
  user_id: 1,
  created_at: '2023-06-11 01:53:22',
  updated_at: '2023-06-11 01:53:22'
)

SkillDetail.create!(
  id: 3,
  skill_name: 'AWS',
  skill_level: 10,
  skill_category_id: 3,
  user_id: 1,
  created_at: '2023-06-11 01:53:22',
  updated_at: '2023-06-11 01:53:22'
)

SkillDetail.create!(
  id: 4,
  skill_name: 'Java',
  skill_level: 20,
  skill_category_id: 1,
  user_id: 1,
  created_at: '2023-07-11 01:53:22',
  updated_at: '2023-07-11 01:53:22'
)

SkillDetail.create!(
  id: 5,
  skill_name: 'Next.js',
  skill_level: 60,
  skill_category_id: 2,
  user_id: 1,
  created_at: '2023-07-11 01:53:22',
  updated_at: '2023-07-11 01:53:22'
)

SkillDetail.create!(
  id: 6,
  skill_name: 'Azure',
  skill_level: 80,
  skill_category_id: 3,
  user_id: 1,
  created_at: '2023-07-11 01:53:22',
  updated_at: '2023-07-11 01:53:22'
)
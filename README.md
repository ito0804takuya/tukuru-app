# README

## companiesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :jobs


## jobsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|body|string|null: false|
|tel|string|null: false|
|email|string|null: false|
|url|string||
|postal_code|string||
|city|string|null: false|
|block|string|null: false|
|building|string||
|prefecture_id|integer|null: false, foreign_key: true|
|image_id|integer|null: false, foreign_key: true|
|company_id|references|null: false, foreign_key: true|
|seeker_id|references|foreign_key: true|

### Association
- belongs_to :company
- has_many :seekers, throuth: :job_seekers
- has_many :job_seekers
- has_many :images


## imagesテーブル
|column|Type|Option|
|-------|----|-----|
|image|string|null: false|
|job_id|references|null: false, foreign_key: true|

### Association
- belongs_to :job


## seekersテーブル
|column|Type|Option|
|-------|----|-----|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :jobs, throuth: :job_seekers
- has_many :job_seekers


## job_seekersテーブル

|Column|Type|Options|
|------|----|-------|
|job|references|null: false, foreign_key: true|
|seeker|references|null: false, foreign_key: true|

### Association
- belongs_to :job
- belongs_to :seeker


## prefecturesテーブル
|column|Type|Option|
|-------|----|-----|
|name|string|null: false, unique: true|

### Association
- has_many :jobs

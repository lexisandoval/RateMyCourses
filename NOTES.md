RateMyCourses Rails Application

User
- has_many :ratings
- has_many :courses, through :ratings
- username:string
- name:string
- password_digest:string

Course 
- has_many :ratings
- has_many :users, through :ratings
- belongs_to :subject
- title:string
- number:integer
- description:string

Subject
- has_many :courses
- name:string

Rating
- belongs_to :user
- belongs_to :course
- stars:integer
- content:string
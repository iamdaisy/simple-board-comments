

- simple-board

  - User 모델

    > string, email
    >
    > string, password


  - Post 모델

    > string, title
    >
    > string, content

  ```
  user contoller
  user#index		모든유저를 보여준다.
  user#new		새로운 유저를 만드는 form을 보여준다.(회원가입)
  user#create		new에서 작성한 회원 정보를 DB에 저장한다.
  user#show		user/show/:id 에 해당하는 유저 1명만 보여준다.

  user#login			로그인 form
  user#login_process 	로그인 정보와 DB 유저정보 비교해 로그인 시킨다.


  post controller	
  post#index		모든 게시글을 보여준다.
  post#new		새로운 게시글을 만드는 form을 보여준다.
  post#create		new에서 작성한 글을 쓴다 == DB에 저장
  post#show		/post/show/:id에 해당하는 글 1개만 보여준다.
  post#modify		게시글을 수정할 수 있는 form을 보여줌
  post#update		modify에서 수정된 글을DB에 update
  post#destroy	show에서 확인한 글을 지울수 있게한다.

  ```

### RDB 

- 1:1
- 1:N (User & Post / Post & Reply / Class & Student )
  - 1User가 여러 Post를 가질수 있다.
  - Post들은 특정 한 User에 속해야 한다.
- N:N ( Major & Student 복수전공 )



### rails db

posts 테이블에 컬럼추가

`t.integer :user_id`

db 삭제하고 다시 migrate 함

`rake db:drop`

`rake db:migrate`




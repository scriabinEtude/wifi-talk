# 와이파이 톡

와이파이에 연결된 사람끼리 채팅이 가능한 서비스

IOS - SwiftUI\
Android - Flutter\
이 앱은 스터디를 위한 용도로써 IOS는 Native로 제작하였습니다.

</br>
</br>

# 기능

### 와이파이

- 디바이스에 연결된 와이파이 체크
- 와이파이 상태 주기적으로 확인
  - 최초 연결에는 상태 확인 주기가 더 짧게


### 프로필

- 깃허브 자동프로필과 유사한 모양의 프로필 생성 모듈 제작
- 최초 앱 실행시 익명의 사용자를 위한 자동 프로필 생성
- 사용자가 프로필을 무작위로 재생성해 변경 가능
- 프로필을 생성하는 규격화된 문자열 제작
- 프로필 설정시 채팅방에 쓰일 작은 jpeg파일 생성
- 프로필 이름 변경시 자동으로 프로필에 저장
- 인앱 데이터베이스에 익명사용자의 프로필 저장

### 채팅

- 상단 인피니티 스크롤
- 시간 표시
- 같은 사용자의 채팅에는 프로필 생략
- 분단위로 같은 채팅에는 시간 표시 생략
- 일단위가 넘어가면 채팅방 중간에 일자를 표시
- 채팅 리스트에서 마지막 메세지 표시
- 와이파이가 변경되면 채팅방 자동 나가기

### 리포트

- 단일 사진 업로드
- 텍스트 입력 유효성 검사

</br>
</br>

# TODO

- 소셜 로그인
- 리포트 게시판 조회 (운영자)
- FCM (로그인한 사용자 대상)
- 알람 onOff
- 테마설정
- 위치 권한 없을때 위치권한 세팅화면으로 바로 이동
- 앱 아이콘 눈에 잘띄는 색으로

</br>
</br>

# BUGS

- 와이파이 접속 이력이 중복 저장되는 문제 (업데이트가 아니라 insert가 두번되는듯)

</br>
</br>

# More...

- 와이파이 방장
- 공지

</br>
</br>

# Links

- [초안 기획 스케치](https://ovenapp.io/project/83Rcrlzv9EwDmIvBKybY5fD65kIoQKeF#uOKG6)

</br>
</br>

# 문제해결 ( 설명글로 제작 예정 )

- 프로필 이미지 용량 문제
- 메모리 leak

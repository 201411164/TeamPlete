# ****Teamplete에 오신 걸 환영합니다****

**[Teamplete](http://www.teamplete.net)**는 조별 과제나 팀 작업 등의 **협업**을 훨씬 더 쉽고 간편하게 만들어주는 웹사이트입니다.



 ![팀플리트 메인 이미지](./image/teamplete01.JPG)
 
## 개발동기

여러 인원들에게 **과제**를 내고 검토해야하는 전국 **교수**나 **조교**, **팀장 및 부장**님들!! 

혹은 교양 및 전공수업에서 힘들게 **조별과제**중인 **학생**분들!! 

아직도 불편하게 **단톡방에서 공지**하시고 과제 미제출자를 일일이 추적하시나요? 

![실제 사례 캡쳐](./image/kakao1.jpg)


  단톡방은 쉽게 공지가 가능하지만 그만큼 **가독성이 떨어지고**, 과제에 대한 질문이 올라오면 핵심 내용은 묻혀서 찾기도 어렵죠.

 게다가 참고할 파일은 어떤 건지,  이 과제의 담당자는 누군지, 마감 기한은 언제까지인지, 현재까지 누가 제출했고 제출하지 않았는지 파악하기도 어렵죠. 그럼 어떻게 될까요??

![공지했으나 다들 이해 못한 상황.jpg](./image/kakao2.jpg)

네! 공지사항을 다들 제대로 이해하지 못해 **과제를 다시 제출하거나 제출하지 않는 상황**이 일어나게 됩니다. (ㅠㅠ) 게다가 단톡방에서는 각 개개인의 산출물을 관리하기도 어렵습니다. 



이러한 답답한 상황을 해결하기 위해 직접 개발에 나섰습니다.



![팀플리트.jpg](./image/taskdetail.png)







Teamplete에서 **간단하게 카드를 추가**하기만 하면 제출기한은 언제까지인지, 참고할 파일은 무엇인지 **직관적**으로 한 눈에 볼 수 있습니다.


또한, 더 이상 공지 읽고 제출은 다른 곳에 할 필요가 없습니다. 명단을 만들어 누가 제출했는지 안 했는지 확인하는 것도 참 번거로웠죠??



###이제 **Teamplete**에서 편리하게 팀 작업을 트래킹하고 산출물들을 관리하세요!!


**[Teamplete](http://www.teamplete.net)**는 **고동욱** 및 **성예진** 2인의 개발자가 만든 Spring MVC 기반 Web Project입니다.


바로가기 : [www.teamplete.net](http://www.teamplete.net)




## 개발환경

**운영체제 :** Windows 10

**서버 :**  Apache Tomcat 9.0 server

**IDE :** Eclipse

**Database:** Oracle SQL Developer, Oracle XE 11g



**Lang/Tools :** Java, Servlet, JSP, Javascript, HTML, CSS



**UI/Prototype :** Figma 



![figma](./image/figma.png)


링크 : https://www.figma.com/file/ysjmj5n5qZRBjyVG6ETLM3/Teamplete?node-id=0%3A1


설계부터 UI Design 등의 많은 화면 기술 작업을 figma 툴을 사용해 진행하였습니다. 






**Web Hosting :** AWS Route53, RDS, EC2

www.teamplete.net Domain을 사용하기 위해 Route53을 연결했고,

EC2 (서버 컴퓨터)는 ubuntu 16.0.4, RDS는 Oracle을 사용합니다.




**사용 기술** :  Ajax, JQuery, Spring Framework, Bootstrap, MyBatis, WebSocket






**Javascript Framework** : Select2js, Fullcalendar, NanoSlider, Sweet Alert,  Quill Editor, SockJS


**Select2Js** : Multiple Select Input

![초대하거나 담당자를 저장할 때](./image/select2.png)









**Fullcalendar** : 일정 관리 가능한 달력


![일정 추가 및 마감일 관리 달력](./image/fullcalendar.png)










**SweetAlert** : 기본 Alert창을 더 심미적으로



![알림을 표시할 때](./image/sweetalert.png)










**Quill Editor** : 강력한 Rich Text Editor




![카드를 추가할 때](./image/quill.png)










**SockJS** : Websocket을 활용한 팀 채팅




![카드를 추가할 때](./image/login2.png)








**Performance Improvement** :  IntersectionObserver을 활용한 동적 로딩 활용에 사용하였습니다. 


(현재 보고 있는 화면만 이미지 로딩, 스크롤 시 추가적으로 로딩)


**결제 모듈** : IAMPort API를 활용한 PG사 결제 지원(카카오페이). User 등급에 따라 권한 차등 부여.



![상점](./image/store.JPG)














**보안 관련** : SQL Injection Attack을 막기 위한 설계, Amazon S3 Key를 따로 관리, 회원가입 시 특수문자 및 비밀번호 Javascript로 검사합니다.



**편의성 관련** : og-property 속성을 주어서 모바일에서 확인할 때 편의성 증대

예시 :)


![ogproperty](./image/ogproperty.png)


모바일에서 웹 주소를 공유하는 일이 잦다는 점에 착안하여 미리보기 이미지 및 설명, 속성을 추가하였습니다.






## 스크린샷



팀 기본 화면 :


![팀 기본 화면](./image/teamdetail.png)

마이페이지 화면:

![마이 페이지](./image/mypage.png)

카드 작성(일정, 과제 추가 화면):

![일정 추가](./image/write_form.JPG)




## Contributor



**201411164(고동욱)**

 

**sungyejin(성예진)**

 



## License

2020 [Teamplete](http://www.teamplete.net).Co All rights reserved. 



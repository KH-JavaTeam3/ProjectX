# ProjectX


설명


사용할 CSS 프레임 워크 : 부트스트랩 4.5 (영어)
https://getbootstrap.com/

템플릿 참고 사이트 : https://colorlib.com/wp/templates/

템플릿 참고 사이트2 : https://startbootstrap.com/themes/

파스텔톤 사이트 : https://colorhunt.co/palettes/pastel


페이지 이동 설계시 
1. 타일즈를 쓸 경우 : tiles폴더에 jsp를 생성하고 컨트롤러의 return을 tiles/jsp명 으로 지정 (return "tiles/main";)

tiles폴더에 새로운 폴더를 추가할 경우 return은 tiles/폴더명/jsp명으로 지정(return "tiles/Board/memberList";)

2. 타일즈를 쓰지않을 경우 : noTiles폴더에 jsp를 생성하고 컨트롤러의 return을 jsp명 으로 지정 (return "login";)

noTiles폴더에 새로운 폴더를 추가할 경우 return은 폴더명/jsp명으로 지정(return "Board/memberList";)

(noTiles에서 jqeury를 쓸 때는 jquery소스코드 필요)
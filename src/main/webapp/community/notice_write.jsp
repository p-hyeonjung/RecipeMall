<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>recipeMall</title>
    <script src="https://kit.fontawesome.com/54880b83c5.js" crossorigin="anonymous"></script>
    <script src="../js/jquery-3.6.4.min.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/notice.js"></script>
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="css/notice_write.css">
    <link rel="shortcut icon" href="images/smalllogo.png" />
    <link rel="stylesheet" href="../ckeditor5/sample/styles.css">
</head>
<body>
    <header class="top_menu">
        <div class="recipe_mall">
            <h1><a href="../index.jsp">레시피몰</a></h1>
        </div>
        <div class="tool">
            <!-- <div><i class="fa-regular fa-image"></i></div>
            <div><i class="fa-solid fa-b"></i></div>
            <div><i class="fa-solid fa-italic"></i></div>
            <div><i class="fa-solid fa-underline"></i></div>
            <div><i class="fa-solid fa-circle"></i></div>
            <div><i class="fa-solid fa-bars"></i></div>
            <div><i class="fa-solid fa-link"></i></div>
            <div><i class="fa-solid fa-plus"></i></div> -->
        </div>
        <div class="save_or_publish">
            <form action="#">
                <div><button type="submit" form="write_frm_btn" class="btn1">저장</button></div>
            </form>
            <div><button class="btn2">발행</button></div>
        </div>
    </header>

    <div class="under_bar"></div>
    <div class="middle_space_area">
        <div class="middle_space">
            <div class="guide">
                <h1 onclick="myFunction()">자유게시판 작성 가이드 <span class="sub_guide">좋은 꿀팁들을 같이 공유 해보아요!</span><i
                        class="fa-solid fa-chevron-down"></i>
                </h1>
                <div>
                    <ul class="Detail">
                        <li><i class="fa-solid fa-circle"></i>간단한 자기 소개 후 집에 관한 이야기를 들려주세요.</li>
                        <li><i class="fa-solid fa-circle"></i>정보를 많이 입력할수록 상위 노출되어 조회수가 올라갑니다.</li>
                        <li><i class="fa-solid fa-circle"></i>사진과 제목은 에디터에 의해 변경 될 수 있습니다.</li>
                        <li><i class="fa-solid fa-circle"></i>글 작성과 이미지 업로드 시, 타인의 지식 재산권을 침해하지 않도록 유의해주세요</li>
                        <li><i class="fa-solid fa-circle"></i>폭언 욕설은 삼가해 주세요.</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="writing_space">
            <form id="write_frm_btn" action="#">
                <div><input type="text" placeholder="제목을 입력해주세요" class="title_go"></div>
                <div><textarea cols="100" placeholder="내용을 입력해주세요" class="detail_go editor"></textarea></div>
                <input type="submit" name="write_save" class="hidden">
            </form>
        </div>
    </div>



    <script src="../js/notice.js"></script>
</body>
<script src="../ckeditor5/build/ckeditor.js"></script>
<script src="../ckeditor5/config.js"></script>
<script>ClassicEditor
    .create( document.querySelector( '.editor' ), {
        
        licenseKey: '',
        
    })
    .then( editor => {
        window.editor = editor;

        
        
        
    })
    .catch( error => {
        console.error( 'Oops, something went wrong!' );
        console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
        console.warn( 'Build id: aqf37x1iamyi-8fi17nkv0t9n' );
        console.error( error );
    });
</script>
</html>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <title>Title</title>
    <title id="ctl00_ctl00_headerTitle">나의 참여한 이벤트 &lt; My CGV | 영화 그 이상의 감동. CGV</title>
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/webfont.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/reset.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/layout.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/module.css?20211209" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/content.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/common.css" />
    <link rel="stylesheet" type="text/css" href="https://img.cgv.co.kr/R2014/css/mypagenew.css" />

    <script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery-1.10.2.min.js"></script>

    <style>
        .cols-content .col-aside {
            width: 180px;
            float: right;
        }
    </style>
</head>
<body>
<div class="header">
    <!-- 서비스 메뉴 -->

    <div class="header_content">
        <div class="contents">
            <h1 onclick=""><a href="/"><img src="https://img.cgv.co.kr/R2014/images/common/logo/logoRed.png" alt="CGV" /></a><span>CULTUREPLEX</span></h1>
            <ul class="memberInfo_wrap">
                <!-- Advertisement -->

                <div class="ad-partner">
                    <a href="http://www.cgv.co.kr/culture-event/event/detailViewUnited.aspx?seq=31426&menu=006"  >
                        <img src="https://img.cgv.co.kr/WingBanner/2022/0303/16462658373950.png" alt="현대M포인트" />
                    </a>
                </div>

                <!-- /Advertisement -->


                <li><a href="/user/login/logout.aspx" class="logout" title="로그아웃" ><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png" alt="로그아웃" /><span>로그아웃</span></a></li>


                <li><a href="/user/mycgv/"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png" alt="MY CGV" /><span>MY CGV</span></a></li>
                <li><a href="/support/default.aspx"><img src="https://img.cgv.co.kr/R2014/images/common/ico/loginCustomer.png" alt="고객센터" /><span>고객센터</span></a></li>
            </ul>
        </div>
    </div>

    <script>
        //TopMenu 영역 LOG
        //빨강 CGV클릭
        $('.header_content > .contents > h1 > a').on({
            click: function (e) {
                gaEventLog('PC_GNB', '홈', '');
            }
        });
        //서비스 메뉴
        $('.header_content > .contents > ul > li > a').on({
            click: function (e) {
                gaEventLog('PC_GNB', '서비스메뉴_'+this.text, '');
            }
        });

    </script>
    <!-- 서비스 메뉴 -->

    <!-- 서브 메뉴 -->

    <script type="text/javascript">
        $(document).ready(function () {
            $('.nav_menu > li > h2 > a').on({
                mouseenter: function (e) {
                    var target = e.target;
                    $(target).parents('.nav_menu').find('.nav_overMenu').slideDown(function () {
                        $('.nav').addClass('active');
                    });
                },
                click: function (e) {
                    var target = e.target;
                    if (!$('.nav').hasClass('active')) {
                        $(this).trigger('mouseenter');
                    } else {
                        $('.nav').trigger('mouseleave');
                    }
                }
            });

            /********************************************************
             //서브메뉴 구글 GA Analytics 로그 처리 - 2022.01.12 myilsan
             ********************************************************/
            //cgv화이트 메뉴클릭
            $('.nav > .contents > h1 > a').on({
                click: function (e) {
                    gaEventLog('PC_GNB', '홈', '');
                }
            });

            //주메뉴 클릭
            $('.nav_menu > li > h2 > a').on({
                click: function (e) {
                    gaEventLog('PC_GNB', '주메뉴_' + this.text, '');
                }
            });

            //주메뉴 하위메뉴 클릭
            $('.nav_overMenu > dd > h3 > a').on({
                click: function (e) {
                    var target = e.target;
                    var parText = $(target).parents('.nav_overMenu').find('dt')[0].innerText;
                    gaEventLog('PC_GNB', parText + '_' + this.text, '');
                }
            });

            //하위메뉴 최상위 클릭
            $(".nav_overMenu > dt > h2 > a").on({
                click: function (e) {
                    gaEventLog('PC_GNB',this.text + '_' + this.text, '');
                }
            });

            //------------------end----------------------- [@,.o]>

            $('.nav').on({
                mouseleave: function (e) {
                    $(this).find('.nav_overMenu').slideUp(200, function () {
                        $('.nav').removeClass('active');
                    });
                }
            });

            $('.totalSearch_wrap input[type=text]').on({
                focusin: function () {
                    $('.totalSearch_wrap').addClass("active");
                }
            });

            $('.btn_totalSearchAutocomplete_close').on({
                click: function () {
                    $('.totalSearch_wrap').removeClass("active");
                },
                focusout: function (e) {
                    //     $('.totalSearch_wrap').removeClass("active");

                }
            });

            $(this).on({
                scroll: function (e) {
                    /* S GNB fixed */
                    var headerOffsetT = $('.header').offset().top;
                    var headerOuterH = $('.header').outerHeight(true);
                    var fixedHeaderPosY = headerOffsetT + headerOuterH;
                    var scrollT = $(this).scrollTop();
                    var scrollL = $(this).scrollLeft();

                    if (scrollT >= fixedHeaderPosY) {
                        $('.nav').addClass('fixed');
                        $('.fixedBtn_wrap').addClass('topBtn');
                    } else {
                        $('.nav').removeClass('fixed');
                        $('.fixedBtn_wrap').removeClass('topBtn');
                    }

                    /* S > GNB fixed 좌우 스크롤
                    Description
                    - GNB가 fixed 되었을때 좌우 스크롤 되게 처리
                    */
                    if ($('.nav').hasClass('fixed')) {
                        $('.nav').css({ 'left': -1 * scrollL })
                    } else {
                        $('.nav').css({ 'left': 0 })
                    }
                    /* E > GNB fixed 좌우 스크롤 */
                    /* S GNB fixed */
                }
            });

            $('.btn_gotoTop').on({
                click: function () {
                    $('html, body').stop().animate({
                        scrollTop: '0'
                    }, 400);
                }
            });

            //통합검색 상단 검색 버튼
            $('#btn_header_search').on('click', function () {


                if ($('#header_ad_keyword').val() != "")
                    goSearch($('#header_ad_keyword'));      //광고
                else
                    goSearch($('#header_keyword'));


                return false;
            });

            //통합검색 검색어 입력창
            $('#header_keyword').keyup(function (e) {
                if (e.keyCode == 13) goSearch($('#header_keyword'));
            });

            //검색 입력창 클릭 시 광고값 reset
            $('#header_keyword').on('click', function () {
                $(this).attr('placeholder', '');
                $('#header_ad_keyword').val('');
            });

        });

        //통합검색
        function goSearch($objKeyword) {

            if ($objKeyword.val() == "") {
                alert("검색어를 입력해 주세요");
                $objKeyword.focus();
                return false;
            }

            //GA 검색로그
            gaEventLog('PC_GNB', '검색', $objKeyword.val());
            location = "/search/?query=" + escape($objKeyword.val());
        }



        //상단 키워드 광고 (S)
        function AdSearchExt(txt, SearchText) {
            $('#header_keyword').attr('placeholder', txt);
            $('#header_ad_keyword').val(SearchText);
        }

        function hdIcoSet(left, sh) { }
        //상단 키워드 광고 (E)

        //상단광고닫기
        function hideCgvTopAd() {
            $(".cgv-ad-wrap").hide();
            $('#wrap_main_notice').parent('div').css('top', 280);
        }

        //비즈스프링 클릭로그
        function setClickLog(title) {
            // eval("try{trk_clickTrace('EVT', '" + title + "')}catch(_e){}");
        }

    </script>
    <%@ include file= "nav.jsp" %>
    <!-- 서브 메뉴 -->
</div>
</body>
</html>
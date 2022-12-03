<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 23686
  Date: 2022/12/3
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新闻详情</title>
    <link rel="stylesheet" href="./css/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<style>
    @font-face{

        font-family: 'Alimama_ShuHeiTi_Bold';

        src:url('./fonts/Alimama_ShuHeiTi_Bold.woff') format('woff'),

        url('./fonts/Alimama_ShuHeiTi_Bold.ttf') format('truetype')
    }
    p,header,a{
        text-decoration: none;
        font-family: Alimama_ShuHeiTi_Bold, serif;
    }

    #bg{
        background: #d1d5d6;
        padding: 20px;
    }
</style>
<body>
<jsp:include page="common/header.jsp" flush="true"></jsp:include>
<div class="row justify-content-center" id="bg" style="margin-top: 88px">
    <div class="col-7">
        <h1 class="news-title">两年前他为教育事业和高圆圆分手，如今这般，高圆圆：我有一句MMP如鳊在喉</h1>
        <div class="news-status">25k阅读•35分钟前发布
            <c:forEach items="${tags}" var="tag">
                <div class="label label-default">${tag.name}</div>
            </c:forEach>
        </div>
        <div class="news-content">
            <blockquote>
                <p>记结婚高圆圆与赵又廷北京登</p>
            </blockquote>
            <div>2013年7月，在电影《盲探》中饰演舞蹈学校的老师丁丁[35] ；11月6日，当代都市情感剧《咱们结婚吧》在央视一套及湖南卫视黄金档联合开播[36]
                ，高圆圆在剧中饰演大龄剩女杨桃，该剧开播当天在两台收获了4.46的收视率，总的市场份额达到 12.83，刷新了2013年开播收视纪录[37]
                ，随后取得在央视平均收视33城3.01、46城2.974，单日最高3.918、市场份额10.131，湖南卫视平均收视破2的成绩，而大结局在央一凭接近3点的数据获2013年年度收视冠军，在优酷等12家视频网站的总播放量也达到了40亿，创下2013年单剧网络点击纪录[9]
                ，高圆圆凭借该剧获得第十八届北京影视春燕奖最佳女主角奖[10] ；12月，在武侠剧《天龙八部》中客串逍遥派弟子李碧云一角[38] 。
            </div>
            <img src="./img/game.png" alt="">
            <div>2012年2月，主演文艺爱情电影《高海拔之恋Ⅱ》，饰演内地知名女星丁圆圆[33]
                ；7月，在陈凯歌执导现实题材电影《搜索》中塑造一个受到网络伤害而选择自杀的都市白领叶蓝秋，该片上映后以1.8亿的票房成绩在大陆收官，随后陆续在港台和海外上映[34]
            </div>
            <div>2013年7月，在电影《盲探》中饰演舞蹈学校的老师丁丁[35] ；11月6日，当代都市情感剧《咱们结婚吧》在央视一套及湖南卫视黄金档联合开播[36]
                ，高圆圆在剧中饰演大龄剩女杨桃，该剧开播当天在两台收获了4.46的收视率，总的市场份额达到 12.83，刷新了2013年开播收视纪录[37]
                ，随后取得在央视平均收视33城3.01、46城2.974，单日最高3.918、市场份额10.131，湖南卫视平均收视破2的成绩，而大结局在央一凭接近3点的数据获2013年年度收视冠军，在优酷等12家视频网站的总播放量也达到了40亿，创下2013年单剧网络点击纪录[9]
                ，高圆圆凭借该剧获得第十八届北京影视春燕奖最佳女主角奖[10] ；12月，在武侠剧《天龙八部》中客串逍遥派弟子李碧云一角[38] 。
            </div>
            <div>2013年7月，在电影《盲探》中饰演舞蹈学校的老师丁丁[35] ；11月6日，当代都市情感剧《咱们结婚吧》在央视一套及湖南卫视黄金档联合开播[36]
                ，高圆圆在剧中饰演大龄剩女杨桃，该剧开播当天在两台收获了4.46的收视率，总的市场份额达到 12.83，刷新了2013年开播收视纪录[37]
                ，随后取得在央视平均收视33城3.01、46城2.974，单日最高3.918、市场份额10.131，湖南卫视平均收视破2的成绩，而大结局在央一凭接近3点的数据获2013年年度收视冠军，在优酷等12家视频网站的总播放量也达到了40亿，创下2013年单剧网络点击纪录[9]
                ，高圆圆凭借该剧获得第十八届北京影视春燕奖最佳女主角奖[10] ；12月，在武侠剧《天龙八部》中客串逍遥派弟子李碧云一角[38] 。
            </div>
            <div>2013年7月，在电影《盲探》中饰演舞蹈学校的老师丁丁[35] ；11月6日，当代都市情感剧《咱们结婚吧》在央视一套及湖南卫视黄金档联合开播[36]
                ，高圆圆在剧中饰演大龄剩女杨桃，该剧开播当天在两台收获了4.46的收视率，总的市场份额达到 12.83，刷新了2013年开播收视纪录[37]
                ，随后取得在央视平均收视33城3.01、46城2.974，单日最高3.918、市场份额10.131，湖南卫视平均收视破2的成绩，而大结局在央一凭接近3点的数据获2013年年度收视冠军，在优酷等12家视频网站的总播放量也达到了40亿，创下2013年单剧网络点击纪录[9]
                ，高圆圆凭借该剧获得第十八届北京影视春燕奖最佳女主角奖[10] ；12月，在武侠剧《天龙八部》中客串逍遥派弟子李碧云一角[38] 。
            </div>
        </div>
    </div>
    <div class="col-2">
        <div class="side-bar-card">
            <div class="card-title">相关推荐</div>
            <div class="card-body">
                <div class="list">
                    <div class="item clearfix">
                        <div class="col-xs-5 no-padding-h"><img src="https://dummyimage.com/1000x700/666/ccc" alt=""></div>
                        <div class="col-xs-7">
                            <div class="title">记结婚高圆圆与赵又廷北京登</div>
                            <div class="desc">25k阅读•35分钟前发布</div>
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="col-xs-5 no-padding-h"><img src="https://dummyimage.com/1000x700/666/ccc" alt=""></div>
                        <div class="col-xs-7">
                            <div class="title">记结婚高圆圆与赵又廷北京登</div>
                            <div class="desc">25k阅读•35分钟前发布</div>
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="col-xs-5 no-padding-h"><img src="https://dummyimage.com/1000x700/666/ccc" alt=""></div>
                        <div class="col-xs-7">
                            <div class="title">记结婚高圆圆与赵又廷北京登</div>
                            <div class="desc">25k阅读•35分钟前发布</div>
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="col-xs-5 no-padding-h"><img src="https://dummyimage.com/1000x700/666/ccc" alt=""></div>
                        <div class="col-xs-7">
                            <div class="title">记结婚高圆圆与赵又廷北京登</div>
                            <div class="desc">25k阅读•35分钟前发布</div>
                        </div>
                    </div>
                    <div class="item clearfix">
                        <div class="col-xs-5 no-padding-h"><img src="https://dummyimage.com/1000x700/666/ccc" alt=""></div>
                        <div class="col-xs-7">
                            <div class="title">记结婚高圆圆与赵又廷北京登</div>
                            <div class="desc">25k阅读•35分钟前发布</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="side-bar-card">
            <div class="card-title">24小时热闻</div>
            <div class="card-body">
                <div class="list">
                    <div class="item">
                        <a class="title" href="#">人工智能时代的到来，把全世界的科技巨头和汽车厂商推向了研发自动驾驶技术的浪潮中。</a>
                        <div class="desc">15k阅读　1k评论</div>
                    </div>
                    <div class="item">
                        <a class="title" href="#">人工智能时代的到来，把全世界的科技巨头和汽车厂商推向了研发自动驾驶技术的浪潮中。</a>
                        <div class="desc">15k阅读　1k评论</div>
                    </div>
                    <div class="item">
                        <a class="title" href="#">人工智能时代的到来，把全世界的科技巨头和汽车厂商推向了研发自动驾驶技术的浪潮中。</a>
                        <div class="desc">15k阅读　1k评论</div>
                    </div>
                    <div class="item">
                        <a class="title" href="#">人工智能时代的到来，把全世界的科技巨头和汽车厂商推向了研发自动驾驶技术的浪潮中。</a>
                        <div class="desc">15k阅读　1k评论</div>
                    </div>
                    <div class="item">
                        <a class="title" href="#">人工智能时代的到来，把全世界的科技巨头和汽车厂商推向了研发自动驾驶技术的浪潮中。</a>
                        <div class="desc">15k阅读　1k评论</div>
                    </div>
                    <div class="item">
                        <a class="title" href="#">人工智能时代的到来，把全世界的科技巨头和汽车厂商推向了研发自动驾驶技术的浪潮中。</a>
                        <div class="desc">15k阅读　1k评论</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="common/tall.jsp" flush="true"></jsp:include>
</body>
</html>

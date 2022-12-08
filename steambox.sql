/*
 Navicat Premium Data Transfer

 Source Server         : 001
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : steambox

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 08/12/2022 09:14:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '123456', '张三强');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` varchar(15000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pubdate` datetime(0) NOT NULL,
  `click_count` int(0) NOT NULL DEFAULT 0,
  `creator` int(0) NOT NULL,
  `auditor` int(0) NOT NULL,
  `community_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `creator`(`creator`) USING BTREE,
  INDEX `auditor`(`auditor`) USING BTREE,
  INDEX `community_id`(`community_id`) USING BTREE,
  CONSTRAINT `article_ibfk_2` FOREIGN KEY (`creator`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `article_ibfk_3` FOREIGN KEY (`auditor`) REFERENCES `admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `article_ibfk_4` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, '《荒野大镖客2》Steam同时在线达6万人！刷新历史纪录', 'dbg1.webp', '<p>&nbsp; &nbsp; &nbsp; &nbsp;R星传说级巨作《荒野大镖客：救赎2》最近迎来新的荣光。根据SteamDB数据显示，昨日在Steam平台同时玩该游戏的人数高达59991人，将近6万人！原先的同时在线记录为5.5万，在2019年12月游戏刚发售时创下。</p><p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><img src=\"https://img2.ali213.net/picfile/News/2022/11/27/584_2022112743837101.jpg\"></span></p><p>&nbsp; &nbsp; &nbsp; &nbsp;有人可能会问，6万这个数字也不算高呀，原因其实很简单。该游戏的PC版最开始只登陆R星自家平台和Epic商城，很多玩家为了第一时间玩到PC版游戏，而选择在其他平台购买。PC版发布的一个月后，《荒野大镖客2》才在Steam上发售。</p><p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><img src=\"https://img2.ali213.net/picfile/News/2022/11/27/584_2022112743837363.webp\"></span></p><p>&nbsp; &nbsp; &nbsp; &nbsp;遗憾的是，R星早已宣布《荒野大镖客2》停止内容更新，将全力开发《GTA6》并持续运营《GTA OL》。玩家们期待的DLC、次世代版等可能长时间内都无望了。</p><p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><img src=\"https://img2.ali213.net/picfile/News/2022/11/27/584_2022112743837460.webp\"></span></p>\n', '2022-11-27 17:16:44', 0, 1, 1, 1);
INSERT INTO `article` VALUES (2, '《荒野大镖客2》亚瑟是死于肺结核吗？游戏最终结局选择', 'dbg2.jpg', '<h3><strong>最终结局选择</strong></h3><p>　　<span style=\"color:#ff0000;\">先说结论荒野大镖客2中触发肺结核是主线剧情，要通关游戏就无法避免。</span></p><p>　　亚瑟患肺结核这个结论，只是圣丹尼斯的一个普通全科医生在缺乏足够严谨的检查下做出的结论，极大概率是错误的诊断。</p><p>　　亚瑟从病情表现来看，他就不是肺结核，而是肺癌。唐斯也不是肺结核，从表现来看也是肺癌。</p><p>　　唐斯夫人当了几天妓女就满脸疱疹溃烂，和唐斯同床共枕过着营养不良且压力山大的艰苦生活好几年，然后毫发无损，没有被传染也没有发病，因此在这里唐斯本人得肺结核的可能性就很小。</p><p>　　迈卡和亚瑟近距离滚做一团，口水鼻血齐飞，也没有被亚瑟传染发病，甚至整个营地的人都没人感染肺结核，包括经常接触的约翰。而约翰还在监狱度过了一段艰难的生活，这种压力和生活对他的免疫系统是一个很大的挑战，可是约翰就算接手了亚瑟的个人日常使用的物品后，也没被传染发病。</p><p>　　从亚瑟咳嗽后在圣丹尼斯走着走着晕倒，再到救雨落酋长儿子后晕倒，这个症状表现更像是肺癌脑转移，结合亚瑟从十几岁就大量无节制的使用烟草和酒精提神的背景，以及常年的亡命徒生活带来的慢性压力，他患肺癌的概率很大，所以肺癌才是亚瑟死亡的真相。</p><p>　　也就是说就算没有唐斯的出现，亚瑟还是会随着主线剧情的推进而死亡。</p><p>　　当然亚瑟是在第五章瓜玛岛回来才发病的，第五章之前亚瑟还是健康的。</p><p>&nbsp; &nbsp; &nbsp; &nbsp;<span style=\"color:#ff0000;\">因此想要避免凄惨结局的小伙伴可以停在第五章。</span></p><p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><span style=\"cursor:pointer;\"><img src=\"https://img1.ali213.net/glpic/2022/06/15/584_2022061595305791.png\"  ></span></span></p>\n', '2022-09-19 17:16:44', 0, 3, 1, 1);
INSERT INTO `article` VALUES (3, '《只狼影逝二度》龙之返乡结局怎么达成？龙之返乡结局条件介绍', 'zl1.jpeg', '<h3><strong>只狼影逝二度龙之返乡结局条件介绍</strong></h3><p>　　<span style=\"color:#ff0000;\"><strong>龙之返乡结局条件：</strong></span></p><p style=\"text-align: center;\">　　<span style=\"cursor:pointer;\"><span style=\"cursor:pointer;\"><img src=\"https://img1.ali213.net/glpic/2022/09/19/584_2022091953206937.png\"></span></span></p><p>　　1.首先，在义父与内府军攻占苇名城的时候与义父相遇，选择违背义父命令。</p><p>　　2.到苇名之地水生村打灵体破戒僧拿到石头(主要是为了学会潜水)。</p><p>　　3.去正殿摇铃铛进入幻境抓猴子，然后才能进入内殿见到变若卿子拔出不死斩。</p><p>　　4.来到金刚山仙峰寺的寺院境内，面前就是个池子，虫书就在池子内，要下去潜水才能拿到。</p><p>　　5.与变若卿子对话获得米并传送回破庙吃掉，再回去拿米(如果没有米可以到休息等待)，顺便把虫书交给她。</p><p>　　6.重复多次以上步骤直到卿子找你要柿子(柿子可以在仙峰寺的商人处购买)，给她吃柿子，然后她会给一种特殊米(给皇子吃的)。</p><p style=\"text-align: center;\">　　<span style=\"cursor:pointer;\"><span style=\"cursor:pointer;\"><img  src=\"https://img1.ali213.net/glpic/2022/09/19/584_2022091953206230.png\" ></span></span></p><p>　　7.传送回苇名城皇子居室，给皇子米并再次对话，休息片刻可得两个饼(当面吃掉一个会有彩蛋)。</p><p>　　8.回去找变若卿子对话，再原地休息(鬼佛处)，然后会发现卿子消失了，去幻境可以找到她，跟她对话根据需求她会让你找一本书。</p><p style=\"text-align: center;\">　　<span style=\"cursor:pointer;\"><span style=\"cursor:pointer;\"><img src=\"https://img1.ali213.net/glpic/2022/09/19/584_2022091953208528.png\"></span></span></p><p>　　9、回到正殿，来到侧门(就是拿拳法的那个山洞的门)进山洞往拳法佛塔前进，然后即将到佛塔的时候(还没勾上去那里)有一排石头佛像和一个蓝色的僧人(原本无任何交互)，此时可以在僧人处拾取一本书，带回去找卿子对话，她会需求两个特别的柿子。</p><p>　　10.干柿子:关键性技能傀儡术，击杀观猴、闻猴、言猴后获得。首先在坠落之谷菩萨谷传送点，(即打狮子猿BOSS的位置之前)请立刻回头，然后跳下毒沼泽(要用一下钩绳，不然会摔死)。一直走，右边能看到一个卖东西的供养众，跳入其身后的洞穴。路上能看见白蛇，不要管，往深处一直走，从一个断崖的左边跳下去，能发现一只猴子。从背后忍杀之，并发动傀儡术。猴子就会吸引白蛇的注意，你就可以乘机从上面的石路上过去，进入祠堂，里面能找到干柿子</p><p style=\"text-align: center;\">　　<span style=\"cursor:pointer;\"><span style=\"cursor:pointer;\"><img src=\"https://img1.ali213.net/glpic/2022/09/19/584_2022091953206787.png\"></span></span></p><p>　　11.湿柿子:从仙峰寺第一个传送点一直往右下，能看到一只风筝，同时风筝附近有一个矮子敌人。然后忍杀并且发动傀儡术，然后带着它到风筝附近，就能保证风筝永远处于飞起状态。然后，找地方勾风筝就能到风筝附近的高坡，用风筝钩绳到对面，从右边跳下，一路钩绳，能看到一个鬼佛。再往前，可以发现巨大的白蛇盘旋于下，跳下去忍杀，就能得到鲜柿子。</p><p style=\"text-align: center;\">　　<span style=\"cursor:pointer;\"><span style=\"cursor:pointer;\"><img src=\"https://img1.ali213.net/glpic/2022/09/19/584_2022091953207844.png\"></span></span></p><p>　　12.回去找变若卿子对话，选择将两个柿子都给她，然后休息片刻(鬼佛)，再与卿子对话就能获得冰泪。</p><p>　　13.继续推进程，杀完樱龙获得龙泪。</p><p style=\"text-align: center;\">　　<span style=\"cursor:pointer;\"><span style=\"cursor:pointer;\"><img src=\"https://img1.ali213.net/glpic/2022/09/19/584_2022091953207271.png\"></span></span></p><p>　　14.击杀屑一郎和剑圣苇名一心，再让皇子把冰泪和龙泪服下，就能达到龙之返乡结局。</p><p style=\"text-align: center;\">　　<span style=\"cursor:pointer;\"><span style=\"cursor:pointer;\"><img src=\"https://img1.ali213.net/glpic/2022/09/19/584_2022091953207990.png\"></span></span></p>\n', '2022-11-27 17:16:44', 0, 2, 1, 2);
INSERT INTO `article` VALUES (4, '《只狼影逝二度》背景分析 苇名一族兴衰史', 'zl2.jpeg', '<p>　<span style=\"color:#FF0000;\"><strong>　苇名一族兴衰史</strong></span></p><p><span style=\"color:#0000CD;\">　　前言：</span></p><p>　　本考察的基础融合了现实的日本宗教发展史，凡《只狼》中没有专门说明的，都以泛人类史为标准，凡只狼中有文字和古迹记录的，则以月球啊不对樱龙史为标准。</p><p>　<span style=\"color:#0000CD;\">　序：</span></p><p>　　首先，日本最早的本土信仰是神道教，是一种泛自然精灵信仰，所谓八百万神明，山川草木动物皆可为神，最早并没有神道教这个名字，是在公元5世纪佛教传入之后为了对应区分，起了神道之名，佛教和神道虽然在日本政治高层互有竞争，但是共存的一面也很广，其中一个原因是神道的宗教主要对应的是生者，对处理死者和亡魂则不太擅长，而佛教很擅长处理这些，所以日本的葬礼大多是交给佛教去办的。这一点在只狼中其实也有体现，所有亡魂相关的全都是佛教设施和金刚山仙峰寺背景。</p><p>　　所以只狼世界，神龙入侵之前的苇名初始宗教背景，是八百万神道教和佛教的并立，噬神药上说明的苇名小小神明相关，源之宫的神社遗迹，坠落之谷大量的巨佛像，这都是久远之前这两个宗教就已经在苇名扎根的证据。</p><p><span style=\"color:#0000CD;\">　　第一次苇名宗教变迁：神龙西来与祭神替换</span></p><p>　　然后樱龙自西方而来，在苇名扎根，小小神明们消失无踪，应该是樱龙吸收了苇名大地的能量，所以导致小神明们无法生存了，也因此产生了苇名的第一次宗教变迁，也就是本地神道教的祭祀对象，由小小的八百万神明，变成了强大的樱龙，虽然是外来神入侵，但这个改变最初还是给苇名带来了好处了，毕竟强大的神，授予的力量也更强大，原来的苇名伤药虽然就有不错的力量，但巫女祭祀神龙缔结契约之后所产生的龙胤之子，不但无法被普通兵器所伤，而且还能授予其眷属起死回生之力，这无疑是强大的神力和神迹，以此为依托，苇名人在神龙脚下，龙泉涌出处建立了繁荣的源之宫。喝下源水的苇名人，若是体内长出结石，那就是获得了神龙之力的吉兆，应该供奉此石，并焚香前往源之宫。</p><p>　　当然，龙胤之力，并非毫无代价的单纯美事，正如神龙扎根夺取了当地小神的生命力，龙胤从者的起死回生，是要吸取周围其他人类的生命力为代价的。</p><p>　　但是，真正的黑暗时刻，还远未开始。</p><p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><span style=\"cursor:pointer;\"><img src=\"https://img1.ali213.net/glpic/2019/04/08/584_2019040894859408.jpg\" ></span></span></p><p><span style=\"color:#0000CD;\">　　第二次苇名宗教变迁：鱼人入侵，圣地丢失，护国败北，深潜污染</span></p><p>　　好景不长，神龙之力吸引来了外乡的觊觎者，那就是非人的鱼人种，淤加美一族，只狼里的淤加美一族其实是经典的克苏鲁系深潜者的东方翻版，宫崎英高毕竟做过《血缘诅咒》，套路熟练。淤加美鱼人为了追求仙乡的力量，武力入侵苇名，并且她们的武力入侵非常成功，不仅查明了前往源之宫的方法，而且打穿了苇名城，从地道投身苇名之底，从水生村的上轿处抵达源之宫，并且侵占了原来苇名人所建立的源之宫。</p><p>　　源水的诸多恶性变异，由此而起。</p><p>　　和苇名人不同，鱼人对神明缺少敬意，蛮族也根本不知祭祀之道，自然没能获得神龙的认可，所以淤加美人并未被授予龙胤之力，于是它们把源之宫淹没了大半，变成养鲤鱼的池塘，让自己一族之长通过吸收源水的神力，变成不朽的鲤鱼，以此方法盗取神龙的不朽恩惠。不仅如此，鱼人一族为争夺成为不朽鲤鱼的机会彼此暗算，养蛊投毒，几代鱼王都被后来者谋杀取代。</p><p>　　用来谋杀鱼王的寄生虫，吃下不朽鲤鱼的肉之后获得不死之身，再通过源水流往外界，被这些虫子寄生之人，即所谓附虫者，就获得了虚假的不死，然而这种不死的其实并非宿主，死到最后，就会变成一具被虫子操控的活动尸骸罢了。</p><p>　　不过，附虫者的事情，尚是后话，在第二次变迁时期，被入侵的苇名人，被鱼人抢走神宫和御神体，当然不会无动于衷，被逐出仙乡的源水神官，带着与神龙解约用的不死斩“拜泪”投靠金刚山仙峰寺，仙峰寺以“拜泪”为基础，研究出黑不死斩“开门”(黑不死斩的刀锷，很明显的是佛教莲花造型)，开启黄泉之门，以此为基础使用一系列的降灵术和死灵术，支援护国勇士对淤加美人的光复之战，这就是古代护国战争的内容。</p><p>　　然而护国战争，最终以苇名人的失败而告终，护国勇士虽然曾一度打上源之宫，却未能夺回，徒留亡魂于水底，因为在战争中使用的死灵术的残留影响，诸多死者化为无首恶灵和七面武士(注意看七面武士手中武器，同样是佛教的法器)，至今仍然彷徨在苇名各地。</p><p>　　而淤加美人大获全胜之后闭关自守，以崇拜白蛇，实行活祭的蛇眼族封锁坠落之谷，仙峰寺因此丢掉了自己的佛教朝圣地;而以雾隐贵人制造迷雾封锁前往水生村的道路，使得苇名的神道信者也无从上轿，而水生村村民则在淤加美信仰的蛊惑下，痛饮被污染的源水，混得最好的，就是像克苏鲁深潜者那样，自己变异成类似淤加美鱼人的所谓“贵族”，混得差的，就变成半死不活的河童怪负责捉虫子，而那些死掉的人，则被栽种到水生村的池塘底部用来培育白色蛞蝓，而这些用人尸养出来的蛞蝓就是鱼王的尊贵饵食。在水生村梯田尽头拿龙泉酒那里的神龛，供奉的就全是这种白色蛞蝓。坠落之谷的佛教雕像上，缠上白蛇之皮，到处都可以明显地看到鱼人入侵发展其眷属种族和从属信仰对苇名本地的污染。</p><p>　　从源之宫鱼人的装扮上来看，是平安时期的装备，所以这应该就是鱼人入侵的历史时代。</p><p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><span style=\"cursor:pointer;\"><img src=\"https://img1.ali213.net/glpic/2019/04/08/584_2019040894900102.jpg\" ></span></span></p><p>　　<span style=\"color:#0000CD;\">第三次苇名宗教变迁：神道教源水祭祀断绝，只留佛法</span></p><p>　　苇名人自己夺不回源之宫，自然会考虑向朝廷请求援军，然而朝廷没理由为你一个山地小国的祭祀问题出动大军攻打天险，所以苇名人的求援，就只换来了平安朝廷的一纸源水祭祀的禁令，苇名人肯定并不情愿，但打不赢淤加美鱼人，只好接受。在七百年后战国末期这被不知历史的后人曲解成了朝廷对异端信仰的迫害，实际上丢掉源之宫和龙泉泉眼的都是你自己，能怪朝廷吗?</p><p>　　本身日本神道的八百万神明祭祀体系，虽然以天照神为尊长，但是各地祭祀各地本土的自然精灵，神灵，凶煞，本来就是神道的基本形态，也就是说若无深潜者污染的话，你苇名人爱祭祀苇名的龙泉还是爱祭祀白蛇，这都是在神道教正常信仰体系内的东西，朝廷根本没理由去禁止正常信仰，自找不快。</p><p>　　但污染已生，不得不禁，结果就是苇名国的合法信仰主力只剩下佛教，神道中的白蛇神社虽然还能打擦边球，但是那是蛇眼众在祭拜，苇名众只能蹭个热闹。</p><p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><span style=\"cursor:pointer;\"><img  src=\"https://img1.ali213.net/glpic/2019/04/08/584_2019040894901197.jpg\" ></span></span></p><p><span style=\"color:#0000CD;\">　　第四次苇名宗教变迁：附虫活尸迷心智，佛法尽失余魔窟</span></p><p>　　附虫者实际上是源水污染产生的意外事故，并非原有目的，附虫者的虫本来是鱼人用于内斗的，只是顺流进入了下游生物体内，仙峰上人迷惑神龙缘何授虫，如同九郎迷惑自己为何被授予龙胤，其实都是因为这是发生在鱼人入侵导致源水祭祀和相关宗教记录断绝很久之后的事情了，历史的真实已然被遗忘。</p><p>　　神龙并未授虫，神龙跟你佛教徒根本两不相干，龙胤之子才是源之宫神域的正牌巫女签正牌契约被授予正牌神力的成果，你吃到虫子纯属生化污染的意外事故，你仙峰上人对神龙来说和鲤鱼，蜈蚣，猴子统统没区别。</p><p>　　然而仙峰上人没有历史学和考古学知识，只好枯坐着在宗教中求开悟，然而你不踏踏实实找史料，学我们只狼一样跳谷爬山去源之宫遗迹考古，光坐在山洞里空想，当然是悟不出来，只能悟入歧途。悟到最后整间寺庙都被不死之力迷了心智，最后仙峰山开始捕杀上山的信徒养虫，以及派乱波众从苇名各地盗取小孩子用于变若之子的人体研究，造成大量平民死亡。整个仙峰寺变成了妖魔巢穴。</p><p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><span style=\"cursor:pointer;\"><img src=\"https://img1.ali213.net/glpic/2019/04/08/584_2019040894903285.jpg\" ></span></span></p><p><span style=\"color:#0000CD;\">　　第五次苇名宗教变迁：源水真相遗失已久，原教旨愤青没头没脑</span></p><p>　　先失神道，再失佛法，可以说苇名国的宗教指导基本丧失殆尽，没了精神指引，人就容易乱想东想西，心情浮躁，然而没有深厚的历史知识和考古(爬山)能力，光靠乱想是不可能得到真相的，连仙峰山会写经书的主持，以及失去了知识传承的龙胤之子本人都想不明白，你苇名众一帮没文化的大老粗能想明白?</p><p>　　然而大老粗虽然不明真相，却武艺惊人，剑圣苇名一心，趁着战国乱世，朝廷向心力和控制力下降，带领苇名七本枪发动苇名众，以恢复源水信仰自由为号召，发起盗国战争，(注意苇名盗国的对手并非内府，而是朝廷的本地守护，开场动画里七零八落的旗子上和敌方大将田村背上，既不是内府的双葵纹，也不是苇名的菖蒲纹)，并成功夺取统治权。</p><p>　　然而苇名的信仰自由恢复，是徒有其名，而不知其实，虽然三年前说是龙泉参拜之年，然而真正的龙泉泉眼在源之宫上方神域那里，根本不在苇名人所能触及之处，你苇名人现在喝龙泉，只能在鱼人下游喝淤加洗脚水吃鲤鱼尸虫罢了。正确的祭祀方法，正确的祭祀地点，正确的神学知识统统没有，只靠着单纯的自尊，在虚假的大义中以武力硬撑着维持独立二十年，然而连续不断的战争中，武士们越死越少，天寒地少的山地国家，粮食产量自然不多，补充人口也就困难，战国末期，内府势大，开始进行统一战争，因此苇名众的宗教独立运动日渐途穷，末路将近。</p><p>　　苇名众的悲剧，在于忘却历史，试图恢复自己根本不了解之物，以及刀刃所指的对象，完全错误，剑圣之锋所指，本应为淤加美鱼人，而非朝廷守护，盗国之战所夺，本应为源之宫，而非苇名城，然而源宫高远，仙乡忘却，错已铸就，路已终点，剑圣将逝，苇名将亡。</p>\n', '2022-11-27 17:16:44', 0, 1, 1, 2);
INSERT INTO `article` VALUES (5, '国人玩家突破无伤四锁五门！生命如歌，超越自我！', 'kdqs1.png', '<p style=\"text-align:justify\">       4月21日，我在B站首页刷到了《空洞骑士》的视频：我们真的能做到！无伤四锁五门首杀！</p><p style=\"text-align:justify\">&nbsp; &nbsp; &nbsp; &nbsp;毫无疑问，这是一则意味着达成某项高难度挑战的记录视频，一如《老头环》的各类速通和无伤一样。</p><p style=\"text-align:justify\">&nbsp; &nbsp; &nbsp; &nbsp;但如此密集的弹幕，又使它显得有些特别。</p><p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><img src=\"https://img2.ali213.net/picfile/News/2022/04/29/584_2022042920202806.jpg\"></span></p><p><span style=\"cursor:pointer;\">       在评论区，人们也没有吝啬自己的赞美之词。</span></p><p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><img src=\"https://img2.ali213.net/picfile/News/2022/04/28/584_20220428115822181.jpg\"></span></p><p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><img src=\"https://img2.ali213.net/picfile/News/2022/04/29/584_2022042953102732.jpg\"></span></p><p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><img src=\"https://img2.ali213.net/picfile/News/2022/04/29/584_2022042953103366.jpg\"></span></p><p>&nbsp; &nbsp; &nbsp; &nbsp;沉寂已久的《空洞骑士》四锁五门无伤这一几乎被玩家认为不可能完成的成就，终于被一位中国玩家攻克。B站的评论区下，空洞玩家们奔走相告。众人纷纷向这个视频的UP主，Remto、献上自己膝盖。甚至连steam游戏评论区，也有人留下“建言”。</p><p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><img src=\"https://img2.ali213.net/picfile/News/2022/04/28/584_2022042852916405.jpg\"></span></p><p style=\"text-align:justify\">&nbsp; &nbsp; &nbsp; &nbsp;为何空洞玩家将“无伤四锁五门”这一成就称作神迹，被攻克之后玩家奔走相告？</p><p style=\"text-align:justify\">&nbsp; &nbsp; &nbsp; &nbsp;因为这个成就实在是太难了。</p><p style=\"text-align:justify\">       其实《空洞骑士》通关的难度并不大，但和许多游戏一样，通关，只是游戏的开始。得益于游戏极为优秀的世界观、boss设计和动作系统，在名为“寻神者”的免费dlc更新之后，圣巢万神殿的五门挑战，作为bossrush系统，成为了空洞玩家的磨刀石。小空洞们需要在这里连续击败44位boss，才算通过五门。在steam 的成就中，五门的通过率为3.3%，这其中有很大一部分还是通过软件解锁或者开挂通过的。</p><p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><img src=\"https://img2.ali213.net/picfile/News/2022/04/28/584_2022042853429539.jpg\"></span></p><p style=\"text-align: center;\">空洞的在线人数一直很可观，“首杀”的含金量是无可争辩的</p><p style=\"text-align:justify\">&nbsp; &nbsp; &nbsp; &nbsp;而四锁五门（也被玩家称为“r45”），则将难度提升到了极致。要求玩家在限制骨钉、灵魂、外壳和护符四项基础能力值的情况下通过五门。外壳和灵魂可以理解为血量和魔力值，骨钉和护符可以看作攻击力和攻击范围的加成。在低血量，低魔力的情况下，回血成为了极为困难的奢求，稍有不慎就会暴毙。而自身低下的属性则会拖长战斗时间，进一步降低容错。</p><p style=\"text-align:justify\">&nbsp; &nbsp; &nbsp; &nbsp;将这些玩家习以为常的加成全部去掉，玩家需要在这些苛刻的条件下，连续击败44位boss，整个过程长达一个小时，这让四锁五门成为空洞玩家公认的最难成就，而无伤四锁五门则是被认为是天方夜谭，是无法被攻克的天堑。</p>\n', '2022-04-29 17:38:37', 0, 3, 1, 3);
INSERT INTO `article` VALUES (6, '《空洞骑士》虫爷爷的奖励有哪些？虫爷爷的奖励介绍', 'kdqs2.jpg', '<h3><strong>虫爷爷的奖励介绍</strong></h3><p>　　拯救幼虫5只：获得1个面具碎片</p><p>　　拯救幼虫10只：获得新手神器——幼虫之歌</p><p>　　拯救幼虫16只：得到腐臭蛋1枚</p><p>　　拯救幼虫23只：获得圣巢印章1个(可兑换成450吉欧)</p><p>　　拯救幼虫31只：得到苍白矿石1颗(升级骨钉的道具)</p><p>　　拯救幼虫38只：获得国王神像1个(可兑换成800吉欧)</p><p>　　拯救幼虫46只：得到护符——蜕变挽歌</p><p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><span style=\"cursor:pointer;\"><img src=\"https://img1.ali213.net/glpic/2022/09/20/584_2022092094842621.jpg\" ></span></span></p>\n', '2022-09-20 09:46:01', 0, 1, 1, 3);
INSERT INTO `article` VALUES (7, '制作人晒动捕合照！《双人成行》工作室新作开发中', 'srcx1.jpg', '<p>　　由Hazelight工作室制作的《双人成行》无疑是2021最受欢迎的游戏之一，本作在2021年获得了TGA年度优秀的荣誉，备受玩家喜爱。</p>\n<p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><img src=\"https://img2.ali213.net/picfile/News/2022/09/26/584_20220926102337501.jpg\"></span></p>\n<p>　　而Hazelight工作室的新作也正在开发中，总监 Josef Fares 在今日晒出了新的照片，是自己与两位动捕演员的合照。新作似乎早已提上行程，在去年12月这位制作人就晒出了团队在会议室讨论新作的照片。</p>\n<p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><img src=\"https://img2.ali213.net/picfile/News/2022/09/26/584_20220926102338544.jpg\"></span></p>\n<p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><img src=\"https://img2.ali213.net/picfile/News/2022/09/26/584_20220926102337900.jpg\"></span></p>\n<p>　　《双人成行》官方在7月发文称游戏销量已经突破700万份，并且制作人曾在采访中透露本作有近半数的玩家来自中国。本作将于今年11月4日登陆Switch。</p>', '2022-09-26 22:25:53', 0, 2, 1, 4);
INSERT INTO `article` VALUES (8, '《双人成行》成就失物招领怎么达成？失物招领成就攻略', 'srcx2.jpg', '<h3><strong>双人成行失物招领成就攻略</strong></h3>\n<p>　　章节：雪景球</p>\n<p>　　小节：冬日小镇</p>\n<p>　　进入需要三座破冰塔的小镇后，在中央的冰湖区域可以看见一直乌龟妈妈。在破完冰后会有四只乌龟宝宝，用磁力将他们牵引到乌龟妈妈处即可。</p>\n<p>　　有一红一蓝在乌龟妈妈前方不远处;一红一蓝分别在中央大桥的前后。</p>\n<p>　　**两名玩家同时解锁成就。</p>\n<p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><span style=\"cursor:pointer;\"><img  src=\"https://img1.ali213.net/glpic/2021/03/30/584_20210330104454144.jpg\"></span></span></p>\n<p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><span style=\"cursor:pointer;\"><img src=\"https://img1.ali213.net/glpic/2021/03/30/584_20210330104455694.jpg\"></span></span></p>\n<p>　　为小伙伴们带来的双人成行失物招领成就攻略就分享到此了，祝大家游戏体验愉快。</p>\n', '2022-09-20 09:46:01', 0, 1, 1, 4);
INSERT INTO `article` VALUES (9, '宫崎英高：我也不明白《艾尔登法环》疯狂受欢迎的原因', 'aedfh1.jpg', '<p>　　FS社的《艾尔登法环》在东京昨日举办的“PlayStation Partner Awards 2022 Japan Asia”大奖中获得“GRAND AWARD”奖项。在期间的媒体的问答环节中，宫崎英高被问及认为游戏如此成功的原因在哪里。</p><p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><img src=\"https://img2.ali213.net/picfile/News/2022/12/03/584_20221203110416932.png\"></span></p>\n<p>　　“（《艾尔登法环》）销量确实高于我们以往的游戏，但我不知道是什么原因。因此，即使我想重现这种成功，也做不到。”</p>\n<p>　　宫崎英高表示自己将会“像往常一样”制作游戏，而不让自己受到《艾尔登法环》成功的影响，“我尽量不去想太多，因为我认为深入分析它并有意识地在另一款游戏中复制它将是一个糟糕的想法。”</p>\n<p>　　此外，被问及如何看待用户评价这方面时，宫崎英高表示自己会小心地避免过多接触玩家的反馈。</p>\n<p>　　“我不可能听取每一位玩家的评论，如果我只接受了部分玩家的反馈，那么这可能会影响我未来作为开发者的决策，我觉得这相当令人不安。我知道我个人无法做到完全客观，所以我尽量避免直接接触到太多意见。”</p>\n\n<p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><img src=\"https://img2.ali213.net/picfile/News/2022/12/03/584_20221203110415949.jpg\"></span></p>\n<p>　　《艾尔登法环》的火出圈也让游戏吸引了不少新人玩家，宫崎英高表示这让自己想起了玩家们第一次接触《恶魔之魂》的场景，“令人怀旧的感觉”他表示。</p>\n<p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><img src=\"https://img2.ali213.net/picfile/News/2022/12/03/584_20221203110415890.jfif\"></span></p>\n', '2022-12-03 11:10:10', 0, 2, 1, 5);
INSERT INTO `article` VALUES (10, '《艾尔登法环》法师最强套装是什么？法师最强套装推荐', 'aedfh2.jpg', '<h3><strong>法师最强套装推荐</strong></h3>\n<p>　<strong><span style=\"color:#0066ff;\">　1、武器</span></strong></p>\n<p>　　右手：名刀(出血+高削韧+打人形怪舒服)。卢杖(日常推图主名刀砍人，副法杖丢辉石，所以卢杖的蓝耗不是致命缺点，反而打BOSS和精英怪可以快速泄蓝)。</p>\n<p>　　左手：陨杖(挂着给重力系魔法增伤)。</p>\n<p>　<strong><span style=\"color:#0066ff;\">　2、防具</span></strong></p>\n<p>　　选择属性抗性最高且重量不高的，可以用魔女和占星混搭。</p>\n<p><span style=\"color:#0066ff;\"><strong>　　3、法术</strong></span></p>\n<p>　　辉石魔砾+岩石球+月光剑+激流。</p>\n<p><span style=\"color:#0066ff;\"><strong>　　4、骨灰</strong></span></p>\n<p>　　仿身+10。</p>\n<p><span style=\"color:#0066ff;\"><strong>　　5、护符</strong></span></p>\n<p>　　魔法师块护符(大幅提升法伤，魔法师球护符的上位)。</p>\n<p>　　蓝琥珀链坠+2(大幅提升蓝量)。</p>\n<p>　　龙辉大盾护符(大幅提升物理减伤，因此前面的防具选择属抗，护符带物抗，刚好雨露均沾)。</p>\n<p>　　魔法师块和龙辉大盾无论是推图还是Boss都是必带的，蓝琥珀+2(以及红琥珀+2)可以根据加点情况选择带或不带。</p>\n<p>　　而剩下最后1个空位需要结合实际情况调整，像恩惠露滴护符(缓慢回血)、大壶众武护符(大幅提升重量)、拉达冈的肖像(减少吟唱时间)等。</p>\n<p>　<span style=\"color:#0066ff;\"><strong>　6、露滴</strong></span></p>\n<p>　　不耗蓝+法伤、法伤+套盾、不耗蓝+套盾都行。</p>\n<p style=\"text-align: center;\"><span style=\"cursor:pointer;\"><span style=\"cursor:pointer;\"><img  src=\"https://img1.ali213.net/glpic/2022/11/24/584_2022112425433688.jpg\"></span></span></p>\n', '2022-11-24 14:55:28', 0, 3, 1, 5);

-- ----------------------------
-- Table structure for article_category
-- ----------------------------
DROP TABLE IF EXISTS `article_category`;
CREATE TABLE `article_category`  (
  `article_id` int(0) NOT NULL,
  `category_id` int(0) NOT NULL,
  PRIMARY KEY (`article_id`, `category_id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  CONSTRAINT `article_category_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `article_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_category
-- ----------------------------
INSERT INTO `article_category` VALUES (1, 1);
INSERT INTO `article_category` VALUES (2, 1);
INSERT INTO `article_category` VALUES (3, 1);
INSERT INTO `article_category` VALUES (5, 1);
INSERT INTO `article_category` VALUES (1, 2);
INSERT INTO `article_category` VALUES (4, 2);
INSERT INTO `article_category` VALUES (1, 4);
INSERT INTO `article_category` VALUES (2, 4);
INSERT INTO `article_category` VALUES (4, 4);
INSERT INTO `article_category` VALUES (1, 5);
INSERT INTO `article_category` VALUES (2, 5);
INSERT INTO `article_category` VALUES (3, 5);
INSERT INTO `article_category` VALUES (5, 5);
INSERT INTO `article_category` VALUES (3, 6);
INSERT INTO `article_category` VALUES (4, 6);
INSERT INTO `article_category` VALUES (5, 6);
INSERT INTO `article_category` VALUES (3, 7);
INSERT INTO `article_category` VALUES (4, 8);
INSERT INTO `article_category` VALUES (3, 9);
INSERT INTO `article_category` VALUES (5, 9);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '单人');
INSERT INTO `category` VALUES (2, '多人');
INSERT INTO `category` VALUES (3, '策略');
INSERT INTO `category` VALUES (4, '剧情');
INSERT INTO `category` VALUES (5, '动作');
INSERT INTO `category` VALUES (6, '冒险');
INSERT INTO `category` VALUES (7, '独立');
INSERT INTO `category` VALUES (8, '解谜');
INSERT INTO `category` VALUES (9, '类魂');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pubdate` datetime(0) NOT NULL,
  `ipaddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `hidden` tinyint(1) NULL DEFAULT NULL,
  `likenum` int(0) NULL DEFAULT NULL,
  `dislikenum` int(0) NULL DEFAULT NULL,
  `reply_for_id` bigint(0) NULL DEFAULT NULL,
  `creator` int(0) NOT NULL,
  `article_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reply_for_id`(`reply_for_id`) USING BTREE,
  INDEX `article_id`(`article_id`) USING BTREE,
  INDEX `creator`(`creator`) USING BTREE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`reply_for_id`) REFERENCES `comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_4` FOREIGN KEY (`creator`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, '这游戏就是开放世界的艺术品', '2021-12-16 22:07:41', '0:0:0:0:0:0:0:1', 0, 11, 1, NULL, 1, 1);
INSERT INTO `comment` VALUES (2, '确实是艺术品没错', '2021-12-22 19:46:44', '0:0:0:0:0:0:0:1', 0, 0, 0, 1, 1, 1);
INSERT INTO `comment` VALUES (3, '你是懂艺术品的', '2021-12-25 19:49:35', '0:0:0:0:0:0:0:1', 0, 1, 0, 2, 1, 1);

-- ----------------------------
-- Table structure for community
-- ----------------------------
DROP TABLE IF EXISTS `community`;
CREATE TABLE `community`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shoplink` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of community
-- ----------------------------
INSERT INTO `community` VALUES (1, '荒野大镖客：救赎2', 'https://store.steampowered.com/app/1174180/Red_Dead_Redemption_2/');
INSERT INTO `community` VALUES (2, '只狼：影逝二度', 'https://store.steampowered.com/app/814380/Sekiro_Shadows_Die_Twice__GOTY_Edition/');
INSERT INTO `community` VALUES (3, '空洞骑士', 'https://store.steampowered.com/app/367520/Hollow_Knight/');
INSERT INTO `community` VALUES (4, '双人成行', 'https://store.steampowered.com/app/1426210/');
INSERT INTO `community` VALUES (5, '艾尔登法环', 'https://store.steampowered.com/app/1245620/');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `photo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `regdate` datetime(0) NULL DEFAULT NULL,
  `forbidden` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `mobile`(`mobile`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  UNIQUE INDEX `nickname`(`nickname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'test', 'e1adc3949ba59abbe56e057f2f883e', 'Steve', '1.jpg', '2021-12-09', 'abc@qq.com', '15145678910', '2021-12-20 17:26:46', 0);
INSERT INTO `user` VALUES (2, 'test1', 'e1adc3949ba59abbe56e057f2f883e', '绝地大叔', '4.jpg', '2021-12-14', 'abc123@qq.com', '15145678911', '2021-12-20 18:39:58', 0);
INSERT INTO `user` VALUES (3, 'test233', 'e1adc3949ba59abbe56e057f2f883e', '三月寒', '2.jpg', '2022-01-18', 'abc456@qq.com', '15145678912', '2022-01-18 12:14:03', 0);

-- ----------------------------
-- Table structure for user_community
-- ----------------------------
DROP TABLE IF EXISTS `user_community`;
CREATE TABLE `user_community`  (
  `user_id` int(0) NOT NULL,
  `community_id` int(0) NOT NULL,
  PRIMARY KEY (`user_id`, `community_id`) USING BTREE,
  INDEX `community_id`(`community_id`) USING BTREE,
  CONSTRAINT `user_community_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_community_ibfk_2` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_community
-- ----------------------------
INSERT INTO `user_community` VALUES (1, 1);
INSERT INTO `user_community` VALUES (1, 2);
INSERT INTO `user_community` VALUES (1, 4);

SET FOREIGN_KEY_CHECKS = 1;

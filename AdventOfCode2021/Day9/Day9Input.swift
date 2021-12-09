//
//  Day9Input.swift
//  AdventOfCode2021
//
//  Created by Inspiro developer on 09/12/2021.
//

import Foundation

class Day9Input
{
  static let EXAMPLE: String = """
2199943210
3987894921
9856789892
8767896789
9899965678
"""
  static let PUZZLE_INPUT: String = """
2448910989999875678989897659865678979789543256899994345698775458934567953123492129654101239876544578
1237899878988954799878789543976899965679874345678989254987654347895978964934989098793212399775433457
0146998769877899987665678932987959876789765456789679102996543235789899879899878999986423986543012456
1235697657656798999523467899898943998899878967994589239865532136996789998789567899876545697652123567
2345798943234567998434578954769892389998989878913498949974321012345899987678456789987656789763234789
3456789892176789876557899763456793478987999989201997898765492643456789876562397893498768899874345899
4567899789238996987678999654567998567896799993219876549876989764567898754321789912989879921965456968
5679987679349895498989298765978987689945898994345985434989878987678919895632689323977989890987568956
8798986568956789349795349899899598795434997989576986321097969998789901987544595459866596791998678945
9987893459967894234696457986789459894329876778987998932356956899899892999665689598754445989899789434
0296432367899943123789978995492345965798765567898998763569845791998789898976789986853239878799896545
9987954456997991014567899876569499896899874346789987654698735692989656767897899875432198965679998678
8598965867896889123458999997678987789978965457893298769798659789976546456989989989544987654588999899
6459876788945679336589998989789876578967987668962129898999768999876435349878978998765976543456789999
4345987899434569445678987679894998679656798878953299997899879123984321298767867899879897654597894989
3257998999856778956799996598943239898945989989967988756799989024595432987553456789989799978689923978
4769879698767989899999995467894549967959876799899876645689992139989549876442135897898678989789999966
5698765459988995678998789355789998656799985686798765434578954398878967996321023456789598999999987755
7987654346999434569876543234567897434988764565689979323589865997657899975432123497993467998789876543
8998431237894323456998432123456795629876543234569897212678979876545679987563445689532356789567997312
9876532356965434597987683274587894312985432123498765346789799998678998987654566794310129893499899101
8997643497897645789998794365698989443987643025789876456995698999889977898765679894321298902989798912
7898954989989756797899865457899679954599853234899989567896987989998666899876789999762567899878687893
6669869979879968956967996878934567895899954345689597688999876579987555789989899987653478998766556954
5456998768767899345756987899026788976798765456993469799789965489876434678999968998764989987654347895
3346989654656789236345698943987899987899877567894579985697893233984323569998959789985695696543236789
1259878943345697101235999432198965498999989678965698764556789102398544569987645689996789985432134899
3498967891257796245679896542019654329678998789877909843545789399987656878999934789987898976543276789
6597658992969895456998789672199793213567899893998912932125689987898967899687895690198987988765357895
7976546789899999769887678993987989901459999901259329431034579876899898976576789789979876899876769904
9875434556799898998766587894696579892398998912345998652149698764789789765465699899865965789999898923
8976513545689767899857456789985468793987897923459876543498976453665688954324679998754234899219987899
7684101235678956895940348999874345689876756894567987654987665342434567895213568999765345678998765678
6543212456789349954321239129863234789765445999698998765696543210123456789101989679876466789987664656
8754326567895457895494345939952155899854329898989439878987794524254567893216796545987878899876543247
9865498978976568976989459898743236798765539767678920989699895965675678964345989434499989999987432018
3976569999797889999978998798654545679876698954567892396543976876799789875999878923234597898997672126
2988978998659999988667899659765667891987987543467893965432987987899893989888968910123456987898743345
1099799987545699876456789534986878972399876431238999896541298998997931298776456923499969876549656456
2345678987656976998967898323987989964459984210267898789732379999876549987654369894988899965439987568
6456789998997965679878987512399999878998765322348989698975467899987998698765456789976799876598998978
7987898999999894999989654323467899989549995434559877567896567898999876549896567898875698989987899989
8998977899986723789399987434689999998732987547698966456797678967899995432997678987654587899976788994
9999865699865612679209876545789998996510198656987654346999789458989876521398989876543456789765456943
9898754987654324568913987976798767989321398767898765107899892349876988320129799987674587898654347892
7769865698965675679894598999897655978992999979999543218999943498765499643234569998775698996543257943
6543979799898786798789679798987543466789899989987654329898654987654398794355678999898789987964348994
7656989989689897897679798687795432345698789997898766436789767899863219989496889999919991099876456789
8967899876568998989578987566679883456997689996519898545678978999642109878989999878909979989987887891
9899999765459899873467895455598764579876568789423999678989999198759298767678998767898965878998998910
7667899657398789962345789353459895689985456678945798989896989239898999856589897658987854567999789323
6556898743235678941034899212567949899893246589657987899765678999986788943476789439876563479989695434
4345699532124789532128998909698934998763123456969976978954569988675677892125895321999432569878989656
3212987643045897645237987898989123569954234767898975767895679876544456789234789430987321298767679867
4324598732126789756746986887679034579874345678997894345689789985432345894345678932965433987654589998
5435679543235678987899765876567945679765456789876561234899899964321246965467789949878649896543434989
7689789854346789898998654335478996789896567898765410136799999875210235997878999899999798789762125678
8799898765457896789987653216345689899987978989654321235678999986471246789999999789654987679981034789
9989999879878965679998872101234578989598989679865452346799989997564356794598898678943986587892157895
8779889989989654678898765412345789765329294589976969459894878998675679893987676567892995456943768934
7656767996799963456789874323556899543210123479897898967943767899986789932976544344569874345894879024
6545657995679874578998765434667898754453234569789987898912456789197899421298432123498765456789989126
7437546789998765789769976567788999966568645997654876799101237893298998932987654345569876769894394234
5321434599899979898659987678899879877679759876543765689292345799999987893598965478978987989995965345
3210125698789198998748998989997667989899899965432254599989476798789876989679879567999998998789876486
5421336987699297899656999399876556799998959875421013989878997897698765878989987679989899345678987587
6533545697578965688967897213987446798976545987532429876569998989549883267896598998876789956989298799
8689666797678934567898986439898335577996434398643534983456789578934994348987439987654567897892109893
9789897898989123458909987598789215466889321239658699892345898789323985469999321096543456789943319932
6999998989292012367919999697692101245678934398799987671236999894319876578998942985432578995399998743
4589999879349249567898954989789322356789545499989876542369899994301987678967959876301999999987898654
3567894567998767688967899879896543587897656989778987654456789989212399989456899965219899898976798786
1678943456789898799456798667999854698998779875667898765867896578993498994343459874398798797545699898
2399432345999979891345897556789765679879898754556999976788965459789997894212346985498678679786789949
7488901499899965989456986434999876789567987652345799987899657345699876789101235696597534567997891234
6567919987678894978967987565678987999479998943456789498986543234598765898913445987694323459899974345
7678998776576799769899298978899298998567898767567891299197654995799954987896567898983210467789765457
8989987655465678958789109989962109997679999978979932489098769889987653976789878999874331235679876788
9899876543234989545678919898743235789789999999989543678969898779976542987991989998765444346789987899
9789987652129895434569898797654876789999988989999654799457987668894321299890199989976556758998998997
7689987543019789523498765689967997999899876578998769892239876556789210135689239876598677869767899976
8579997659198697634989654567899989999798765459999899910198765435698921234568998765439988978956789765
9989998798987589789877653239988769897659976567899989991987654324567892365889219896589999299349899976
9997899997632368999965432129878658789543297678999878989998743213678999876792101989678992101298999897
9876569877521245799876521098965444689910129899999869978999654324567891989895219878989876512347898789
9876439765430235678965432987654323459891339974987645667899876435698943490994398767899765425456997679
8987549897641346889976743498743212345789997653498432458987987898789964591989497656789876536569876567
7698699998656558999989894569954103456899874312397321345696599999899876989878987545798987758998665458
6569989998767789679994987698763212367956965409986532876789321987902999879767897634567898769876532367
7469878999979897567893498789878323898949876598987656797893210976799323965458976545778969978998745456
4359767898989976457965999895989435789432987987698787898964349865988939989569987897989878989899876567
3298657897693495356899896954297576798743798998789898999878959654567898997689798998997989496798987878
4196545695432983248999765433129677899654679679895979579989898943459997898795679329456793245987898989
9989434789545975356789654321098788968995794598984767488998787894567896749896794212399892199876789094
8976545897656996467899965432569899756989899987673456347898676789688965432987895623988943989665789123
7987666789769876578999878543457986549878968987542101236987545678999879651099939799877895976554678934
6598787899878997678995988754567893234569656798763232345965436789999998743237923987656799865443567895
7429899932989698789684598765689942126989343987654343459876545999987659854446799876545987654321289999
3212945893994569896543459876796532017893212399765454678989658998776545966567898765434598765410125678
2101236789876899987432479987897653428943101239876675789998767897654326977878999982123459886531234567
"""
}